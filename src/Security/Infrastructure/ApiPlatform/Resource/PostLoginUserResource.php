<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Post;
use App\Security\Infrastructure\ApiPlatform\State\Processor\LogInUserProcessor;
use Symfony\Component\Validator\Constraints as Assert;

#[ApiResource(
    shortName: 'User',
)]
#[Post(
    '/users/login',
    security: 'is_granted("PUBLIC_ACCESS")',
    output: AuthorizeTokenResource::class,
    processor: LogInUserProcessor::class,
)]
final readonly class PostLoginUserResource
{
    public function __construct(
        #[ApiProperty(identifier: true)]
        #[Assert\NotBlank]
        #[Assert\Email]
        public ?string $email = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        public ?string $password = null,
    ) {
    }
}
