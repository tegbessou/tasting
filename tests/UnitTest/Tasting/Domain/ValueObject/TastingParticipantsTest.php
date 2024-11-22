<?php

declare(strict_types=1);

namespace UnitTest\Tasting\Domain\ValueObject;

use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingParticipants;
use PHPUnit\Framework\TestCase;

final class TastingParticipantsTest extends TestCase
{
    public function testContains(): void
    {
        $participants = new TastingParticipants(
            ['hugues.gobet@gmail.com']
        );

        $this->assertTrue(
            $participants->contains(
                ParticipantId::fromString('hugues.gobet@gmail.com'),
            ),
        );

        $this->assertFalse(
            $participants->contains(
                ParticipantId::fromString('root@gmail.com'),
            ),
        );
    }

    public function testAdd(): void
    {
        $tastingParticipants = new TastingParticipants(
            ['hugues.gobet@gmail.com'],
        );

        $participantToAdd = ParticipantId::fromString('root@gmail.com');

        $tastingParticipants = $tastingParticipants->add($participantToAdd);

        $this->assertEquals(
            [
                'hugues.gobet@gmail.com',
                'root@gmail.com',
            ],
            $tastingParticipants->values(),
        );
    }

    public function testRemove(): void
    {
        $tastingParticipants = new TastingParticipants(
            [
                'hugues.gobet@gmail.com',
                'root@gmail.com',
            ],
        );

        $participantToAdd = ParticipantId::fromString('root@gmail.com');

        $tastingParticipants = $tastingParticipants->remove($participantToAdd);

        $this->assertEquals(
            [
                'hugues.gobet@gmail.com',
            ],
            $tastingParticipants->values(),
        );
    }
}
