<?php

declare(strict_types=1);

namespace App\Bottle\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleCountry
{
    #[ORM\Column(type: 'string', length: 255)]
    private string $country;

    public function __construct(
        string $country,
    ) {
        Assert::string($country);
        Assert::lengthBetween($country, 1, 255);

        $this->country = $country;
    }

    public static function fromString(string $country): self
    {
        return new self($country);
    }

    public function country(): string
    {
        return $this->country;
    }
}
