<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Enum;

enum TastingInvitationStatus: string
{
    case PENDING = 'pending';
    case ACCEPTED = 'accepted';
    case REJECTED = 'rejected';
}
