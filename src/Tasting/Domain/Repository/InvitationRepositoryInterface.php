<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Repository;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use TegCorp\SharedKernelBundle\Domain\Repository\RepositoryInterface;

/**
 * @extends RepositoryInterface<Invitation>
 */
interface InvitationRepositoryInterface extends RepositoryInterface
{
    public function ofId(InvitationId $id): ?Invitation;

    public function sortCreatedAt(): self;

    public function withParticipant(ParticipantId $targetId): self;

    public function withParticipantAndTasting(ParticipantId $targetId, TastingId $subjectId): self;

    public function add(Invitation $invitation): void;

    public function nextIdentity(): InvitationId;

    public function update(): void;

    public function delete(Invitation $invitation): void;
}
