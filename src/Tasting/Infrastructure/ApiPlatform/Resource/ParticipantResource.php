<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Get;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetParticipantProvider;
use Symfony\Component\Uid\Uuid;

#[ApiResource(
    shortName: 'Participant',
    operations: [
        new Get(),
    ],
    provider: GetParticipantProvider::class
)]
final class ParticipantResource
{
    public function __construct(
        #[ApiProperty(identifier: true)]
        public ?Uuid $id = null,
        #[ApiProperty]
        public ?string $email = null,
        #[ApiProperty]
        public ?string $fullName = null,
    ) {
    }

    public static function fromModel(Participant $participant): self
    {
        return new self(
            new Uuid($participant->id()->value()),
            $participant->email()->value(),
            $participant->fullName()->value(),
        );
    }
}
