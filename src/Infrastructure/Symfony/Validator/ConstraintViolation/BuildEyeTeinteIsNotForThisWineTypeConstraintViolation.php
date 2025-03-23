<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation;

use EmpireDesAmis\Tasting\Domain\Exception\EyeTeinteIsNotForThisWineTypeException;
use Symfony\Component\Validator\ConstraintViolation;
use Symfony\Component\Validator\ConstraintViolationList;
use Symfony\Contracts\Translation\TranslatorInterface;

final readonly class BuildEyeTeinteIsNotForThisWineTypeConstraintViolation
{
    public function __construct(
        private TranslatorInterface $translator,
    ) {
    }

    public function build(EyeTeinteIsNotForThisWineTypeException $exception): ConstraintViolationList
    {
        $violations = new ConstraintViolationList();
        $violations->add(new ConstraintViolation(
            $this->translator->trans(
                'tasting.add_eye.teinte.not_valid_for_wine_type',
                [
                    'teinte' => $exception->teinte,
                    'wineType' => $exception->wineType,
                ],
                'validators'
            ),
            null,
            [],
            $exception->teinte,
            'teinte',
            $exception->teinte,
        ));

        return $violations;
    }
}
