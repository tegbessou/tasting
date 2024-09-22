<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\Post;
use App\Security\Domain\Entity\User;
use App\Security\Domain\ValueObject\UserIsCurrent;
use App\Security\Infrastructure\ApiPlatform\State\Processor\CreateUserProcessor;
use App\Security\Infrastructure\ApiPlatform\State\Processor\LogInUserProcessor;
use App\Security\Infrastructure\ApiPlatform\State\Provider\GetUserProvider;
use Symfony\Component\Serializer\Attribute\Groups;
use Symfony\Component\Validator\Constraints as Assert;

#[ApiResource(
    shortName: 'User',
    operations: [
        new Post(
            '/users',
            security: 'is_granted("PUBLIC_ACCESS")',
            processor: CreateUserProcessor::class,
        ),
        new Post(
            '/users/login',
            denormalizationContext: ['groups' => ['login']],
            security: 'is_granted("PUBLIC_ACCESS")',
            validationContext: ['groups' => ['login']],
            output: AuthorizeTokenResource::class,
            processor: LogInUserProcessor::class,
        ),
        new Get(
            requirements: [
                'email' => '.+',
            ],
            provider: GetUserProvider::class,
        ),
    ]
)]
final class UserResource
{
    public function __construct(
        #[ApiProperty(identifier: true)]
        #[Assert\NotBlank(groups: ['Default', 'login'])]
        #[Assert\Email(groups: ['Default', 'login'])]
        #[Groups(['Default', 'login'])]
        public ?string $email = null,
        #[ApiProperty]
        public bool $isCurrent = false,
        #[ApiProperty]
        #[Assert\NotBlank(groups: ['login'])]
        #[Groups(['login'])]
        public ?string $password = null,
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
            $user->email()->value(),
            true,
        );
    }
}
