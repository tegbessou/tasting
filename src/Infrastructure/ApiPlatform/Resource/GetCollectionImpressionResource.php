<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider\GetImpressionCollectionProvider;

#[ApiResource(
    shortName: 'Impression',
)]
#[GetCollection(
    uriTemplate: '/impressions',
    provider: GetImpressionCollectionProvider::class,
)]
final readonly class GetCollectionImpressionResource
{
    public function __construct(
        #[ApiProperty]
        public string $value,
    ) {
    }
}
