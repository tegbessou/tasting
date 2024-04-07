<?php

declare(strict_types=1);

namespace App\Bottle\Application\Command;

use App\Bottle\Domain\Exception\ReplaceBottlePictureBottleDoesntExistException;
use App\Bottle\Domain\Repository\BottleWriteRepositoryInterface;
use App\Bottle\Domain\Service\UploadBottlePictureServiceInterface;
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
        if ($command->bottle === null) {
            throw new ReplaceBottlePictureBottleDoesntExistException();
        }

        $this->uploadBottlePicture->upload(
            $command->bottle,
            $command->picturePath,
            $command->pictureOriginalName,
        );

        $command->bottle->addPicture(
            BottlePicture::fromString($command->pictureOriginalName),
        );

        $this->eventDispatcher->dispatch($command->bottle);

        $this->bottleWriteRepository->update($command->bottle);
    }
}
