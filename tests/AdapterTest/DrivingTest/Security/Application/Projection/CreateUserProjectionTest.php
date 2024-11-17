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
use Doctrine\ODM\MongoDB\DocumentManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CreateUserProjectionTest extends KernelTestCase
{
    private readonly CreateUserProjection $userProjection;
    private readonly UserAdapterInterface $userAdapter;
    private readonly UserRepositoryInterface $userRepository;
    private readonly DocumentManager $documentManager;
    private readonly EntityManagerInterface $entityManager;

    public function testUserProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->userProjection = $container->get(CreateUserProjection::class);
        $this->documentManager = $container->get(DocumentManager::class);
        $this->userRepository = $container->get(UserRepositoryInterface::class);
        $this->userAdapter = $container->get(UserAdapterInterface::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);

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

        $this->documentManager->remove($user);
        $this->documentManager->flush();

        $userEntity = $this->userRepository->ofEmail(
            UserEmail::fromString('pedro@gmail.com'),
        );
        $this->entityManager->remove($userEntity);
        $this->entityManager->flush();
    }
}
