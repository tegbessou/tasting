<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation;

use EmpireDesAmis\Tasting\Domain\Exception\ParticipantAlreadyInvitedException;
use Symfony\Component\Validator\ConstraintViolation;
use Symfony\Component\Validator\ConstraintViolationList;
use Symfony\Contracts\Translation\TranslatorInterface;

final readonly class BuildParticipantsAlreadyInvitedConstraintViolation
{
    public function __construct(
        private TranslatorInterface $translator,
    ) {
    }

    public function build(ParticipantAlreadyInvitedException $exception): ConstraintViolationList
    {
        $violations = new ConstraintViolationList();
        $violations->add(new ConstraintViolation(
            $this->translator->trans(
                'tasting.participant.already_invited',
                [
                    'participant' => $exception->participant,
                ],
                'validators'
            ),
            null,
            [],
            $exception->participant,
            'participants',
            $exception->participant,
        ));

        return $violations;
    }
}
