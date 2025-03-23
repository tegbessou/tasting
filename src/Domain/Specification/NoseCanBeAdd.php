<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Specification;

use EmpireDesAmis\Tasting\Domain\Entity\Sheet;
use EmpireDesAmis\Tasting\Domain\Exception\NoseAlreadyAddedException;

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
