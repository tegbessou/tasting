<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\BottleInventory\Application\ReadModel\BottleList;
use App\BottleInventory\Domain\Enum\Rate;
use App\BottleInventory\Domain\Enum\WineType;
use App\BottleInventory\Infrastructure\ApiPlatform\OpenApi\BottleFilter;
use App\BottleInventory\Infrastructure\ApiPlatform\State\Provider\GetBottleCollectionProvider;
use Symfony\Component\Uid\AbstractUid;
use Symfony\Component\Uid\Uuid;

#[ApiResource(
    shortName: 'Bottle',
)]
#[GetCollection(
    uriTemplate: '/bottles',
    filters: [BottleFilter::class],
    provider: GetBottleCollectionProvider::class,
)]
final class GetCollectionBottleResource
{
    public function __construct(
        #[ApiProperty(identifier: true)]
        public ?AbstractUid $id = null,
        #[ApiProperty]
        public ?string $name = null,
        #[ApiProperty]
        public ?string $estateName = null,
        #[ApiProperty]
        public ?WineType $wineType = null,
        #[ApiProperty]
        public ?int $year = null,
        #[ApiProperty]
        public ?Rate $rate = null,
        #[ApiProperty]
        public ?string $ownerId = null,
        #[ApiProperty]
        public ?string $picture = null,
        #[ApiProperty]
        public ?\DateTime $savedAt = null,
    ) {
    }

    public static function fromModel(BottleList $bottleList): self
    {
        return new self(
            new Uuid($bottleList->id),
            $bottleList->name,
            $bottleList->estateName,
            WineType::from($bottleList->wineType),
            $bottleList->year,
            Rate::from($bottleList->rate),
            $bottleList->ownerId,
            $bottleList->picture,
            new \DateTime($bottleList->savedAt),
        );
    }
}
