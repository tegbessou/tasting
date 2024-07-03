<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Repository;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\ValueObject\ParticipantId;

interface ParticipantWriteRepositoryInterface
{
    public function ofId(ParticipantId $id): ?Participant;

    public function add(Participant $participant): void;

    public function nextIdentity(): ParticipantId;
}
