<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use Doctrine\ORM\Mapping as ORM;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

#[ORM\Embeddable]
final readonly class ParticipantEmail
{
    #[ORM\Column(name: 'email', type: 'string')]
    private string $value;

    public function __construct(
        string $value,
    ) {
        Assert::string($value);
        Assert::maxLength($value, 255);
        Assert::email($value);

        $this->value = $value;
    }

    public static function fromString(
        string $value,
    ): self {
        return new self($value);
    }

    public function value(): string
    {
        return $this->value;
    }
}
