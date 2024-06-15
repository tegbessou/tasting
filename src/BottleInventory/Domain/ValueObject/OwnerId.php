<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final class OwnerId
{
    #[ORM\Id]
    #[ORM\Column(name: 'id', type: 'uuid', length: 36, unique: true)]
    private string $value;

    public function __construct(
        string $id,
    ) {
        Assert::minLength($id, 36);
        Assert::maxLength($id, 36);
        Assert::uuid($id);

        $this->value = $id;
    }

    public static function fromString(
        string $id,
    ): self {
        return new self($id);
    }

    public function value(): string
    {
        return $this->value;
    }
}
