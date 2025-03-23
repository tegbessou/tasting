<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider\GetAcideCollectionProvider;

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
