<?php

declare(strict_types=1);

namespace DataFixtures\Tasting;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\ValueObject\BottleId;
use App\Tasting\Domain\ValueObject\TastingId;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Persistence\ObjectManager;

final class TastingFixtures extends Fixture implements DependentFixtureInterface
{
    #[\Override]
    public function load(ObjectManager $manager): void
    {
        $participantHugues = $manager
            ->getRepository(Participant::class)
            ->find('9964e539-05ff-4611-b39c-ffd6d108b8b7')
        ;

        $tasting = Tasting::create(
            TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            BottleId::fromString('5ec0917b-179f-46e4-87d6-db76fbddf45f'),
            $participantHugues,
        );

        $manager->persist($tasting);
        $manager->flush();
    }

    #[\Override]
    public function getDependencies(): array
    {
        return [
            ParticipantFixtures::class,
        ];
    }
}
