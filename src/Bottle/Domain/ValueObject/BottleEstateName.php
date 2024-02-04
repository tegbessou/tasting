<?php

declare(strict_types=1);

namespace App\Bottle\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleEstateName
{
    #[ORM\Column(type: 'string', length: 255)]
    private string $estateName;

    public function __construct(
        string $estateName,
    ) {
        Assert::string($estateName);
        Assert::lengthBetween($estateName, 1, 255);

        $this->estateName = $estateName;
    }

    public static function fromString(string $estateName): self
    {
        return new self($estateName);
    }

    public function estateName(): string
    {
        return $this->estateName;
    }
}
