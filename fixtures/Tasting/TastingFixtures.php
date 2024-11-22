<?php

declare(strict_types=1);

namespace DataFixtures\Tasting;

use App\Tasting\Infrastructure\Doctrine\Entity\Tasting;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

final class TastingFixtures extends Fixture
{
    #[\Override]
    public function load(ObjectManager $manager): void
    {
        $tastings = [];

        $tastings[] = new Tasting(
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            'Domaine Leflaive Montrachet Grand Cru 2016',
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
        );

        $tastings[] = new Tasting(
            '964a3cb8-5fbd-4678-a5cd-e371c09ea722',
            'Château Latour 2010',
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
        );

        foreach ($tastings as $tasting) {
            $manager->persist($tasting);
        }

        $manager->flush();
    }
}
