<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetMatiereCollectionProvider;

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
