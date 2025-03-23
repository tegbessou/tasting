<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider\GetBrillanceCollectionProvider;

#[ApiResource(
    shortName: 'Brillance',
)]
#[GetCollection(
    uriTemplate: '/brillances',
    provider: GetBrillanceCollectionProvider::class,
)]
final readonly class GetCollectionBrillanceResource
{
    public function __construct(
        #[ApiProperty]
        public string $value,
    ) {
    }
}
