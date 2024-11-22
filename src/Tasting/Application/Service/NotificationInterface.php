<?php

declare(strict_types=1);

namespace App\Tasting\Application\Service;

interface NotificationInterface
{
    public function sendInvitationNotification(
        string $fromFullName,
        string $targetId,
        string $bottleName,
    ): void;
}
