<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Command;

use TegCorp\SharedKernelBundle\Application\Command\CommandInterface;

/**
 * @implements CommandInterface<void>
 */
final readonly class AddEyeCommand implements CommandInterface
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
