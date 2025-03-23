<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Service;

use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationLink;

final readonly class GetInvitationLink
{
    public static function getLink(): InvitationLink
    {
        return InvitationLink::fromString('https://apps.apple.com/app/6468406309');
    }
}
