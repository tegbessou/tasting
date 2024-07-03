<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class TastingId
{
    #[ORM\Id]
    #[ORM\Column(name: 'id', type: 'uuid', unique: true)]
    private string $id;

    public function __construct(
        string $id,
    ) {
        Assert::minLength($id, 36);
        Assert::maxLength($id, 36);
        Assert::uuid($id);

        $this->id = $id;
    }

    public static function fromString(string $value): self
    {
        return new self($value);
    }

    public function id(): string
    {
        return $this->id;
    }
}
