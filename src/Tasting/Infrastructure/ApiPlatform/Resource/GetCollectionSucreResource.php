<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetSucreCollectionProvider;

#[ApiResource(
    shortName: 'Sucre',
)]
#[GetCollection(
    uriTemplate: '/sucres',
    provider: GetSucreCollectionProvider::class,
)]
final readonly class GetCollectionSucreResource
{
    public function __construct(
        #[ApiProperty]
        public string $value,
    ) {
    }
}
