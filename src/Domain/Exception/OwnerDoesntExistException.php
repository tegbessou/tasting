<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Exception;

final class OwnerDoesntExistException extends \Exception
{
    public function __construct(
        public string $ownerId,
    ) {
        parent::__construct(sprintf('Owner with id %s doesn\'t exist', $ownerId));
    }
}
