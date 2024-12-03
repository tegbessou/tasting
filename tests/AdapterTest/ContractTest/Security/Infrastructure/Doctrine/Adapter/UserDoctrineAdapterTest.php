<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Security\Infrastructure\Doctrine\Adapter;

use App\Security\Application\Adapter\UserAdapterInterface;
use App\Security\Application\ReadModel\User;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class UserDoctrineAdapterTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly UserAdapterInterface $userDoctrineAdapter;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->userDoctrineAdapter = $container->get(UserAdapterInterface::class);
    }

    public function testAdd(): void
    {
        $user = new User(
            'b5880b05-073b-4224-95ed-21af2cf4e737',
            'pedro@gmail.com',
        );

        $this->userDoctrineAdapter->add($user);

        $user = $this->userDoctrineAdapter->ofId('pedro@gmail.com');
        $this->assertNotNull($user);
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->userDoctrineAdapter->ofId('hugues.gobet@gmail.com'),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->userDoctrineAdapter->ofId('existpas@gmail.com'),
        );
    }
}
