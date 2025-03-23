<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection\Projector;

use EmpireDesAmis\Tasting\Application\Adapter\InvitationAdapterInterface;
use EmpireDesAmis\Tasting\Application\Exception\InvitationFromDoesntExistException;
use EmpireDesAmis\Tasting\Application\ReadModel\Invitation;
use EmpireDesAmis\Tasting\Domain\Adapter\ParticipantAdapterInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\ParticipantId;
use EmpireDesAmis\Tasting\Domain\ValueObject\User;
use EmpireDesAmis\Tasting\Domain\ValueObject\UserEmail;

final readonly class CreateInvitationProjector
{
    public function __construct(
        private InvitationAdapterInterface $invitationAdapter,
        private ParticipantAdapterInterface $userAdapter,
    ) {
    }

    public function project(
        string $id,
        string $tastingId,
        string $bottleName,
        string $fromId,
        string $targetId,
        string $link,
        \DateTimeImmutable $createdAt,
    ): void {
        $from = $this->userAdapter->ofId(ParticipantId::fromString($fromId));

        if ($from === null) {
            throw new InvitationFromDoesntExistException($fromId);
        }

        $target = $this->userAdapter->ofId(ParticipantId::fromString($targetId));

        if ($target === null) {
            $target = new User(
                UserEmail::fromString($targetId),
            );
        }

        $invitation = new Invitation(
            $id,
            $tastingId,
            $bottleName,
            $from->id()->value(),
            $from->fullName()?->value() ?? throw new \LogicException(),
            $target->id()->value(),
            $link,
            $createdAt,
            targetFullName: $target->fullName()?->value() ?? null,
        );

        $this->invitationAdapter->add($invitation);
    }
}
