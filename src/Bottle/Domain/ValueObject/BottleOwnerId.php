<?php

declare(strict_types=1);

namespace App\Bottle\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleOwnerId
{
    #[ORM\Column(name: 'owner_id', type: 'uuid')]
    private string $id;

    public function __construct(
        string $id,
    ) {
        Assert::uuid($id);

        $this->id = $id;
    }

    public static function fromString(
        string $id,
    ): self {
        return new self($id);
    }

    public function id(): string
    {
        return $this->id;
    }
}
