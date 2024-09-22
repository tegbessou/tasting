<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Shared\Application\Query\QueryBusInterface;
use App\Tasting\Application\Query\GetParticipantQuery;
use App\Tasting\Infrastructure\ApiPlatform\Resource\ParticipantResource;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @implements ProviderInterface<ParticipantResource>
 */
#[WithMonologChannel('tasting')]
final readonly class GetParticipantProvider implements ProviderInterface
{
    public function __construct(
        private QueryBusInterface $queryBus,
        private LoggerInterface $logger,
    ) {
    }

    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): ParticipantResource
    {
        $owner = $this->queryBus->ask(new GetParticipantQuery($uriVariables['id']->toRfc4122()));

        if ($owner === null) {
            $this->logger->error(
                'Get participant: Participant not found',
                [
                    'participantId' => $uriVariables['id']->toRfc4122(),
                ],
            );

            throw new NotFoundHttpException();
        }

        return ParticipantResource::fromModel($owner);
    }
}
