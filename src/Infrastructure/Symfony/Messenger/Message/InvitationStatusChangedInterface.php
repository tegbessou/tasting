<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message;

interface InvitationStatusChangedInterface
{
    public function getTastingId(): string;

    public function getInvitationId(): string;
}
