<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Get;
use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Infrastructure\ApiPlatform\State\Provider\GetOwnerProvider;
use Symfony\Component\Uid\Uuid;

#[ApiResource(
    shortName: 'Owner',
    operations: [
        new Get(),
    ],
    provider: GetOwnerProvider::class
)]
final class OwnerResource
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

    public static function fromModel(Owner $owner): self
    {
        return new self(
            new Uuid($owner->id()->value()),
            $owner->email()->value(),
            $owner->fullName()->value(),
        );
    }
}
