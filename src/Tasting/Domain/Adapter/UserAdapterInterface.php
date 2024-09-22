<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Adapter;

use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\User;

interface UserAdapterInterface
{
    public function ofEmail(ParticipantEmail $email): ?User;
}
