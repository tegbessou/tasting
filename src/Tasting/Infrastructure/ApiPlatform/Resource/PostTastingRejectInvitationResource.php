<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Post;
use App\Tasting\Infrastructure\ApiPlatform\State\Processor\RejectInvitationProcessor;
use Symfony\Component\HttpFoundation\Response;

#[ApiResource(
    shortName: 'Tasting',
)]
#[Post(
    uriTemplate: '/tastings/{tastingId}/invitations/{id}/reject',
    status: Response::HTTP_NO_CONTENT,
    output: false,
    processor: RejectInvitationProcessor::class,
)]
final readonly class PostTastingRejectInvitationResource
{
}
