<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\User\Domain\Entity;

use App\User\Domain\Entity\User;
use App\User\Domain\ValueObject\Email;
use App\User\Domain\ValueObject\UserId;
use PHPUnit\Framework\TestCase;

class UserTest extends TestCase
{
    public function testCreateSuccess(): void
    {
        $user = User::create(
            UserId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26'),
            Email::fromString('hugues.gobet@gmail.com'),
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
            Email::fromString('pedro'),
        );
    }

    public function testCreateSuccessWithBadUuid(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        User::create(
            UserId::fromString('2'),
            Email::fromString('hugues.gobet@gmail.com'),
        );
    }
}
