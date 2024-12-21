<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation;

use App\Tasting\Domain\Exception\EyeParticipantNotInvitedException;
use Symfony\Component\Validator\ConstraintViolation;
use Symfony\Component\Validator\ConstraintViolationList;
use Symfony\Contracts\Translation\TranslatorInterface;

final readonly class BuildEyeParticipantNotInvitedConstraintViolation
{
    public function __construct(
        private TranslatorInterface $translator,
    ) {
    }

    public function build(EyeParticipantNotInvitedException $exception): ConstraintViolationList
    {
        $violations = new ConstraintViolationList();
        $violations->add(new ConstraintViolation(
            $this->translator->trans(
                'tasting.add_eye.pariticipant.not_invited',
                [
                    'participant' => $exception->participant,
                ],
                'validators'
            ),
            null,
            [],
            $exception->participant,
            'participant',
            $exception->participant,
        ));

        return $violations;
    }
}
