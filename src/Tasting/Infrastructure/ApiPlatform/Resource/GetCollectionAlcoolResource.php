<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetAlcoolCollectionProvider;

#[ApiResource(
    shortName: 'Alcool',
)]
#[GetCollection(
    uriTemplate: '/alcools',
    provider: GetAlcoolCollectionProvider::class,
)]
final readonly class GetCollectionAlcoolResource
{
    public function __construct(
        #[ApiProperty]
        public string $value,
    ) {
    }
}
