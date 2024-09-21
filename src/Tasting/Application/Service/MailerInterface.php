<?php

declare(strict_types=1);

namespace App\Tasting\Application\Service;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\InvitationLink;

interface MailerInterface
{
    public function sendInvitationEmail(
        Participant $owner,
        Participant $target,
        BottleName $bottleName,
        InvitationLink $link,
    ): void;
}
