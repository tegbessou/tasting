<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetFinaleCollectionProvider;

#[ApiResource(
    shortName: 'Finale',
)]
#[GetCollection(
    uriTemplate: '/finales',
    provider: GetFinaleCollectionProvider::class,
)]
final readonly class GetCollectionFinaleResource
{
    public function __construct(
        #[ApiProperty]
        public string $value,
    ) {
    }
}
