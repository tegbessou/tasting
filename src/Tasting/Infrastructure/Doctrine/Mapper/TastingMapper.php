<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Mapper;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\ValueObject\Bottle;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingInvitations;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use App\Tasting\Domain\ValueObject\TastingParticipants;
use App\Tasting\Infrastructure\Doctrine\Entity\Invitation as InvitationDoctrine;
use App\Tasting\Infrastructure\Doctrine\Entity\Tasting as TastingDoctrine;

final readonly class TastingMapper
{
    public static function toDomain(TastingDoctrine $tasting): Tasting
    {
        $invitations = $tasting->invitations->map(static fn (InvitationDoctrine $invitation) => InvitationMapper::toDomain($invitation));

        return new Tasting(
            TastingId::fromString($tasting->id),
            Bottle::create(
                $tasting->bottleId,
                $tasting->bottleName,
                $tasting->bottleWineType->value,
            ),
            TastingParticipants::fromArray($tasting->participants),
            TastingOwnerId::fromString($tasting->ownerId),
            TastingInvitations::fromArray($invitations->toArray()),
        );
    }

    public static function toInfrastructurePersist(Tasting $tasting): TastingDoctrine
    {
        return new TastingDoctrine(
            $tasting->id()->value(),
            $tasting->bottle()->id(),
            $tasting->bottle()->name(),
            $tasting->bottle()->wineType(),
            $tasting->participants()->values(),
            $tasting->ownerId()->value(),
        );
    }

    public static function toInfrastructureUpdate(Tasting $tasting, TastingDoctrine $tastingDoctrine): TastingDoctrine
    {
        $tastingDoctrine->participants = $tasting->participants()->values();
        self::synchronizeInvitations($tasting, $tastingDoctrine);

        return $tastingDoctrine;
    }

    public static function synchronizeInvitations(Tasting $tasting, TastingDoctrine $tastingDoctrine): void
    {
        /** @var Invitation $invitation */
        foreach ($tasting->invitations()->values() as $invitation) {
            $invitationDoctrineFound = $tastingDoctrine->invitations->findFirst(static fn (int|string $key, InvitationDoctrine $invitationDoctrine) => $invitation->id()->value() === $invitationDoctrine->id);

            if ($invitationDoctrineFound === null) {
                $tastingDoctrine->addInvitation(
                    InvitationMapper::toInfrastructurePersist($invitation, $tastingDoctrine),
                );

                continue;
            }

            $tastingDoctrine->addInvitation(
                InvitationMapper::toInfrastructureUpdate($invitation, $invitationDoctrineFound),
            );
        }

        $tastingDoctrine->invitations->map(static function (InvitationDoctrine $invitationDoctrine) use ($tasting, $tastingDoctrine) {
            if ($tasting->invitations()->find(InvitationId::fromString($invitationDoctrine->id)) !== null) {
                return;
            }

            $tastingDoctrine->deleteInvitation($invitationDoctrine);
        });
    }
}
