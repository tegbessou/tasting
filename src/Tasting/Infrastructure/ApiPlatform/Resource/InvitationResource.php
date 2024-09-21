<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Infrastructure\ApiPlatform\OpenApi\InvitationFilter;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetInvitationCollectionProvider;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Uid\Uuid;

#[ApiResource(
    shortName: 'Invitation',
    operations: [
        new GetCollection(
            uriTemplate: '/invitations',
            normalizationContext: ['groups' => ['read_invitation_collection', 'read_participant_relation', 'read_tasting_relation', 'read_owner_relation']],
            filters: [InvitationFilter::class],
            provider: GetInvitationCollectionProvider::class,
        ),
    ],
)]
final readonly class InvitationResource
{
    public function __construct(
        #[ApiProperty(identifier: true)]
        #[Groups(['read_invitation_collection'])]
        public ?Uuid $id = null,
        #[ApiProperty]
        #[Groups(['read_invitation_collection'])]
        public ?TastingResource $subject = null,
        #[ApiProperty]
        #[Groups(['read_invitation_collection'])]
        public ?ParticipantResource $target = null,
    ) {
    }

    public static function fromModel(Invitation $invitation, Tasting $tasting): self
    {
        return new self(
            new Uuid($invitation->id()->value()),
            TastingResource::fromModel($tasting),
            ParticipantResource::fromModel($invitation->target()),
        );
    }
}
