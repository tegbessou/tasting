<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Service;

interface MailerInterface
{
    public function sendInvitationEmail(
        string $fromId,
        string $fromFullName,
        string $targetId,
        string $bottleName,
        string $link,
    ): void;
}
