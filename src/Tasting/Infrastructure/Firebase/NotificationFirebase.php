<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Firebase;

use App\Tasting\Application\Service\NotificationInterface;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\ValueObject\BottleName;
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
    public function sendInvitationNotification(Participant $owner, Participant $target, BottleName $bottleName): void
    {
        $message = CloudMessage::withTarget('topic', sprintf('invitation_to_taste_%s', $target->id()->value()))
            ->withNotification(Notification::create(
                $this->translator->trans('tasting.invitation.title', [], 'notifications'),
                $this->translator->trans(
                    'tasting.invitation.body',
                    [
                        'fullName' => $owner->fullName()->value(),
                        'bottleName' => $bottleName->value(),
                    ],
                    'notifications',
                ))
            )
        ;

        $this->messaging->send($message);
    }
}
