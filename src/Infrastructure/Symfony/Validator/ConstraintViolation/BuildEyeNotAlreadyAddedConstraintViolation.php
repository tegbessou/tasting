<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation;

use Symfony\Component\Validator\ConstraintViolation;
use Symfony\Component\Validator\ConstraintViolationList;
use Symfony\Contracts\Translation\TranslatorInterface;

final readonly class BuildEyeNotAlreadyAddedConstraintViolation
{
    public function __construct(
        private TranslatorInterface $translator,
    ) {
    }

    public function build(): ConstraintViolationList
    {
        $violations = new ConstraintViolationList();
        $violations->add(new ConstraintViolation(
            $this->translator->trans(
                'tasting.update_eye.eye_not_already_added',
                [],
                'validators',
            ),
            null,
            [],
            null,
            null,
            null,
        ));

        return $violations;
    }
}
