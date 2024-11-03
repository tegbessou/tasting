<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\BottleInventory\Infrastructure\Security\Http\Repository;

use App\BottleInventory\Domain\Adapter\UserAdapterInterface;
use App\BottleInventory\Domain\ValueObject\User;
use App\BottleInventory\Domain\ValueObject\UserId;
use App\BottleInventory\Domain\ValueObject\UserName;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class UserHttpRepositoryTest extends KernelTestCase
{
    private UserAdapterInterface $httpUserRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->httpUserRepository = $container->get(UserAdapterInterface::class);
    }

    public function testOfId(): void
    {
        $this->assertEquals(
            User::create(
                UserId::fromString('hugues.gobet@gmail.com'),
                UserName::fromString('Hoge Hoge'),
                true,
            ),
            $this->httpUserRepository->ofId(
                UserId::fromString('hugues.gobet@gmail.com'),
            ),
        );
    }

    public function testOfIdNotCurrent(): void
    {
        $this->assertEquals(
            User::create(
                UserId::fromString('root@gmail.com'),
                UserName::fromString('Hoge Hoge'),
                false,
            ),
            $this->httpUserRepository->ofId(
                UserId::fromString('root@gmail.com'),
            ),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->httpUserRepository->ofId(
                UserId::fromString('pedro@gmail.com'),
            ),
        );
    }
}
