<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\ValueObject;

use EmpireDesAmis\Tasting\Domain\Enum\WineType;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

final readonly class Bottle
{
    private string $id;

    public function __construct(
        string $id,
        private string $name,
        private WineType $wineType,
    ) {
        Assert::uuid($id);

        $this->id = $id;
    }

    public static function create(
        string $id,
        string $name,
        string $wineType,
    ): self {
        return new self(
            $id,
            $name,
            WineType::from($wineType),
        );
    }

    public function id(): string
    {
        return $this->id;
    }

    public function name(): string
    {
        return $this->name;
    }

    public function wineType(): WineType
    {
        return $this->wineType;
    }
}
