<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Firebase;

use App\Tasting\Application\Service\NotificationServiceInterface;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\ValueObject\BottleName;
use Kreait\Firebase\Messaging\Notification;
use Symfony\Contracts\Translation\TranslatorInterface;

final class NotificationFirebaseFakeService implements NotificationServiceInterface
{
    public static array $notifications = [];

    public function __construct(
        private readonly TranslatorInterface $translator,
    ) {
    }

    #[\Override]
    public function sendInvitationNotification(Participant $owner, Participant $target, BottleName $bottleName): void
    {
        $notification = Notification::create(
            $this->translator->trans('tasting.invitation.title', [], 'notifications'),
            $this->translator->trans(
                'tasting.invitation.body',
                [
                    'fullName' => $owner->fullName()->value(),
                    'bottleName' => $bottleName->value(),
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
