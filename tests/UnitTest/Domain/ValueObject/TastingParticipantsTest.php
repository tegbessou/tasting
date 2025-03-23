<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\UnitTest\Domain\ValueObject;

use EmpireDesAmis\Tasting\Domain\ValueObject\ParticipantId;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingParticipants;
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

    public function testDelete(): void
    {
        $tastingParticipants = new TastingParticipants(
            [
                'hugues.gobet@gmail.com',
                'root@gmail.com',
            ],
        );

        $participantToAdd = ParticipantId::fromString('root@gmail.com');

        $tastingParticipants = $tastingParticipants->delete($participantToAdd);

        $this->assertEquals(
            [
                'hugues.gobet@gmail.com',
            ],
            $tastingParticipants->values(),
        );
    }
}
