<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum TastingInvitationStatus: string
{
    case PENDING = 'pending';
    case ACCEPTED = 'accepted';
    case REJECTED = 'rejected';
}
