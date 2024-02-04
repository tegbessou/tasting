<?php

declare(strict_types=1);

namespace App\Bottle\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottlePicture
{
    #[ORM\Column(type: 'string', length: 255)]
    private string $picture;

    public function __construct(
        string $picture,
    ) {
        Assert::string($picture);
        Assert::lengthBetween($picture, 1, 255);

        $this->picture = $picture;
    }

    public static function fromString(
        string $picture,
    ): self {
        return new self($picture);
    }

    public function picture(): string
    {
        return $this->picture;
    }
}
