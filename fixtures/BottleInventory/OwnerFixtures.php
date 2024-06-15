<?php

declare(strict_types=1);

namespace DataFixtures\BottleInventory;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\OwnerFullName;
use App\BottleInventory\Domain\ValueObject\OwnerId;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

final class OwnerFixtures extends Fixture
{
    #[\Override]
    public function load(ObjectManager $manager): void
    {
        $owners = [];
        $owners[] = Owner::create(
            OwnerId::fromString('be6d32dc-2313-4dbf-8c66-6807d1335bbc'),
            OwnerEmail::fromString('hugues.gobet@gmail.com'),
            OwnerFullName::fromString('Hugues Gobet'),
        );

        $owners[] = Owner::create(
            OwnerId::fromString('0e4ccb23-7a1f-4f30-b188-6aad71b4735f'),
            OwnerEmail::fromString('root@gmail.com'),
            OwnerFullName::fromString('Root'),
        );

        foreach ($owners as $owner) {
            $manager->persist($owner);
        }

        $manager->flush();
    }
}
