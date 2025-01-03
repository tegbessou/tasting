<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetAcideCollectionProvider;

#[ApiResource(
    shortName: 'Acide',
)]
#[GetCollection(
    uriTemplate: '/acides',
    provider: GetAcideCollectionProvider::class,
)]
final readonly class GetCollectionAcideResource
{
    public function __construct(
        #[ApiProperty]
        public string $value,
    ) {
    }
}
