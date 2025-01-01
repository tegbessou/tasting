<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Specification;

use App\Tasting\Domain\Entity\Eye;
use App\Tasting\Domain\Enum\WineType;
use App\Tasting\Domain\Exception\EyeTeinteIsNotForThisWineTypeException;

final readonly class EyeCanBeAdd
{
    public function satisfiedBy(Eye $eye, WineType $wineType): void
    {
        if (!in_array($eye->teinte()->value(), $wineType->getTeintes())) {
            throw new EyeTeinteIsNotForThisWineTypeException($eye->teinte()->value(), $wineType->value);
        }

        // ajouter le fait de ne pas pouvoir re rajouter un eye déjà ajouter
    }
}
