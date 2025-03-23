<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider\GetMatiereCollectionProvider;

#[ApiResource(
    shortName: 'Matiere',
)]
#[GetCollection(
    uriTemplate: '/matieres',
    provider: GetMatiereCollectionProvider::class,
)]
final readonly class GetCollectionMatiereResource
{
    public function __construct(
        #[ApiProperty]
        public string $value,
    ) {
    }
}
