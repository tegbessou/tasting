<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

final readonly class InvitationSentAt
{
    private \DateTimeImmutable $sentAt;

    public function __construct(\DateTimeImmutable $sentAt)
    {
        Assert::dateNotInferiorThanToday($sentAt);

        $this->sentAt = $sentAt;
    }

    public static function now(): self
    {
        return new self(new \DateTimeImmutable());
    }

    public function value(): \DateTimeImmutable
    {
        return $this->sentAt;
    }
}
