<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Exception;

final class BottleDoesntExistException extends \Exception
{
    public function __construct(string $bottleId)
    {
        parent::__construct(sprintf('Bottle with id %s doesn\'t exist', $bottleId));
    }
}
