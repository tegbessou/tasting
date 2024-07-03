<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\BottleInventory\Application\Query\GetBottleQuery;
use App\BottleInventory\Infrastructure\ApiPlatform\Resource\BottleResource;
use App\Shared\Application\Query\QueryBusInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @implements ProviderInterface<BottleResource>
 */
final readonly class GetBottleProvider implements ProviderInterface
{
    public function __construct(
        private QueryBusInterface $queryBus,
    ) {
    }

    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): ?BottleResource
    {
        $bottle = $this->queryBus->ask(new GetBottleQuery($uriVariables['id']));

        if ($bottle === null) {
            throw new NotFoundHttpException();
        }

        return BottleResource::fromModel($bottle);
    }
}
