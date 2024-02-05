<?php

declare(strict_types=1);

namespace App\User\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class UserEmail
{
    #[ORM\Column(name: 'email', unique: true)]
    private string $value;

    public function __construct(
        string $value,
    ) {
        Assert::lengthBetween($value, 1, 255);
        Assert::email($value);

        $this->value = $value;
    }

    public static function fromString(string $value): self
    {
        return new self($value);
    }

    public function value(): string
    {
        return $this->value;
    }
}
