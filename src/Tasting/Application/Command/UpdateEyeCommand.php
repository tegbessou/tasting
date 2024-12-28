<?php

declare(strict_types=1);

namespace App\Tasting\Application\Command;

use TegCorp\SharedKernelBundle\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<void>
 */
final readonly class UpdateEyeCommand implements CommandInterface
{
    public function __construct(
        public string $sheetId,
        public string $limpidite,
        public string $brillance,
        public string $intensiteCouleur,
        public string $teinte,
        public string $larme,
        public string $observation,
    ) {
    }
}
