<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Service;

final class SendInvitationService
{
    public function canSendInvitation(): void
    {
        // vérifier que l'invitation existe et qu'elle n'est pas déjà envoyé en vérifiant que la date est null
        // logique du domaine donc à mettre dans un service

        // vérifier que la bouteille existe
        // logique du domaine donc à mettre dans un service
    }
}
