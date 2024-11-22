<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Mapper;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\ValueObject\InvitationCreatedAt;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationLink;
use App\Tasting\Domain\ValueObject\InvitationSentAt;
use App\Tasting\Domain\ValueObject\InvitationStatus;
use App\Tasting\Domain\ValueObject\InvitationTarget;
use App\Tasting\Domain\ValueObject\InvitationUpdatedAt;
use App\Tasting\Infrastructure\Doctrine\Entity\Invitation as InvitationDoctrine;
use App\Tasting\Infrastructure\Doctrine\Entity\Tasting as TastingDoctrine;

final readonly class InvitationMapper
{
    public static function toDomain(InvitationDoctrine $invitation): Invitation
    {
        return new Invitation(
            InvitationId::fromString($invitation->id),
            InvitationTarget::fromString($invitation->targetId),
            InvitationLink::fromString($invitation->link),
            InvitationStatus::fromString($invitation->status->value),
            $invitation->createdAt !== null
                ? new InvitationCreatedAt($invitation->createdAt)
                : throw new \LogicException('InvitationMapper Created at must be define before read invitation data'),
            $invitation->updatedAt !== null
                ? new InvitationUpdatedAt($invitation->updatedAt)
                : null,
            $invitation->sentAt !== null
                ? new InvitationSentAt($invitation->sentAt)
                : null,
        );
    }

    public static function toInfrastructurePersist(
        Invitation $invitation,
        TastingDoctrine $tastingDoctrine,
    ): InvitationDoctrine {
        return new InvitationDoctrine(
            $invitation->id()->value(),
            $tastingDoctrine,
            $invitation->target()->value(),
            $invitation->link()->value(),
            $invitation->status()->value(),
            $invitation->createdAt()->value(),
            $invitation->sentAt()?->value() ?: null,
            $invitation->updatedAt()?->value() ?: null,
        );
    }

    public static function toInfrastructureUpdate(
        Invitation $invitation,
        InvitationDoctrine $invitationDoctrine,
    ): InvitationDoctrine {
        $invitationDoctrine->targetId = $invitation->target()->value();
        $invitationDoctrine->link = $invitation->link()->value();
        $invitationDoctrine->status = $invitation->status()->value();
        $invitationDoctrine->updatedAt = $invitation->updatedAt()?->value() ?? null;
        $invitationDoctrine->sentAt = $invitation->sentAt()?->value() ?? null;

        return $invitationDoctrine;
    }
}
