<?php

declare(strict_types=1);

namespace App\Country\Application\Command;

use App\Country\Domain\Entity\Country;
use App\Country\Domain\Exception\CountryAlreadyExistsException;
use App\Country\Domain\Repository\CountryReadRepositoryInterface;
use App\Country\Domain\ValueObject\CountryName;
use App\Shared\Application\Command\AsCommandHandler;

#[AsCommandHandler]
final readonly class CreateCountryCommandHandler
{
    public function __construct(
        private CountryReadRepositoryInterface $countryRepository,
    ) {
    }

    /**
     * @throws CountryAlreadyExistsException
     */
    public function __invoke(CreateCountryCommand $command): void
    {
        if ($this->countryRepository->exist(CountryName::fromString($command->name))) {
            throw new CountryAlreadyExistsException();
        }

        $country = Country::create(
            $this->countryRepository->nextIdentity(),
            CountryName::fromString($command->name),
        );

        $this->countryRepository->add($country);
    }
}
