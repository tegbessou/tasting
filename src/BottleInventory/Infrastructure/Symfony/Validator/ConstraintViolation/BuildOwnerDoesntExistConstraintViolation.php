<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Symfony\Validator\ConstraintViolation;

use Symfony\Component\Validator\ConstraintViolation;
use Symfony\Component\Validator\ConstraintViolationList;
use Symfony\Contracts\Translation\TranslatorInterface;

final readonly class BuildOwnerDoesntExistConstraintViolation
{
    public function __construct(
        private TranslatorInterface $translator,
    ) {
    }

    public function build(string $ownerId): ConstraintViolationList
    {
        $violations = new ConstraintViolationList();
        $violations->add(new ConstraintViolation(
            $this->translator->trans(
                'bottle_inventory.owner.doesnt_exist',
                ['id' => $ownerId],
                'validators'
            ),
            null,
            [],
            $ownerId,
            'ownerId',
            $ownerId
        ));

        return $violations;
    }
}
