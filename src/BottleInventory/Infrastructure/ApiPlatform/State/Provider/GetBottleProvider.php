<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\BottleInventory\Application\Query\GetBottleQuery;
use App\BottleInventory\Infrastructure\ApiPlatform\Resource\BottleResource;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use TegCorp\SharedKernelBundle\Application\Query\QueryBusInterface;

/**
 * @implements ProviderInterface<BottleResource>
 */
#[WithMonologChannel('bottle_inventory')]
final readonly class GetBottleProvider implements ProviderInterface
{
    public function __construct(
        private QueryBusInterface $queryBus,
        private LoggerInterface $logger,
    ) {
    }

    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): ?BottleResource
    {
        $bottle = $this->queryBus->ask(new GetBottleQuery($uriVariables['id']));

        if ($bottle === null) {
            $this->logger->error(
                'Get bottle: Bottle not found',
                [
                    'bottleId' => $uriVariables['id'],
                ],
            );

            throw new NotFoundHttpException();
        }

        return BottleResource::fromModel($bottle);
    }
}
