<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Security\Application\Projection;

use App\Security\Application\Adapter\UserAdapterInterface;
use App\Security\Application\Projection\CreateUserProjection;
use App\Security\Domain\Entity\User;
use App\Security\Domain\Event\UserCreated;
use App\Security\Domain\Repository\UserRepositoryInterface;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Domain\ValueObject\UserId;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CreateUserProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly CreateUserProjection $userProjection;
    private readonly UserAdapterInterface $userAdapter;
    private readonly UserRepositoryInterface $userRepository;

    public function testUserProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->userProjection = $container->get(CreateUserProjection::class);
        $this->userRepository = $container->get(UserRepositoryInterface::class);
        $this->userAdapter = $container->get(UserAdapterInterface::class);

        $user = User::create(
            UserId::fromString('4ad98deb-4295-455d-99e2-66e148c162af'),
            UserEmail::fromString('pedro@gmail.com'),
        );
        $user::eraseRecordedEvents();

        $this->userRepository->add($user);

        $event = new UserCreated(
            '4ad98deb-4295-455d-99e2-66e148c162af',
            'pedro@gmail.com',
        );

        $projection($event);

        $user = $this->userAdapter->ofId('pedro@gmail.com');
        $this->assertNotNull($user);
    }
}
