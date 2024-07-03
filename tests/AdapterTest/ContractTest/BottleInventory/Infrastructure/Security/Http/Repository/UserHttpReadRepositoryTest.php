<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\BottleInventory\Infrastructure\Security\Http\Repository;

use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\User;
use App\BottleInventory\Domain\ValueObject\UserEmail;
use App\BottleInventory\Infrastructure\Security\Http\Repository\UserHttpReadRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class UserHttpReadRepositoryTest extends KernelTestCase
{
    private UserHttpReadRepository $httpUserRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->httpUserRepository = $container->get(UserHttpReadRepository::class);
    }

    public function testOfEmail(): void
    {
        $this->assertEquals(
            User::create(
                UserEmail::fromString('hugues.gobet@gmail.com'),
                true,
            ),
            $this->httpUserRepository->ofEmail(
                OwnerEmail::fromString('hugues.gobet@gmail.com'),
            ),
        );
    }

    public function testOfEmailNotCurrent(): void
    {
        $this->assertEquals(
            User::create(
                UserEmail::fromString('root@gmail.com'),
                false,
            ),
            $this->httpUserRepository->ofEmail(
                OwnerEmail::fromString('root@gmail.com'),
            ),
        );
    }
}
