<?php

declare(strict_types=1);

namespace DataFixtures;

use App\Bottle\Domain\Entity\GrapeVariety;
use App\Bottle\Domain\ValueObject\GrapeVarietyId;
use App\Bottle\Domain\ValueObject\GrapeVarietyName;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

final class GrapeVarietyFixtures extends Fixture
{
    #[\Override]
    public function load(ObjectManager $manager): void
    {
        $grapeVarieties = [];

        $grapeVarieties[] = new GrapeVariety(
            GrapeVarietyId::fromString('48963d6e-2ba1-4197-ae2b-51cef06e3468'),
            GrapeVarietyName::fromString('Cabernet Sauvignon')
        );

        $grapeVarieties[] = new GrapeVariety(
            GrapeVarietyId::fromString('8a88c8a8-1d72-40dc-a293-5bbb2c0143b5'),
            GrapeVarietyName::fromString('Merlot')
        );

        $grapeVarieties[] = new GrapeVariety(
            GrapeVarietyId::fromString('b72db327-2d88-413e-9836-48953b9331b6'),
            GrapeVarietyName::fromString('Cabernet Franc')
        );

        $grapeVarieties[] = new GrapeVariety(
            GrapeVarietyId::fromString('19b06368-699e-43ad-a320-5aa5e30d8305'),
            GrapeVarietyName::fromString('Petit Verdot')
        );

        $grapeVarieties[] = new GrapeVariety(
            GrapeVarietyId::fromString('af91d0e6-9cf4-46b1-ab68-ee444e18d78b'),
            GrapeVarietyName::fromString('Pinot Noir')
        );

        $grapeVarieties[] = new GrapeVariety(
            GrapeVarietyId::fromString('a187c830-9465-4cd9-a53e-6f1292f9d209'),
            GrapeVarietyName::fromString('Chardonnay')
        );

        $grapeVarieties[] = new GrapeVariety(
            GrapeVarietyId::fromString('ddb81d1a-e1ec-4451-8ae0-f089d2bc6a8e'),
            GrapeVarietyName::fromString('Shiraz')
        );

        $grapeVarieties[] = new GrapeVariety(
            GrapeVarietyId::fromString('351c4459-0181-4924-8e99-df0340087680'),
            GrapeVarietyName::fromString('Tempranillo')
        );

        $grapeVarieties[] = new GrapeVariety(
            GrapeVarietyId::fromString('8eb306fc-3751-440b-859e-39339fd03d0b'),
            GrapeVarietyName::fromString('Sauvignon Blanc')
        );

        $grapeVarieties[] = new GrapeVariety(
            GrapeVarietyId::fromString('7733caf9-7117-4f0d-add2-e3190ce6410e'),
            GrapeVarietyName::fromString('Nebbiolo')
        );

        foreach ($grapeVarieties as $grapeVariety) {
            $manager->persist($grapeVariety);
        }

        $manager->flush();
    }
}
