<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection\Projector;

use App\Tasting\Application\Adapter\InvitationAdapterInterface;
use App\Tasting\Application\Exception\InvitationFromDoesntExistException;
use App\Tasting\Application\ReadModel\Invitation;
use App\Tasting\Domain\Adapter\UserAdapterInterface;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\User;
use App\Tasting\Domain\ValueObject\UserEmail;

final readonly class CreateInvitationProjector
{
    public function __construct(
        private InvitationAdapterInterface $invitationAdapter,
        private UserAdapterInterface $userAdapter,
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
        $from = $this->userAdapter->ofEmail(ParticipantId::fromString($fromId));

        if ($from === null) {
            throw new InvitationFromDoesntExistException($fromId);
        }

        $target = $this->userAdapter->ofEmail(ParticipantId::fromString($targetId));

        if ($target === null) {
            $target = new User(
                UserEmail::fromString($targetId),
            );
        }

        $invitation = new Invitation(
            $id,
            $tastingId,
            $bottleName,
            $from->email()->value(),
            $from->fullName()?->value() ?? throw new \LogicException(),
            $target->email()->value(),
            $link,
            $createdAt,
            targetName: $target->fullName()?->value() ?? null,
        );

        $this->invitationAdapter->add($invitation);
    }
}
