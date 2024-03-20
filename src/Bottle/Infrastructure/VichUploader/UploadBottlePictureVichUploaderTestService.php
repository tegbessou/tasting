<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\VichUploader;

use App\Bottle\Domain\Entity\Bottle;
use App\Bottle\Domain\Exception\ReplaceBottlePictureFileNotFoundException;
use App\Bottle\Domain\Service\UploadBottlePictureServiceInterface;
use App\Bottle\Infrastructure\ApiPlatform\Resource\BottleResource;
use Symfony\Component\HttpFoundation\File\Exception\FileNotFoundException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Vich\UploaderBundle\Handler\UploadHandler;

final readonly class UploadBottlePictureVichUploaderTestService implements UploadBottlePictureServiceInterface
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
