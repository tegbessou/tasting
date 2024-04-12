<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\Security\Domain\Entity;

use App\Security\Domain\Entity\User;
use App\Security\Domain\Event\UserCreatedEvent;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Domain\ValueObject\UserId;
use PHPUnit\Framework\TestCase;

final class UserTest extends TestCase
{
    public function testCreateSuccess(): void
    {
        $user = User::create(
            UserId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            UserEmail::fromString('hugues.gobet@gmail.com'),
        );

        $this->assertInstanceOf(
            User::class,
            $user,
        );
    }

    public function testCreateSuccessWithBadEmail(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        User::create(
            UserId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            UserEmail::fromString('notemail'),
        );
    }

    public function testCreateSuccessWithBadUuid(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        User::create(
            UserId::fromString('2'),
            UserEmail::fromString('hugues.gobet@gmail.com'),
        );
    }

    public function testCreateSuccessEventDispatch(): void
    {
        $user = User::create(
            UserId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            UserEmail::fromString('hugues.gobet@gmail.com'),
        );

        $this->assertInstanceOf(UserCreatedEvent::class, $user::getRecordedEvent()[0]);
        $user::eraseRecordedEvents();
    }

    public function testCreateFailedNoEventDispatch(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        $user = User::create(
            UserId::fromString('2'),
            UserEmail::fromString('hugues.gobet@gmail.com'),
        );

        $this->assertEmpty($user::getRecordedEvent());
    }
}
