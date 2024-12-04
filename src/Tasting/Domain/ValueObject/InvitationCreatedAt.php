<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

final readonly class InvitationCreatedAt
{
    private \DateTimeImmutable $createdAt;

    public function __construct(\DateTimeImmutable $createdAt)
    {
        Assert::dateNotInferiorThanToday($createdAt);

        $this->createdAt = $createdAt;
    }

    public static function now(): self
    {
        return new self(new \DateTimeImmutable());
    }

    public function value(): \DateTimeImmutable
    {
        return $this->createdAt;
    }
}
