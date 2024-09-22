<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\BottleInventory\Application\Query\GetOwnerQuery;
use App\BottleInventory\Infrastructure\ApiPlatform\Resource\OwnerResource;
use App\Shared\Application\Query\QueryBusInterface;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @implements ProviderInterface<OwnerResource>
 */
#[WithMonologChannel('bottle_inventory')]
final readonly class GetOwnerProvider implements ProviderInterface
{
    public function __construct(
        private QueryBusInterface $queryBus,
        private LoggerInterface $logger,
    ) {
    }

    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): object|array|null
    {
        $owner = $this->queryBus->ask(new GetOwnerQuery($uriVariables['id']->toRfc4122()));

        if ($owner === null) {
            $this->logger->error(
                'Get owner: Owner not found',
                [
                    'ownerId' => $uriVariables['id']->toRfc4122(),
                ],
            );

            throw new NotFoundHttpException();
        }

        return OwnerResource::fromModel($owner);
    }
}
