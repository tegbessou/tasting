<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetTeinteByWineTypeCollectionProvider;

#[ApiResource(
    shortName: 'Teinte',
)]
#[GetCollection(
    uriTemplate: '/teintes/{wineType}',
    provider: GetTeinteByWineTypeCollectionProvider::class,
)]
final readonly class GetCollectionTeinteByWineTypeResource
{
    public function __construct(
        #[ApiProperty]
        public string $value,
    ) {
    }
}
