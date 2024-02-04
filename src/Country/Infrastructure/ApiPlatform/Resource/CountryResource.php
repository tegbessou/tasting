<?php

declare(strict_types=1);

namespace App\Country\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Country\Domain\Entity\Country;
use App\Country\Infrastructure\ApiPlatform\OpenApi\CountryFilter;
use App\Country\Infrastructure\ApiPlatform\State\Provider\GetCollectionProvider;
use Symfony\Component\Uid\AbstractUid;
use Symfony\Component\Uid\Uuid;

#[ApiResource(
    uriTemplate: '/countries',
    shortName: 'Country',
    operations: [
        new GetCollection(
            filters: [CountryFilter::class],
            provider: GetCollectionProvider::class,
        ),
    ],
)]
final class CountryResource
{
    public function __construct(
        #[ApiProperty(readable: false, writable: false, identifier: true)]
        public ?AbstractUid $id = null,
        #[ApiProperty]
        public ?string $name = null,
    ) {
    }

    public static function fromModel(Country $country): self
    {
        return new self(
            new Uuid($country->id()->id()),
            $country->name()->name()
        );
    }
}
