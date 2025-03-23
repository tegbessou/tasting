<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\DataFixtures\ReadModel;

use Doctrine\Bundle\MongoDBBundle\Fixture\Fixture;
use Doctrine\Persistence\ObjectManager;
use EmpireDesAmis\Tasting\Application\ReadModel\Sheet;

final class SheetFixtures extends Fixture
{
    #[\Override]
    public function load(ObjectManager $manager): void
    {
        $sheets = [];

        $sheets[] = new Sheet(
            '1a9ea2de-bb0b-4104-ab6a-8b57d2e65394',
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            'hugues.gobet@gmail.com',
            'Pedor',
        );

        $sheets[] = new Sheet(
            '53fdb99f-b379-4d28-a1c8-541df07a7c34',
            '964a3cb8-5fbd-4678-a5cd-e371c09ea722',
            'hugues.gobet@gmail.com',
            'Pedor',
            'opalescente',
            'lumineuse',
            'intense',
            'ambre',
            'fluide',
            'Observation',
            'simple',
            'ouvert',
            'boisée',
            'Observation',
            'alcooleux',
            'molle',
            'étoffée',
            'rémanente',
            'Observation',
            'chargé',
        );

        $sheets[] = new Sheet(
            '7d4adf54-7ab5-4385-a4c6-c2c82b669a9f',
            'ba57be61-1be9-4cbf-a804-d9e54d76af99',
            'hugues.gobet@gmail.com',
            'Pedor',
        );

        foreach ($sheets as $sheet) {
            $manager->persist($sheet);
        }

        $manager->flush();
    }
}
