<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use EmpireDesAmis\Tasting\Application\Query\GetInvitationsQuery;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionInvitationResource;
use TegCorp\SharedKernelBundle\Application\Query\QueryBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\ApiPlatform\State\Pagination\Paginator;

/**
 * @implements ProviderInterface<GetCollectionInvitationResource>
 */
final readonly class GetInvitationCollectionProvider implements ProviderInterface
{
    public function __construct(
        private QueryBusInterface $queryBus,
    ) {
    }

    /**
     * @return Paginator<GetCollectionInvitationResource>|list<GetCollectionInvitationResource>
     */
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): Paginator|array
    {
        $targetEmail = $context['filters']['target.id'] ?? null;

        $models = $this->queryBus->ask(
            new GetInvitationsQuery(
                $targetEmail,
            ),
        );

        $resources = [];

        foreach ($models as $model) {
            $resources[] = GetCollectionInvitationResource::fromModel($model);
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
