<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Security\Application\Query\GetUserIsCurrentQuery;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Infrastructure\ApiPlatform\Resource\UserResource;
use App\Shared\Application\Query\QueryBusInterface;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @implements ProviderInterface<UserResource>
 */
#[WithMonologChannel('security')]
final readonly class GetUserProvider implements ProviderInterface
{
    public function __construct(
        private QueryBusInterface $queryBus,
        private LoggerInterface $logger,
    ) {
    }

    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): UserResource
    {
        $user = $this->queryBus->ask(
            new GetUserIsCurrentQuery(
                UserEmail::fromString($uriVariables['email']),
            ),
        );

        if ($user === null) {
            $this->logger->error(
                'Get user: User not found',
                [
                    'email' => $uriVariables['email'],
                ],
            );

            throw new NotFoundHttpException();
        }

        return UserResource::fromValue($user);
    }
}
