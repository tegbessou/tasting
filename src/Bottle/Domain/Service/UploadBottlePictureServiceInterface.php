<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Service;

use App\Bottle\Domain\Entity\Bottle;

interface UploadBottlePictureServiceInterface
{
    public function upload(Bottle $bottle, string $picturePath, string $pictureOriginalName): void;
}
