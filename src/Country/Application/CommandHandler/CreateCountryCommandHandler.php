<?php

declare(strict_types=1);

namespace App\Country\Application\CommandHandler;

use App\Country\Application\Command\CreateCountryCommand;
use App\Country\Domain\Entity\Country;
use App\Country\Domain\Exception\CountryAlreadyExistsException;
use App\Country\Domain\Repository\CountryRepositoryInterface;
use App\Country\Domain\ValueObject\CountryName;
use App\Shared\Application\Command\AsCommandHandler;

#[AsCommandHandler]
final readonly class CreateCountryCommandHandler
{
    public function __construct(
        private CountryRepositoryInterface $countryRepository,
    ) {
    }

    public function __invoke(CreateCountryCommand $command): void
    {
        if ($this->countryRepository->isAlreadyExist(CountryName::fromString($command->name))) {
            throw new CountryAlreadyExistsException();
        }

        $country = Country::create(
            $this->countryRepository->nextIdentity(),
            CountryName::fromString($command->name),
        );

        $this->countryRepository->add($country);
    }
}
