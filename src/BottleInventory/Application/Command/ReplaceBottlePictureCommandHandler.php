<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Command;

use App\BottleInventory\Domain\Exception\ReplaceBottlePictureBottleDoesntExistException;
use App\BottleInventory\Domain\Exception\UpdateBottleNotAuthorizeForThisUserException;
use App\BottleInventory\Domain\Repository\BottleRepositoryInterface;
use App\BottleInventory\Domain\Service\Authorization;
use App\BottleInventory\Domain\Service\UploadBottlePictureInterface;
use App\BottleInventory\Domain\ValueObject\BottleId;
use App\BottleInventory\Domain\ValueObject\BottlePicture;
use TegCorp\SharedKernelBundle\Application\Command\AsCommandHandler;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class ReplaceBottlePictureCommandHandler
{
    public function __construct(
        private BottleRepositoryInterface $bottleRepository,
        private DomainEventDispatcherInterface $eventDispatcher,
        private UploadBottlePictureInterface $uploadBottlePicture,
        private Authorization $authorizationService,
    ) {
    }

    /**
     * @throws ReplaceBottlePictureBottleDoesntExistException
     */
    public function __invoke(
        ReplaceBottlePictureCommand $command,
    ): void {
        $bottle = $this->bottleRepository->ofId(
            BottleId::fromString($command->id),
        );

        if ($bottle === null) {
            throw new ReplaceBottlePictureBottleDoesntExistException();
        }

        if ($this->authorizationService->isCurrentUserOwnerOfTheBottle($bottle) === false) {
            throw new UpdateBottleNotAuthorizeForThisUserException();
        }

        $pictureName = $this->uploadBottlePicture->upload(
            $bottle,
            $command->picturePath,
            $command->pictureOriginalName,
        );

        $bottle->addPicture(
            BottlePicture::fromString($pictureName),
        );

        $this->eventDispatcher->dispatch($bottle);

        $this->bottleRepository->update($bottle);
    }
}
