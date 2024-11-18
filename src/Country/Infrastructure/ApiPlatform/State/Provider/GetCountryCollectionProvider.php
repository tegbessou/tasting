<?php

declare(strict_types=1);

namespace App\Country\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\Pagination\Pagination;
use ApiPlatform\State\ProviderInterface;
use App\Country\Application\Query\GetCountriesQuery;
use App\Country\Infrastructure\ApiPlatform\Resource\GetCollectionCountryResource;
use TegCorp\SharedKernelBundle\Application\Query\QueryBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\ApiPlatform\State\Pagination\Paginator;

/**
 * @implements ProviderInterface<GetCollectionCountryResource>
 */
final readonly class GetCountryCollectionProvider implements ProviderInterface
{
    public function __construct(
        private QueryBusInterface $queryBus,
        private Pagination $pagination,
    ) {
    }

    /**
     * @return Paginator<GetCollectionCountryResource>|list<GetCollectionCountryResource>
     */
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array|Paginator
    {
        $name = $context['filters']['name'] ?? null;
        $page = $limit = 0;

        if ($this->pagination->isEnabled($operation)) {
            $page = $this->pagination->getPage($context);
            $limit = $this->pagination->getLimit($operation, $context);
        }

        $models = $this->queryBus->ask(new GetCountriesQuery($name, $page, $limit));

        $resources = [];

        foreach ($models as $model) {
            $resources[] = GetCollectionCountryResource::fromModel($model);
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
