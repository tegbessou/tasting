<?php

declare(strict_types=1);

namespace App\Security\Domain\Exception;

final class UserAlreadyExistsException extends \Exception
{
    public function __construct(
        public string $email,
    ) {
        parent::__construct(sprintf('User with email %s already exists', $email));
    }
}
