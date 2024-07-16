<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Repository;

use App\Shared\Domain\Repository\ReadRepositoryInterface;
use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;

/**
 * @extends ReadRepositoryInterface<Invitation>
 */
interface InvitationReadRepositoryInterface extends ReadRepositoryInterface
{
    public function withParticipant(ParticipantId $targetId): self;

    public function withParticipantAndTasting(ParticipantId $targetId, TastingId $subjectId): self;
}
