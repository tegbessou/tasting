<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Bottle\Application\Query\GetBottleQuery;
use App\Bottle\Infrastructure\ApiPlatform\Resource\BottleResource;
use App\Shared\Application\Query\QueryBusInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @implements ProviderInterface<BottleResource>
 */
final readonly class GetProvider implements ProviderInterface
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
