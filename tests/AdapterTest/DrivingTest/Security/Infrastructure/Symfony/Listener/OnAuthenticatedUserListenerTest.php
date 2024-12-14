<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Security\Infrastructure\Symfony\Listener;

use App\Security\Domain\Repository\UserRepositoryInterface;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Infrastructure\Symfony\Listener\OnAuthenticatedUserListener;
use App\Security\Infrastructure\Symfony\Messenger\Message\UserCreatedMessage;
use EmpireDesAmis\SecurityAuthenticatorBundle\Event\UserAuthenticatedEvent;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class OnAuthenticatedUserListenerTest extends KernelTestCase
{
    use InteractsWithMessenger;
    use RefreshDatabase;

    private UserRepositoryInterface $userRepository;
    private OnAuthenticatedUserListener $eventListener;

    protected function setUp(): void
    {
        $container = self::getContainer();
        $this->userRepository = $container->get(UserRepositoryInterface::class);
        $this->eventListener = $container->get(OnAuthenticatedUserListener::class);
    }

    public function testOnAuthenticatedUser(): void
    {
        $eventListener = $this->eventListener;
        $eventListener(
            new UserAuthenticatedEvent('nexistepas@gmail.com'),
        );

        $this->transport('security_to_tasting')->queue()->assertContains(UserCreatedMessage::class, 1);
        $this->transport('security_to_tasting')->reset();

        $user = $this->userRepository->ofEmail(
            UserEmail::fromString('nexistepas@gmail.com'),
        );

        $this->assertNotNull($user);
    }
}
