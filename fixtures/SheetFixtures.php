<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use EmpireDesAmis\Tasting\Domain\Enum\Acide;
use EmpireDesAmis\Tasting\Domain\Enum\Alcool;
use EmpireDesAmis\Tasting\Domain\Enum\Arome;
use EmpireDesAmis\Tasting\Domain\Enum\Brillance;
use EmpireDesAmis\Tasting\Domain\Enum\Finale;
use EmpireDesAmis\Tasting\Domain\Enum\Impression;
use EmpireDesAmis\Tasting\Domain\Enum\Intensite;
use EmpireDesAmis\Tasting\Domain\Enum\IntensiteCouleur;
use EmpireDesAmis\Tasting\Domain\Enum\Larme;
use EmpireDesAmis\Tasting\Domain\Enum\Limpidite;
use EmpireDesAmis\Tasting\Domain\Enum\Matiere;
use EmpireDesAmis\Tasting\Domain\Enum\Tanin;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Eye;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Mouth;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Nose;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Sheet;

final class SheetFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $sheets = [];

        $sheets[] = new Sheet(
            '1a9ea2de-bb0b-4104-ab6a-8b57d2e65394',
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            'hugues.gobet@gmail.com',
        );

        $sheets[] = new Sheet(
            '53fdb99f-b379-4d28-a1c8-541df07a7c34',
            '964a3cb8-5fbd-4678-a5cd-e371c09ea722',
            'hugues.gobet@gmail.com',
        );

        $eye = new Eye(
            'b8f325e0-e4b5-41e8-9a88-6f7f175046d8',
            $sheets[1],
            Limpidite::OPALESCENTE,
            Brillance::LUMINEUSE,
            IntensiteCouleur::PALE,
            'ambre',
            Larme::FLUIDE,
            'Observation',
        );

        $nose = new Nose(
            'd3c1bf6a-42a9-4a2a-b49a-07b8ee18066e',
            $sheets[1],
            Impression::SIMPLE,
            Intensite::OUVERT,
            Arome::BOISEE,
            'Observation',
        );

        $mouth = new Mouth(
            'ccf8eeff-fe1b-4791-a493-d28559e554c3',
            $sheets[1],
            Alcool::ALCOOLEUX,
            Acide::MOLLE,
            Matiere::ETOFFEE,
            Finale::REMANENTE,
            'Observation',
            Tanin::CHARGE,
        );

        $sheets[1]->eye = $eye;
        $sheets[1]->nose = $nose;
        $sheets[1]->mouth = $mouth;

        $sheets[] = new Sheet(
            '7d4adf54-7ab5-4385-a4c6-c2c82b669a9f',
            'ba57be61-1be9-4cbf-a804-d9e54d76af99',
            'hugues.gobet@gmail.com',
        );

        foreach ($sheets as $sheet) {
            $manager->persist($sheet);
        }

        $manager->flush();
    }
}
