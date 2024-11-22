<?php

declare(strict_types=1);

namespace App\Tasting\Application\Service;

interface MailerInterface
{
    public function sendInvitationEmail(
        string $fromId,
        string $fromName,
        string $targetId,
        string $bottleName,
        string $link,
    ): void;
}
