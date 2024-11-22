<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Tasting\Application\ReadModel\Invitation;
use App\Tasting\Infrastructure\ApiPlatform\OpenApi\InvitationFilter;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetInvitationCollectionProvider;
use Symfony\Component\Uid\Uuid;

#[ApiResource(
    shortName: 'Invitation',
)]
#[GetCollection(
    uriTemplate: '/invitations',
    filters: [InvitationFilter::class],
    provider: GetInvitationCollectionProvider::class,
)]
final readonly class GetCollectionInvitationResource
{
    public function __construct(
        #[ApiProperty(identifier: true)]
        public ?Uuid $id,
        public string $tastingId,
        public string $fromId,
        public string $fromName,
        public string $targetId,
        public string $targetName,
        public string $link,
    ) {
    }

    public static function fromDomain(Invitation $invitation): self
    {
        return new self(
            new Uuid($invitation->id),
            $invitation->tastingId,
            $invitation->fromId,
            $invitation->fromName,
            $invitation->targetId,
            $invitation->targetName,
            $invitation->link,
        );
    }
}
