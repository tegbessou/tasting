<?php

declare(strict_types=1);

namespace App\User\Domain\Service;

use App\User\Domain\Entity\User;

interface GetUserAuthenticatedInterface
{
    public function getUser(): User;
}
