<?php

declare(strict_types=1);

namespace App\Bottle\Application\EventListener;

use App\Bottle\Domain\Event\BeforeBottlePictureReplaceEvent;
use App\Bottle\Domain\Service\UploadBottlePictureInterface;

final readonly class UploadBottlePictureEventListener
{
    public function __construct(
        private UploadBottlePictureInterface $uploadBottlePicture,
    ) {
    }

    public function __invoke(
        BeforeBottlePictureReplaceEvent $event,
    ): void {
        $this->uploadBottlePicture->upload(
            $event->bottle,
            $event->picturePath,
            $event->pictureOriginalName,
        );
    }
}
