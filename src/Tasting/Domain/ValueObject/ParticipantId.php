<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class ParticipantId
{
    #[ORM\Id]
    #[ORM\Column(name: 'id', type: 'uuid', length: 36, unique: true)]
    private string $value;

    public function __construct(
        string $value,
    ) {
        Assert::minLength($value, 36);
        Assert::maxLength($value, 36);
        Assert::uuid($value);

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
