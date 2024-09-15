<?php

declare(strict_types=1);

namespace App\Country\Infrastructure\Doctrine\Repository;

use App\Country\Domain\Entity\Country;
use App\Country\Domain\Repository\CountryWriteRepositoryInterface;
use App\Country\Domain\ValueObject\CountryId;
use App\Country\Domain\ValueObject\CountryName;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Uid\Uuid;

final readonly class CountryWriteDoctrineRepository implements CountryWriteRepositoryInterface
{
    private const ENTITY_CLASS = Country::class;

    public function __construct(
        private EntityManagerInterface $entityManager,
    ) {
    }

    #[\Override]
    public function ofName(
        CountryName $name,
    ): ?Country {
        return $this->entityManager->getRepository(self::ENTITY_CLASS)->findOneBy(['name.value' => $name->value()]);
    }

    #[\Override]
    public function nextIdentity(): CountryId
    {
        return CountryId::fromString(
            Uuid::v4()->toRfc4122()
        );
    }

    #[\Override]
    public function add(Country $country): void
    {
        $this->entityManager->persist($country);
        $this->entityManager->flush();
    }
}
