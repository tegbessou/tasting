<?php

declare(strict_types=1);

namespace App\Tasting\Application\Exception;

final class SheetDoesntExistException extends \Exception
{
    public function __construct(
        public readonly string $sheetId,
    ) {
        parent::__construct(sprintf('Sheet %s does not exist', $this->sheetId));
    }
}
