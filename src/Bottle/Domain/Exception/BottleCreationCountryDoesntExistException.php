<?php

declare(strict_types=1);

namespace App\Bottle\Domain\Exception;

final class BottleCreationCountryDoesntExistException extends \Exception
{
    public function __construct(
        public readonly string $country,
    ) {
        parent::__construct(sprintf('Country %s does not exist', $this->country));
    }
}
