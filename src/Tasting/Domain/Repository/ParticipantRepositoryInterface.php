<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Repository;

use App\Shared\Domain\Repository\RepositoryInterface;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantId;

/**
 * @extends RepositoryInterface<Participant>
 */
interface ParticipantRepositoryInterface extends RepositoryInterface
{
    public function ofId(ParticipantId $id): ?Participant;

    public function ofEmail(ParticipantEmail $email): ?Participant;

    public function exist(ParticipantId $id): bool;

    public function add(Participant $participant): void;

    public function nextIdentity(): ParticipantId;
}
