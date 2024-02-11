<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Event;

use App\Bottle\Domain\Entity\Bottle;
use Symfony\Contracts\EventDispatcher\Event;

final class BeforeBottlePictureReplaceEvent extends Event
{
    public function __construct(
        public Bottle $bottle,
        public string $picturePath,
        public string $pictureOriginalName,
    ) {
    }
}
