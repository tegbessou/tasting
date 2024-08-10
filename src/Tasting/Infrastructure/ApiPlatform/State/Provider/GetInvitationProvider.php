<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Shared\Application\Query\QueryBusInterface;
use App\Tasting\Application\Query\GetInvitationQuery;
use App\Tasting\Infrastructure\ApiPlatform\Resource\InvitationResource;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @implements ProviderInterface<InvitationResource>
 */
final readonly class GetInvitationProvider implements ProviderInterface
{
    public function __construct(
        private QueryBusInterface $queryBus,
    ) {
    }

    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): InvitationResource
    {
        $invitation = $this->queryBus->ask(new GetInvitationQuery($uriVariables['id']->toRfc4122()));

        if ($invitation === null) {
            throw new NotFoundHttpException();
        }

        return InvitationResource::fromModel($invitation);
    }
}
