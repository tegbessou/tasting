<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\BottleInventory\Application\Query\GetOwnerQuery;
use App\BottleInventory\Infrastructure\ApiPlatform\Resource\OwnerResource;
use App\Shared\Application\Query\QueryBusInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @implements ProviderInterface<OwnerResource>
 */
final readonly class GetOwnerProvider implements ProviderInterface
{
    public function __construct(
        private QueryBusInterface $queryBus,
    ) {
    }

    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): object|array|null
    {
        $owner = $this->queryBus->ask(new GetOwnerQuery($uriVariables['id']->toRfc4122()));

        if ($owner === null) {
            throw new NotFoundHttpException();
        }

        return OwnerResource::fromModel($owner);
    }
}
