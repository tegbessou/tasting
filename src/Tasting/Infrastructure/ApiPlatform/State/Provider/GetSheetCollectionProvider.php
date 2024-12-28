<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Tasting\Application\Query\GetSheetsQuery;
use App\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionSheetResource;
use TegCorp\SharedKernelBundle\Application\Query\QueryBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\ApiPlatform\State\Pagination\Paginator;

/**
 * @implements ProviderInterface<GetCollectionSheetResource>
 */
final readonly class GetSheetCollectionProvider implements ProviderInterface
{
    public function __construct(
        private QueryBusInterface $queryBus,
    ) {
    }

    /**
     * @return Paginator<GetCollectionSheetResource>|list<GetCollectionSheetResource>
     */
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): Paginator|array
    {
        $tastingId = $context['filters']['tastingId'] ?? null;
        $participant = $context['filters']['participant'] ?? null;

        $models = $this->queryBus->ask(
            new GetSheetsQuery(
                $tastingId,
                $participant,
            ),
        );

        $resources = [];

        foreach ($models as $model) {
            $resources[] = GetCollectionSheetResource::fromDomain($model);
        }

        if (null !== $paginator = $models->paginator()) {
            $resources = new Paginator(
                new \ArrayIterator($resources),
                (float) $paginator->getCurrentPage(),
                (float) $paginator->getItemsPerPage(),
                (float) $paginator->getLastPage(),
                (float) $paginator->getTotalItems(),
            );
        }

        return $resources;
    }
}
