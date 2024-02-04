<?php

declare(strict_types=1);

namespace App\User\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class Email
{
    #[ORM\Column(unique: true)]
    private string $email;

    public function __construct(
        string $email,
    ) {
        Assert::lengthBetween($email, 1, 255);
        Assert::email($email);

        $this->email = $email;
    }

    public static function fromString(string $email): self
    {
        return new self($email);
    }

    public function email(): string
    {
        return $this->email;
    }
}
