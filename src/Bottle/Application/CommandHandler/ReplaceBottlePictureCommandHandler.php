<?php

declare(strict_types=1);

namespace App\Bottle\Application\CommandHandler;

use App\Bottle\Application\Command\ReplaceBottlePictureCommand;
use App\Bottle\Domain\Event\BeforeBottlePictureReplaceEvent;
use App\Bottle\Domain\Event\CheckIfUserIsAuthorizeToUpdateBottleEvent;
use App\Bottle\Domain\Exception\ReplaceBottlePictureBottleDoesntExistException;
use App\Bottle\Domain\Repository\BottleRepositoryInterface;
use App\Bottle\Domain\ValueObject\BottlePicture;
use App\Shared\Application\Command\AsCommandHandler;
use Symfony\Contracts\EventDispatcher\EventDispatcherInterface;

#[AsCommandHandler]
final readonly class ReplaceBottlePictureCommandHandler
{
    public function __construct(
        private BottleRepositoryInterface $bottleRepository,
        private EventDispatcherInterface $eventDispatcher,
    ) {
    }

    public function __invoke(
        ReplaceBottlePictureCommand $command,
    ): void {
        if ($command->bottle === null) {
            throw new ReplaceBottlePictureBottleDoesntExistException();
        }

        $this->eventDispatcher->dispatch(
            new CheckIfUserIsAuthorizeToUpdateBottleEvent($command->bottle->ownerId()->id())
        );

        $this->eventDispatcher->dispatch(new BeforeBottlePictureReplaceEvent(
            $command->bottle,
            $command->picturePath,
            $command->pictureOriginalName,
        ));
        $command->bottle->addPicture(
            BottlePicture::fromString($command->pictureOriginalName),
        );

        $this->bottleRepository->update($command->bottle);
    }
}
