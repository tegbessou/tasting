<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleId
{
    #[ORM\Column(name: 'bottle_id', type: 'uuid', unique: true)]
    private string $id;

    public function __construct(
        string $id,
    ) {
        Assert::minLength($id, 36);
        Assert::maxLength($id, 36);
        Assert::uuid($id);

        $this->id = $id;
    }

    public static function fromString(string $id): self
    {
        return new self($id);
    }

    public function id(): string
    {
        return $this->id;
    }
}
