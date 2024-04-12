<?php

declare(strict_types=1);

namespace App\Bottle\Application\Command;

use App\Bottle\Domain\Exception\ReplaceBottlePictureBottleDoesntExistException;
use App\Bottle\Domain\Repository\BottleWriteRepositoryInterface;
use App\Bottle\Domain\Service\UploadBottlePictureServiceInterface;
use App\Bottle\Domain\ValueObject\BottleId;
use App\Bottle\Domain\ValueObject\BottlePicture;
use App\Shared\Application\Command\AsCommandHandler;
use App\Shared\Domain\Service\DomainEventDispatcherInterface;

#[AsCommandHandler]
final readonly class ReplaceBottlePictureCommandHandler
{
    public function __construct(
        private BottleWriteRepositoryInterface $bottleWriteRepository,
        private DomainEventDispatcherInterface $eventDispatcher,
        private UploadBottlePictureServiceInterface $uploadBottlePicture,
    ) {
    }

    /**
     * @throws ReplaceBottlePictureBottleDoesntExistException
     */
    public function __invoke(
        ReplaceBottlePictureCommand $command,
    ): void {
        $bottle = $this->bottleWriteRepository->ofId(
            BottleId::fromString($command->id),
        );

        if ($bottle === null) {
            throw new ReplaceBottlePictureBottleDoesntExistException();
        }

        $this->uploadBottlePicture->upload(
            $bottle,
            $command->picturePath,
            $command->pictureOriginalName,
        );

        $bottle->addPicture(
            BottlePicture::fromString($command->pictureOriginalName),
        );

        $this->eventDispatcher->dispatch($bottle);

        $this->bottleWriteRepository->update($bottle);
    }
}
