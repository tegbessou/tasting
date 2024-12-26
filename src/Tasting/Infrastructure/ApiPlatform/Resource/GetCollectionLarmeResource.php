<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetLarmeCollectionProvider;

#[ApiResource(
    shortName: 'Larme',
)]
#[GetCollection(
    uriTemplate: '/larmes',
    provider: GetLarmeCollectionProvider::class,
)]
final readonly class GetCollectionLarmeResource
{
    public function __construct(
        #[ApiProperty]
        public string $value,
    ) {
    }
}
