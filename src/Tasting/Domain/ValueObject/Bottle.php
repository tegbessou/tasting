<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

final readonly class Bottle
{
    public function __construct(
        private BottleId $id,
        private BottleName $name,
    ) {
    }

    public static function create(
        BottleId $id,
        BottleName $name,
    ): self {
        return new self(
            $id,
            $name,
        );
    }

    public function id(): BottleId
    {
        return $this->id;
    }

    public function name(): BottleName
    {
        return $this->name;
    }
}
