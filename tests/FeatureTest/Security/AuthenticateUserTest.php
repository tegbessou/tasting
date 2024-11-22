<?php

declare(strict_types=1);

namespace FeatureTest\Security;

use App\Security\Application\Command\AuthenticateUserCommand;
use App\Security\Domain\Repository\UserRepositoryInterface;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Infrastructure\Symfony\Messenger\Message\UserCreatedMessage;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class AuthenticateUserTest extends KernelTestCase
{
    use InteractsWithMessenger;

    private EntityManagerInterface $entityManager;
    private UserRepositoryInterface $userRepository;
    private CommandBusInterface $commandBus;

    #[\Override]
    protected function setUp(): void
    {
        parent::setUp();

        self::bootKernel();
        $container = self::getContainer();
        $this->entityManager = $container->get(EntityManagerInterface::class);
        $this->userRepository = $container->get(UserRepositoryInterface::class);
        $this->commandBus = $container->get(CommandBusInterface::class);
    }

    public function testAuthenticateUserAndUserDoesntExistThenUserIsCreated(): void
    {
        $command = new AuthenticateUserCommand(
            'tokenusernotexist',
            'apple.com',
        );

        $user = $this->userRepository->ofEmail(
            UserEmail::fromString('nexistepas@gmail.com'),
        );

        $this->assertNull($user);

        $authenticatedUser = $this->commandBus->dispatch($command);

        $this->assertEquals(UserEmail::fromString('nexistepas@gmail.com'), $authenticatedUser->email());

        $user = $this->userRepository->ofEmail(
            UserEmail::fromString('nexistepas@gmail.com'),
        );

        $this->assertNotNull($user);

        $this->entityManager->remove($user);
        $this->entityManager->flush();

        $this->transport('tasting')->queue()->assertContains(UserCreatedMessage::class, 1);
        $this->transport('tasting')->reset();
    }
}
