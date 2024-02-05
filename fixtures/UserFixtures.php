<?php

declare(strict_types=1);

namespace DataFixtures;

use App\User\Domain\Entity\User;
use App\User\Domain\ValueObject\UserEmail;
use App\User\Domain\ValueObject\UserId;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

final class UserFixtures extends Fixture
{
    #[\Override]
    public function load(ObjectManager $manager): void
    {
        $user = User::create(
            UserId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
            UserEmail::fromString('hugues.gobet@gmail.com'),
        );

        $manager->persist($user);
        $manager->flush();
    }
}
