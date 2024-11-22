<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Mailer;

use App\Tasting\Application\Service\MailerInterface;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\Mailer\MailerInterface as SymfonyMailerInterface;
use Symfony\Contracts\Translation\TranslatorInterface;

final readonly class Mailer implements MailerInterface
{
    public function __construct(
        private SymfonyMailerInterface $mailer,
        private TranslatorInterface $translator,
    ) {
    }

    #[\Override]
    public function sendInvitationEmail(
        string $fromId,
        string $fromFullName,
        string $targetId,
        string $bottleName,
        string $link,
    ): void {
        $email = (new TemplatedEmail())
            ->from($fromId)
            ->to($targetId)
            ->subject(
                $this->translator->trans(
                    'tasting.invitation.subject',
                    [],
                    'mails',
                ),
            )
            ->htmlTemplate('mail/degustation.html.twig')
            ->context([
                'ownerFullName' => $fromFullName,
                'bottleName' => $bottleName,
                'link' => $link,
            ])
        ;

        $this->mailer->send($email);
    }
}
