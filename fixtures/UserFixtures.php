<?php

declare(strict_types=1);

namespace DataFixtures;

use App\User\Domain\Entity\User;
use App\User\Domain\ValueObject\Email;
use App\User\Domain\ValueObject\UserId;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class UserFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $user = User::create(
            UserId::fromString('ee036f3b-d488-43be-b10c-fdbdcb0a6c0b'),
            Email::fromString('hugues.gobet@gmail.com'),
        );

        $manager->persist($user);
        $manager->flush();
    }
}
