<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation;

use App\Tasting\Domain\Exception\EyeParticipantAlreadyAddEyeException;
use Symfony\Component\Validator\ConstraintViolation;
use Symfony\Component\Validator\ConstraintViolationList;
use Symfony\Contracts\Translation\TranslatorInterface;

final readonly class BuildEyeParticipantAlreadyAddEyeConstraintViolation
{
    public function __construct(
        private TranslatorInterface $translator,
    ) {
    }

    public function build(EyeParticipantAlreadyAddEyeException $exception): ConstraintViolationList
    {
        $violations = new ConstraintViolationList();
        $violations->add(new ConstraintViolation(
            $this->translator->trans(
                'tasting.add_eye.participant.pariticpant_already_add_eye',
                [
                    'participant' => $exception->participant,
                    'tastingId' => $exception->tastingId,
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
