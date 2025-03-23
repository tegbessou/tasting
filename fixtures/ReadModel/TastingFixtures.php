<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\DataFixtures\ReadModel;

use Doctrine\Bundle\MongoDBBundle\Fixture\Fixture;
use Doctrine\Persistence\ObjectManager;
use EmpireDesAmis\Tasting\Application\ReadModel\Tasting;

final class TastingFixtures extends Fixture
{
    #[\Override]
    public function load(ObjectManager $manager): void
    {
        $tastings = [];

        $tastings[] = new Tasting(
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            [
                [
                    'Pedor',
                    'hugues.gobet@gmail.com',
                ],
            ],
            'Domaine Leflaive Montrachet Grand Cru 2016',
            'red',
            'Pedor',
            'hugues.gobet@gmail.com',
        );

        $tastings[] = new Tasting(
            '964a3cb8-5fbd-4678-a5cd-e371c09ea722',
            [
                [
                    'Pedor',
                    'hugues.gobet@gmail.com',
                ],
            ],
            'Château Latour 2010',
            'red',
            'Pedor',
            'hugues.gobet@gmail.com',
        );

        $tastings[] = new Tasting(
            'ba57be61-1be9-4cbf-a804-d9e54d76af99',
            [
                [
                    'Pedor',
                    'hugues.gobet@gmail.com',
                ],
            ],
            'Domaine Leflaive Montrachet Grand Cru',
            'white',
            'Pedor',
            'hugues.gobet@gmail.com',
        );

        foreach ($tastings as $tasting) {
            $manager->persist($tasting);
            $manager->flush();
        }
    }
}
