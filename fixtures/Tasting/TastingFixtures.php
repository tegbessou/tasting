<?php

declare(strict_types=1);

namespace DataFixtures\Tasting;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\ValueObject\BottleName;
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

        $tastings = [];

        $tastings[] = Tasting::create(
            TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            BottleName::fromString('Domaine Leflaive Montrachet Grand Cru 2016'),
            $participantHugues,
        );

        $tastings[] = Tasting::create(
            TastingId::fromString('964a3cb8-5fbd-4678-a5cd-e371c09ea722'),
            BottleName::fromString('Château Latour 2010'),
            $participantHugues,
        );

        foreach ($tastings as $tasting) {
            $manager->persist($tasting);
        }

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
