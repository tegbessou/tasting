<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\Doctrine\Mapper;

use App\Security\Domain\Entity\User;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Domain\ValueObject\UserId;
use App\Security\Infrastructure\Doctrine\Entity\User as UserDoctrine;

final readonly class UserMapper
{
    public static function toDomain(UserDoctrine $user): User
    {
        return new User(
            UserId::fromString($user->id),
            UserEmail::fromString($user->email),
        );
    }

    public static function toInfrastructurePersist(User $user): UserDoctrine
    {
        return new UserDoctrine(
            $user->id()->value(),
            $user->email()->value(),
        );
    }
}
