<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetTaninCollectionProvider;

#[ApiResource(
    shortName: 'Tanin',
)]
#[GetCollection(
    uriTemplate: '/tanins',
    provider: GetTaninCollectionProvider::class,
)]
final readonly class GetCollectionTaninResource
{
    public function __construct(
        #[ApiProperty]
        public string $value,
    ) {
    }
}
