<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Command;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\Exception\OwnerAlreadyExistException;
use App\BottleInventory\Domain\Exception\OwnerDoesntExistInSecurityException;
use App\BottleInventory\Domain\Repository\OwnerRepositoryInterface;
use App\BottleInventory\Domain\Service\Authorization;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\OwnerFullName;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class CreateOwnerCommandHandler
{
    public function __construct(
        private OwnerRepositoryInterface $ownerRepository,
        private Authorization $authorizationService,
        private DomainEventDispatcherInterface $domainEventDispatcher,
    ) {
    }

    public function __invoke(CreateOwnerCommand $command): void
    {
        if (!$this->authorizationService->isExistUser(OwnerEmail::fromString($command->email))) {
            throw new OwnerDoesntExistInSecurityException($command->email);
        }

        if ($this->ownerRepository->ofEmail(OwnerEmail::fromString($command->email)) !== null) {
            throw new OwnerAlreadyExistException($command->fullName);
        }

        $owner = Owner::create(
            $this->ownerRepository->nextIdentity(),
            OwnerEmail::fromString($command->email),
            OwnerFullName::fromString($command->fullName),
        );

        $this->domainEventDispatcher->dispatch($owner);

        $this->ownerRepository->add(
            $owner,
        );
    }
}
