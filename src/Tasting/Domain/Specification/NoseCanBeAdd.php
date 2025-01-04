<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Specification;

use App\Tasting\Domain\Entity\Sheet;
use App\Tasting\Domain\Exception\NoseAlreadyAddedException;

final readonly class NoseCanBeAdd
{
    public function __construct(
        private Sheet $sheet,
    ) {
    }

    public function satisfiedBy(): void
    {
        if ($this->sheet->nose() !== null) {
            throw new NoseAlreadyAddedException();
        }
    }
}
