<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Exception;

final class TastingDoesntExistException extends \Exception
{
    public function __construct(
        public readonly string $tastingId,
    ) {
        parent::__construct(sprintf('Tasting %s does not exist', $this->tastingId));
    }
}
