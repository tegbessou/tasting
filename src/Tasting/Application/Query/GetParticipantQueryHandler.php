<?php

declare(strict_types=1);

namespace App\Tasting\Application\Query;

use App\Shared\Application\Query\AsQueryHandler;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Repository\ParticipantRepositoryInterface;
use App\Tasting\Domain\ValueObject\ParticipantId;

#[AsQueryHandler]
final readonly class GetParticipantQueryHandler
{
    public function __construct(
        private ParticipantRepositoryInterface $participantRepository,
    ) {
    }

    public function __invoke(GetParticipantQuery $query): ?Participant
    {
        return $this->participantRepository->ofId(
            ParticipantId::fromString($query->id),
        );
    }
}
