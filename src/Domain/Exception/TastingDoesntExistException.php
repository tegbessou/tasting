<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Exception;

final class TastingDoesntExistException extends \Exception
{
    public function __construct(
        public string $tastingId,
    ) {
        parent::__construct(sprintf('Tasting with id %s doesn\'t exist', $tastingId));
    }
}
