<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\Symfony\Security\Authenticator;

use App\Security\Application\Command\AuthenticateUserCommand;
use App\Security\Application\Query\GetUserQuery;
use App\Security\Domain\Exception\ExpiredTokenException;
use App\Security\Domain\Exception\InvalidPayloadException;
use App\Security\Domain\Exception\InvalidTokenException;
use App\Security\Infrastructure\Symfony\Security\Model\UserModel;
use Lexik\Bundle\JWTAuthenticationBundle\Response\JWTAuthenticationFailureResponse;
use Lexik\Bundle\JWTAuthenticationBundle\TokenExtractor\TokenExtractorInterface;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Http\Authenticator\AbstractAuthenticator;
use Symfony\Component\Security\Http\Authenticator\Passport\Badge\UserBadge;
use Symfony\Component\Security\Http\Authenticator\Passport\Passport;
use Symfony\Component\Security\Http\Authenticator\Passport\SelfValidatingPassport;
use Symfony\Contracts\Translation\TranslatorInterface;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Application\Query\QueryBusInterface;

#[WithMonologChannel('security')]
final class FirebaseAuthenticator extends AbstractAuthenticator
{
    public function __construct(
        protected readonly TokenExtractorInterface $tokenExtractor,
        protected readonly CommandBusInterface $commandBus,
        protected readonly QueryBusInterface $queryBus,
        protected readonly TranslatorInterface $translator,
        protected readonly LoggerInterface $logger,
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
            $this->logger->error(
                'Unable to extract a JWT token from the request.',
            );

            throw new \LogicException('Unable to extract a JWT token from the request. Also, make sure to call `supports()` before `authenticate()` to get a proper client error.');
        }

        $providerId = $request->headers->get(FirebaseAuthenticatorInterface::HEADER_IDENTITY_PROVIDER);

        if ($providerId === null) {
            $this->logger->error(
                'No provider ID in request.',
            );

            throw new \LogicException('No provider ID in request.');
        }

        try {
            $userAuthenticated = $this->commandBus->dispatch(
                new AuthenticateUserCommand(
                    $token,
                    $providerId,
                )
            );
        } catch (InvalidTokenException $exception) {
            $this->logger->error(
                'Log in user: Invalid token',
                [
                    'exception' => $exception,
                    'provider' => $providerId,
                ],
            );

            throw new AuthenticationException($exception->getMessage());
        } catch (ExpiredTokenException $exception) {
            $this->logger->error(
                'Log in user: Token expired',
                [
                    'exception' => $exception,
                    'provider' => $providerId,
                ],
            );

            throw new AuthenticationException($exception->getMessage());
        } catch (InvalidPayloadException $exception) {
            $this->logger->error(
                'Log in user: Invalid payload',
                [
                    'exception' => $exception,
                    'provider' => $providerId,
                ],
            );

            throw new AuthenticationException($exception->getMessage());
        }

        $user = $this->queryBus->ask(
            new GetUserQuery(
                $userAuthenticated->email()->value(),
            ),
        );

        $email = $user->email;

        return new SelfValidatingPassport(
            new UserBadge(
                $email,
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

    private function loadUser(string $email): UserModel
    {
        $userEntity = $this->queryBus->ask(
            new GetUserQuery(
                $email,
            ),
        );

        return new UserModel(
            $userEntity->id,
            $userEntity->email,
        );
    }
}
