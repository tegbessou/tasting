<?php

declare(strict_types=1);

namespace App\Tasting\Application\Service;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\ValueObject\BottleName;

interface NotificationInterface
{
    public function sendInvitationNotification(
        Participant $owner,
        Participant $target,
        BottleName $bottleName,
    ): void;
}
