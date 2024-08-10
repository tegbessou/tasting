<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Post;
use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Infrastructure\ApiPlatform\State\Processor\AcceptInvitationProcessor;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetInvitationProvider;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Uid\Uuid;

#[ApiResource(
    shortName: 'Invitation',
    operations: [
        new Post(
            uriTemplate: '/invitations/{id}/accept',
            status: Response::HTTP_NO_CONTENT,
            output: false,
            processor: AcceptInvitationProcessor::class,
        ),
    ],
    provider: GetInvitationProvider::class
)]
final class InvitationResource
{
    public function __construct(
        #[ApiProperty(identifier: true)]
        public ?Uuid $id = null,
        #[ApiProperty]
        public ?TastingResource $subject = null,
        #[ApiProperty]
        public ?ParticipantResource $target = null,
        #[ApiProperty]
        public ?\DateTimeImmutable $sentAt = null,
        #[ApiProperty]
        public ?string $link = null,
    ) {
    }

    public static function fromModel(Invitation $invitation): self
    {
        return new self(
            new Uuid($invitation->id()->id()),
            TastingResource::fromModel($invitation->subject()),
            ParticipantResource::fromModel($invitation->target()),
            $invitation->sentAt()?->value() ?? null,
            $invitation->link()->value(),
        );
    }
}
