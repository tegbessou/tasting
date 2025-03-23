<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Firebase;

use EmpireDesAmis\Tasting\Application\Service\NotificationInterface;
use Kreait\Firebase\Contract\Messaging;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;
use Symfony\Contracts\Translation\TranslatorInterface;

final readonly class NotificationFirebase implements NotificationInterface
{
    public function __construct(
        private Messaging $messaging,
        private TranslatorInterface $translator,
    ) {
    }

    #[\Override]
    public function sendInvitationNotification(
        string $fromFullName,
        string $targetId,
        string $bottleName,
    ): void {
        $message = CloudMessage::withTarget('topic', sprintf('invitation_to_taste_%s', $targetId))
            ->withNotification(Notification::create(
                $this->translator->trans('tasting.invitation.title', [], 'notifications'),
                $this->translator->trans(
                    'tasting.invitation.body',
                    [
                        'fullName' => $fromFullName,
                        'bottleName' => $bottleName,
                    ],
                    'notifications',
                ))
            )
        ;

        $this->messaging->send($message);
    }
}
