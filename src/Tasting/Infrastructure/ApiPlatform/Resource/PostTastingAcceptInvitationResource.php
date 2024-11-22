<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Post;
use App\Tasting\Infrastructure\ApiPlatform\State\Processor\AcceptInvitationProcessor;
use Symfony\Component\HttpFoundation\Response;

#[ApiResource(
    shortName: 'Tasting',
)]
#[Post(
    uriTemplate: '/tastings/{tastingId}/invitations/{id}/accept',
    status: Response::HTTP_NO_CONTENT,
    output: false,
    processor: AcceptInvitationProcessor::class,
)]
final readonly class PostTastingAcceptInvitationResource
{
}
