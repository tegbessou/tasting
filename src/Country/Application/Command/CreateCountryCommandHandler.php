<?php

declare(strict_types=1);

namespace App\Country\Application\Command;

use App\Country\Domain\Entity\Country;
use App\Country\Domain\Exception\CountryAlreadyExistsException;
use App\Country\Domain\Repository\CountryWriteRepositoryInterface;
use App\Country\Domain\ValueObject\CountryName;
use App\Shared\Application\Command\AsCommandHandler;

#[AsCommandHandler]
final readonly class CreateCountryCommandHandler
{
    public function __construct(
        private CountryWriteRepositoryInterface $countryWriteRepository,
    ) {
    }

    /**
     * @throws CountryAlreadyExistsException
     */
    public function __invoke(CreateCountryCommand $command): void
    {
        if ($this->countryWriteRepository->ofName(CountryName::fromString($command->name)) !== null) {
            throw new CountryAlreadyExistsException();
        }

        $country = Country::create(
            $this->countryWriteRepository->nextIdentity(),
            CountryName::fromString($command->name),
        );

        $this->countryWriteRepository->add($country);
    }
}
