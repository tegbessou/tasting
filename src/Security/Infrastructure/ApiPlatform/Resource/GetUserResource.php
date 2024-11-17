<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Get;
use App\Security\Application\ReadModel\User;
use App\Security\Domain\ValueObject\UserIsCurrent;
use App\Security\Infrastructure\ApiPlatform\State\Provider\GetUserProvider;

#[ApiResource(
    shortName: 'User',
)]
#[Get(
    '/users/{email}',
    requirements: [
        'email' => '.+',
    ],
    provider: GetUserProvider::class,
)]
final readonly class GetUserResource
{
    public function __construct(
        #[ApiProperty(identifier: true)]
        public ?string $email = null,
        #[ApiProperty]
        public bool $isCurrent = false,
    ) {
    }

    public static function fromValue(
        UserIsCurrent $userIsCurrent,
    ): self {
        return new self(
            $userIsCurrent->email()->value(),
            $userIsCurrent->isCurrent(),
        );
    }

    public static function fromModel(
        User $user,
    ): self {
        return new self(
            $user->email,
            true,
        );
    }
}
