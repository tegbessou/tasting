<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider\GetTeinteByWineTypeCollectionProvider;

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
