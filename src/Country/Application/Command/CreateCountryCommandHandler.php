<?php

declare(strict_types=1);

namespace App\Country\Application\Command;

use App\Country\Domain\Entity\Country;
use App\Country\Domain\Exception\CountryAlreadyExistsException;
use App\Country\Domain\Repository\CountryRepositoryInterface;
use App\Country\Domain\ValueObject\CountryName;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class CreateCountryCommandHandler
{
    public function __construct(
        private CountryRepositoryInterface $countryRepository,
        private DomainEventDispatcherInterface $dispatcher,
    ) {
    }

    /**
     * @throws CountryAlreadyExistsException
     */
    public function __invoke(CreateCountryCommand $command): void
    {
        if ($this->countryRepository->ofName(CountryName::fromString($command->name)) !== null) {
            throw new CountryAlreadyExistsException();
        }

        $country = Country::create(
            $this->countryRepository->nextIdentity(),
            CountryName::fromString($command->name),
        );

        $this->countryRepository->add($country);

        $this->dispatcher->dispatch($country);
    }
}
