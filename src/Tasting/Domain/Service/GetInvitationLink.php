<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Service;

use App\Tasting\Domain\ValueObject\InvitationLink;

final readonly class GetInvitationLink
{
    public static function getLink(): InvitationLink
    {
        return InvitationLink::fromString('https://apps.apple.com/app/6468406309');
    }
}
