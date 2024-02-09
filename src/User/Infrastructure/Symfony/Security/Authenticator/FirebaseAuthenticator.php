<?php

declare(strict_types=1);

namespace App\User\Infrastructure\Symfony\Security\Authenticator;

use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Application\Query\QueryBusInterface;
use App\User\Application\Command\AuthenticateUserCommand;
use App\User\Application\Query\GetUserQuery;
use App\User\Domain\Exception\ExpiredTokenException;
use App\User\Domain\Exception\InvalidPayloadException;
use App\User\Domain\Exception\InvalidTokenException;
use App\User\Domain\ValueObject\UserEmail;
use App\User\Infrastructure\Symfony\Security\Model\User;
use Lexik\Bundle\JWTAuthenticationBundle\Response\JWTAuthenticationFailureResponse;
use Lexik\Bundle\JWTAuthenticationBundle\TokenExtractor\TokenExtractorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Http\Authenticator\AbstractAuthenticator;
use Symfony\Component\Security\Http\Authenticator\Passport\Badge\UserBadge;
use Symfony\Component\Security\Http\Authenticator\Passport\Passport;
use Symfony\Component\Security\Http\Authenticator\Passport\SelfValidatingPassport;
use Symfony\Contracts\Translation\TranslatorInterface;

final class FirebaseAuthenticator extends AbstractAuthenticator
{
    public function __construct(
        protected readonly TokenExtractorInterface $tokenExtractor,
        protected readonly CommandBusInterface $commandBus,
        protected readonly QueryBusInterface $queryBus,
        protected readonly TranslatorInterface $translator,
    ) {
    }

    #[\Override]
    public function supports(Request $request): ?bool
    {
        return $this->tokenExtractor->extract($request) !== false
            && $request->headers->has(FirebaseAuthenticatorInterface::HEADER_IDENTITY_PROVIDER)
        ;
    }

    #[\Override]
    public function authenticate(Request $request): Passport
    {
        $token = $this->tokenExtractor->extract($request);

        if ($token === false || $token === '') {
            throw new \LogicException('Unable to extract a JWT token from the request. Also, make sure to call `supports()` before `authenticate()` to get a proper client error.');
        }

        $providerId = $request->headers->get(FirebaseAuthenticatorInterface::HEADER_IDENTITY_PROVIDER);

        if ($providerId === null) {
            throw new \LogicException('No provider ID in request.');
        }

        try {
            $userAuthenticated = $this->commandBus->dispatch(
                new AuthenticateUserCommand(
                    $token,
                    $providerId,
                )
            );
        } catch (InvalidTokenException|ExpiredTokenException|InvalidPayloadException $exception) {
            throw new AuthenticationException($exception->getMessage());
        }

        $user = $this->queryBus->ask(
            new GetUserQuery(
                $userAuthenticated->email(),
            ),
        );

        $email = $user->email();

        return new SelfValidatingPassport(
            new UserBadge(
                $email->value(),
                fn () => $this->loadUser($email),
            )
        );
    }

    #[\Override]
    public function onAuthenticationSuccess(Request $request, TokenInterface $token, string $firewallName): ?Response
    {
        return null;
    }

    #[\Override]
    public function onAuthenticationFailure(Request $request, AuthenticationException $exception): ?Response
    {
        $errorMessage = strtr($exception->getMessageKey(), $exception->getMessageData());
        if ($this->translator !== null) {
            $errorMessage = $this->translator->trans($exception->getMessageKey(), $exception->getMessageData(), 'security');
        }

        return new JWTAuthenticationFailureResponse($errorMessage);
    }

    private function loadUser(UserEmail $email): User
    {
        $userEntity = $this->queryBus->ask(
            new GetUserQuery(
                $email,
            ),
        );

        return new User(
            $userEntity->id()->value(),
            $userEntity->email()->value(),
        );
    }
}
