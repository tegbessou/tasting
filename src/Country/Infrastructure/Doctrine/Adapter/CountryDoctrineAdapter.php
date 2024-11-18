<?php

declare(strict_types=1);

namespace App\Country\Infrastructure\Doctrine\Adapter;

use App\Country\Application\Adapter\CountryAdapterInterface;
use App\Country\Application\ReadModel\Country;
use Doctrine\ODM\MongoDB\DocumentManager;

final readonly class CountryDoctrineAdapter implements CountryAdapterInterface
{
    public function __construct(
        private DocumentManager $documentManager,
    ) {
    }

    #[\Override]
    public function ofName(string $name): ?Country
    {
        return $this->documentManager->getRepository(Country::class)->findOneBy(['name' => $name]);
    }

    #[\Override]
    public function add(Country $country): void
    {
        $this->documentManager->persist($country);
        $this->documentManager->flush();
    }
}
