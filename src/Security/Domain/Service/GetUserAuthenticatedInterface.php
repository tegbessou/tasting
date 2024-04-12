<?php

declare(strict_types=1);

namespace App\Security\Domain\Service;

use App\Security\Domain\Entity\User;

interface GetUserAuthenticatedInterface
{
    public function getUser(): User;
}
