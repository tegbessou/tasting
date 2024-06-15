<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Security\Application\Query\GetUserIsCurrentQuery;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Infrastructure\ApiPlatform\Resource\UserResource;
use App\Shared\Application\Query\QueryBusInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @implements ProviderInterface<UserResource>
 */
final readonly class GetUserProvider implements ProviderInterface
{
    public function __construct(
        private QueryBusInterface $queryBus,
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
            throw new NotFoundHttpException();
        }

        return UserResource::fromValue($user);
    }
}
