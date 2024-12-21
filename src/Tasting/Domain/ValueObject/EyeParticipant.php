<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

final readonly class EyeParticipant
{
    public string $participant;

    public function __construct(
        string $participant,
    ) {
        Assert::email($participant);

        $this->participant = $participant;
    }

    public static function fromString(string $participant): self
    {
        return new self($participant);
    }

    public function value(): string
    {
        return $this->participant;
    }
}
