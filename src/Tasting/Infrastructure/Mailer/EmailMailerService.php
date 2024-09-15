<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Mailer;

use App\Tasting\Application\Service\EmailServiceInterface;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\InvitationLink;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Contracts\Translation\TranslatorInterface;

final readonly class EmailMailerService implements EmailServiceInterface
{
    public function __construct(
        private MailerInterface $mailer,
        private TranslatorInterface $translator,
    ) {
    }

    #[\Override]
    public function sendInvitationEmail(Participant $owner, Participant $target, BottleName $bottleName, InvitationLink $link): void
    {
        $email = (new TemplatedEmail())
            ->from($owner->email()->value())
            ->to($target->email()->value())
            ->subject(
                $this->translator->trans(
                    'tasting.invitation.subject',
                    [],
                    'mails',
                ),
            )
            ->htmlTemplate('mail/degustation.html.twig')
            ->context([
                'ownerFullName' => $owner->fullName()->value(),
                'targetFullName' => $target->fullName()->value(),
                'bottleName' => $bottleName->value(),
                'link' => $link->value(),
            ])
        ;

        $this->mailer->send($email);
    }
}
