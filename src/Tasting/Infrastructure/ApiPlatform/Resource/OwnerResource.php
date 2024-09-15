<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Get;
use App\Tasting\Domain\Entity\Participant;
use Symfony\Component\Serializer\Attribute\Groups;
use Symfony\Component\Uid\Uuid;

#[ApiResource(
    shortName: 'OwnerTasting',
    operations: [
        new Get(),
    ],
    normalizationContext: ['groups' => ['read_owner_relation']],
)]
final class OwnerResource
{
    public function __construct(
        #[ApiProperty(identifier: true)]
        public ?Uuid $id = null,
        #[ApiProperty]
        public ?string $email = null,
        #[ApiProperty]
        #[Groups(['read_owner_relation'])]
        public ?string $fullName = null,
    ) {
    }

    public static function fromModel(Participant $owner): self
    {
        return new self(
            new Uuid($owner->id()->value()),
            $owner->email()->value(),
            $owner->fullName()->value(),
        );
    }
}
