<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetIntensiteCouleurCollectionProvider;

#[ApiResource(
    shortName: 'IntensiteCouleur',
)]
#[GetCollection(
    uriTemplate: '/intensite_couleurs',
    provider: GetIntensiteCouleurCollectionProvider::class,
)]
final readonly class GetCollectionIntensiteCouleurResource
{
    public function __construct(
        #[ApiProperty]
        public string $value,
    ) {
    }
}
