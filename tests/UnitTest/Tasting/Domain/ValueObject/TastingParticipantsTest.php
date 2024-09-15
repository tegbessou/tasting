<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\Tasting\Domain\ValueObject;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantFullName;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingParticipants;
use PHPUnit\Framework\TestCase;

final class TastingParticipantsTest extends TestCase
{
    public function testContains(): void
    {
        $participants = new TastingParticipants(
            ['9964e539-05ff-4611-b39c-ffd6d108b8b7']
        );

        $this->assertTrue(
            $participants->contains(
                Participant::create(
                    ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
                    ParticipantEmail::fromString('hugues.gobet@gmail.com'),
                    ParticipantFullName::fromString('Hugues Gobet'),
                ),
            ),
        );

        $this->assertFalse(
            $participants->contains(
                Participant::create(
                    ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
                    ParticipantEmail::fromString('root@gmail.com'),
                    ParticipantFullName::fromString('Root'),
                ),
            ),
        );
    }

    public function testAdd(): void
    {
        $tastingParticipants = new TastingParticipants(
            ['1dc0315e-c0b1-4236-a29a-309bfaba6597'],
        );

        $participantToAdd = ParticipantId::fromString('645bab14-29b7-40bd-9983-fd1efe86fcf1');

        $tastingParticipants = $tastingParticipants->add($participantToAdd);

        $this->assertEquals(
            [
                '1dc0315e-c0b1-4236-a29a-309bfaba6597',
                '645bab14-29b7-40bd-9983-fd1efe86fcf1',
            ],
            $tastingParticipants->values(),
        );
    }

    public function testRemove(): void
    {
        $tastingParticipants = new TastingParticipants(
            [
                '1dc0315e-c0b1-4236-a29a-309bfaba6597',
                '645bab14-29b7-40bd-9983-fd1efe86fcf1',
            ],
        );

        $participantToAdd = ParticipantId::fromString('645bab14-29b7-40bd-9983-fd1efe86fcf1');

        $tastingParticipants = $tastingParticipants->remove($participantToAdd);

        $this->assertEquals(
            [
                '1dc0315e-c0b1-4236-a29a-309bfaba6597',
            ],
            $tastingParticipants->values(),
        );
    }
}
