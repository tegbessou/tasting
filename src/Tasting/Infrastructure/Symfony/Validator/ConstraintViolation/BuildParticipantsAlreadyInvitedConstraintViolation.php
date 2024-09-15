<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation;

use App\Tasting\Domain\Exception\ParticipantsAlreadyInvitedException;
use Symfony\Component\Validator\ConstraintViolation;
use Symfony\Component\Validator\ConstraintViolationList;
use Symfony\Contracts\Translation\TranslatorInterface;

final readonly class BuildParticipantsAlreadyInvitedConstraintViolation
{
    public function __construct(
        private TranslatorInterface $translator,
    ) {
    }

    public function build(ParticipantsAlreadyInvitedException $exception): ConstraintViolationList
    {
        $participantsString = implode(',', $exception->participants);

        $violations = new ConstraintViolationList();
        $violations->add(new ConstraintViolation(
            $this->translator->trans(
                'tasting.participants.already_invited',
                [
                    'participants' => $participantsString,
                ],
                'validators'
            ),
            null,
            [],
            $participantsString,
            'participants',
            $participantsString,
        ));

        return $violations;
    }
}
