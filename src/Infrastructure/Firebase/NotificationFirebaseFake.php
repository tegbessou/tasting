<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Firebase;

use EmpireDesAmis\Tasting\Application\Service\NotificationInterface;
use Kreait\Firebase\Messaging\Notification;
use Symfony\Contracts\Translation\TranslatorInterface;

final class NotificationFirebaseFake implements NotificationInterface
{
    public static array $notifications = [];

    public function __construct(
        private readonly TranslatorInterface $translator,
    ) {
    }

    #[\Override]
    public function sendInvitationNotification(
        string $fromFullName,
        string $targetId,
        string $bottleName,
    ): void {
        $notification = Notification::create(
            $this->translator->trans('tasting.invitation.title', [], 'notifications'),
            $this->translator->trans(
                'tasting.invitation.body',
                [
                    'fullName' => $fromFullName,
                    'bottleName' => $bottleName,
                ],
                'notifications',
            )
        );

        self::addNotification($notification);
    }

    public static function getSent(): array
    {
        return self::$notifications;
    }

    private static function addNotification(Notification $notification): void
    {
        self::$notifications[] = $notification;
    }
}
