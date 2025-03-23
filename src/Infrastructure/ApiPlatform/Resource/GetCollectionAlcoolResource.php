<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider\GetAlcoolCollectionProvider;

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
