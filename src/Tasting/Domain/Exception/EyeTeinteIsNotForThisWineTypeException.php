<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Exception;

final class EyeTeinteIsNotForThisWineTypeException extends \Exception
{
    public function __construct(
        public readonly string $teinte,
        public readonly string $wineType,
    ) {
        parent::__construct(
            sprintf(
                'Teinte %s is not for wine type %s',
                $teinte,
                $wineType,
            ),
        );
    }
}
