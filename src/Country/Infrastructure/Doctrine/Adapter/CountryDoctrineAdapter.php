<?php

declare(strict_types=1);

namespace App\Country\Infrastructure\Doctrine\Adapter;

use App\Country\Application\Adapter\CountryAdapterInterface;
use App\Country\Application\ReadModel\Country;
use Doctrine\ODM\MongoDB\DocumentManager;
use Doctrine\ODM\MongoDB\Query\Builder;
use TegCorp\SharedKernelBundle\Infrastructure\Doctrine\ODM\DoctrineRepository;

/**
 * @extends DoctrineRepository<Country>
 */
final class CountryDoctrineAdapter extends DoctrineRepository implements CountryAdapterInterface
{
    private const string MODEL_CLASS = Country::class;

    public function __construct(
        DocumentManager $documentManager,
    ) {
        parent::__construct($documentManager, self::MODEL_CLASS);
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

    #[\Override]
    public function withName(
        string $name,
    ): self {
        return $this->filter(static function (Builder $qb) use ($name): void {
            $qb->field('name')->text($name);
        });
    }

    #[\Override]
    public function sortName(): self
    {
        return $this->filter(static function (Builder $qb): void {
            $qb->sort('name', 'ASC');
        });
    }
}
