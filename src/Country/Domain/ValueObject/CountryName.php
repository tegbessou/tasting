<?php

declare(strict_types=1);

namespace App\Country\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class CountryName
{
    #[ORM\Column(type: 'string', length: 255, unique: true)]
    private string $name;

    public function __construct(
        string $name,
    ) {
        Assert::string($name);
        Assert::lengthBetween($name, 1, 255);

        $this->name = $name;
    }

    public static function fromString(string $name): self
    {
        return new self($name);
    }

    public function name(): string
    {
        return $this->name;
    }
}
