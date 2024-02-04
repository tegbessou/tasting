<?php

declare(strict_types=1);

namespace App\Bottle\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class BottleOwnerId
{
    #[ORM\Column(type: 'uuid')]
    private string $ownerId;

    public function __construct(
        string $ownerId,
    ) {
        Assert::uuid($ownerId);

        $this->ownerId = $ownerId;
    }

    public static function fromString(
        string $ownerId,
    ): self {
        return new self($ownerId);
    }

    public function ownerId(): string
    {
        return $this->ownerId;
    }
}
