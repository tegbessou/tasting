<?php

declare(strict_types=1);

namespace DataFixtures\Tasting;

use App\Tasting\Domain\ValueObject\ParticipantId;
use Doctrine\Persistence\ObjectManager;

final class ParticipantFixtures
{
    public function load(ObjectManager $manager): void
    {
        $participants = [];
        $participants[] = Participant::create(
            ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ParticipantFullName::fromString('Hugues Gobet'),
        );

        $participants[] = Participant::create(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            ParticipantEmail::fromString('root@gmail.com'),
            ParticipantFullName::fromString('Root'),
        );

        foreach ($participants as $participant) {
            $manager->persist($participant);
        }

        $manager->flush();
    }
}
