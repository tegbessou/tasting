<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Exception;

final class BottleCreationGrapeVarietiesDoesntExistException extends \Exception
{
    public function __construct(
        public array $grapeVarieties,
    ) {
        parent::__construct(sprintf('Grape varieties %s doesn\'t exist', implode(',', $grapeVarieties)));
    }
}
