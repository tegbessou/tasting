<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use EmpireDesAmis\Tasting\Application\ReadModel\Invitation;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\OpenApi\InvitationFilter;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider\GetInvitationCollectionProvider;
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
        public string $fromFullName,
        public string $targetId,
        public string $link,
        public ?string $targetFullName = null,
    ) {
    }

    public static function fromModel(Invitation $invitation): self
    {
        return new self(
            new Uuid($invitation->id),
            $invitation->subjectId,
            $invitation->fromId,
            $invitation->fromFullName,
            $invitation->targetId,
            $invitation->link,
            $invitation->targetFullName,
        );
    }
}
