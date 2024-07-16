<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\Tasting\Domain\Service;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Exception\OwnerCannotBeInvitedToTastingException;
use App\Tasting\Domain\Exception\ParticipantsAlreadyInvitedException;
use App\Tasting\Domain\Service\InviteParticipantService;
use App\Tasting\Domain\ValueObject\BottleId;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantFullName;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use PHPUnit\Framework\TestCase;

final class InviteParticipantServiceTest extends TestCase
{
    public function testInviteParticipantsFailedOwnerCannotBeInvited(): void
    {
        $inviteParticipantService = new InviteParticipantService();

        $participant = Participant::create(
            ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleId::fromString('4eb449d9-7d23-4984-a68d-77aa19fccc60'),
            $participant,
        );

        $this->expectException(OwnerCannotBeInvitedToTastingException::class);

        $inviteParticipantService->canInviteParticipants(
            $tasting,
            [$participant],
        );
    }

    public function testInviteParticipantsFailedParticipantAlreadyInvited(): void
    {
        $inviteParticipantService = new InviteParticipantService();

        $participant = Participant::create(
            ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );

        $newParticipant = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleId::fromString('4eb449d9-7d23-4984-a68d-77aa19fccc60'),
            $participant,
        );

        $tasting->inviteParticipants([
            $newParticipant,
        ]);

        $this->expectException(ParticipantsAlreadyInvitedException::class);
        $this->expectExceptionMessage('Participants Root are already invited');

        $inviteParticipantService->canInviteParticipants(
            $tasting,
            [$newParticipant],
        );
    }
}
