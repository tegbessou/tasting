<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Post;
use App\Tasting\Infrastructure\ApiPlatform\State\Processor\InviteParticipantsToTastingProcessor;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Validator\Constraints as Assert;

#[ApiResource(
    shortName: 'Tasting',
)]
#[Post(
    uriTemplate: '/tastings/{id}/invite',
    status: Response::HTTP_NO_CONTENT,
    output: false,
    processor: InviteParticipantsToTastingProcessor::class,
)]
final readonly class PostTastingInviteResource
{
    public function __construct(
        #[ApiProperty]
        #[Assert\NotBlank]
        public array $participants = [],
    ) {
    }
}
