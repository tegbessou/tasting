<?php

declare(strict_types=1);

namespace App\Bottle\Application\Command;

use App\Bottle\Domain\Entity\Bottle;
use App\Shared\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<void>
 */
final class ReplaceBottlePictureCommand implements CommandInterface
{
    public function __construct(
        public ?Bottle $bottle,
        public string $picturePath,
        public string $pictureOriginalName,
    ) {
    }
}
