<?php

declare(strict_types=1);

namespace App\Tasting\Application\Exception;

final class SheetAlreadyExistException extends \Exception
{
    public function __construct(
        public readonly string $tasting,
        public readonly string $participant,
    ) {
        parent::__construct(
            sprintf(
                'Sheet with tasting %s for participant %s already exists',
                $this->tasting,
                $this->participant,
            ),
        );
    }
}
