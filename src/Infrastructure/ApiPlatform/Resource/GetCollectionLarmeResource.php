<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider\GetLarmeCollectionProvider;

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
