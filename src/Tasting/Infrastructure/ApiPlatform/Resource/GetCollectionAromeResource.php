<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetAromeCollectionProvider;

#[ApiResource(
    shortName: 'Arome',
)]
#[GetCollection(
    uriTemplate: '/aromes',
    provider: GetAromeCollectionProvider::class,
)]
final readonly class GetCollectionAromeResource
{
    public function __construct(
        #[ApiProperty]
        public string $value,
    ) {
    }
}
