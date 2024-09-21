<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\VichUploader;

use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\Exception\ReplaceBottlePictureFileNotFoundException;
use App\BottleInventory\Domain\Service\UploadBottlePictureInterface;
use App\BottleInventory\Infrastructure\ApiPlatform\Resource\BottleResource;
use Symfony\Component\HttpFoundation\File\Exception\FileNotFoundException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Vich\UploaderBundle\Handler\UploadHandler;

final readonly class UploadBottlePictureVichUploaderFake implements UploadBottlePictureInterface
{
    public function __construct(
        private UploadHandler $uploadHandler,
    ) {
    }

    #[\Override]
    public function upload(
        Bottle $bottle,
        string $picturePath,
        string $pictureOriginalName,
    ): void {
        try {
            $file = new UploadedFile($picturePath, $pictureOriginalName, test: true);

            $bottleResource = BottleResource::fromModel($bottle);

            $bottleResource->picture = $file;

            $this->uploadHandler->upload($bottleResource, 'picture');
        } catch (FileNotFoundException) {
            throw new ReplaceBottlePictureFileNotFoundException();
        }
    }
}
