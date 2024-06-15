<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class OwnerEmail
{
    #[ORM\Column(name: 'email', type: 'string')]
    private string $email;

    public function __construct(
        string $email,
    ) {
        Assert::string($email);
        Assert::maxLength($email, 255);
        Assert::email($email);

        $this->email = $email;
    }

    public static function fromString(
        string $email,
    ): self {
        return new self($email);
    }

    public function value(): string
    {
        return $this->email;
    }
}
