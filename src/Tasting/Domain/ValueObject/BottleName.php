<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleName
{
    #[ORM\Column(name: 'bottle_name')]
    private string $name;

    public function __construct(
        string $name,
    ) {
        Assert::string($name);
        Assert::maxLength($name, 255);

        $this->name = $name;
    }

    public static function fromString(
        string $name,
    ): self {
        return new self($name);
    }

    public function value(): string
    {
        return $this->name;
    }
}
