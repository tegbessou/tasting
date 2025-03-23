<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use EmpireDesAmis\Tasting\Domain\Enum\WineType;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Tasting;

final class TastingFixtures extends Fixture
{
    #[\Override]
    public function load(ObjectManager $manager): void
    {
        $tastings = [];

        $tastings[] = new Tasting(
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            '5ec0917b-179f-46e4-87d6-db76fbddf45f',
            'Domaine Leflaive Montrachet Grand Cru 2016',
            WineType::RedWine,
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
        );

        $tastings[] = new Tasting(
            '964a3cb8-5fbd-4678-a5cd-e371c09ea722',
            '29523184-face-4e1c-8582-1637cd501cee',
            'Château Latour 2010',
            WineType::RedWine,
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
        );

        $tastings[] = new Tasting(
            'ba57be61-1be9-4cbf-a804-d9e54d76af99',
            '5ec0917b-179f-46e4-87d6-db76fbddf45f',
            'Domaine Leflaive Montrachet Grand Cru',
            WineType::WhiteWine,
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
