<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

final readonly class InvitationUpdatedAt
{
    private ?\DateTimeImmutable $updatedAt;

    public function __construct(\DateTimeImmutable $updatedAt)
    {
        Assert::dateNotInferiorThanToday($updatedAt);

        $this->updatedAt = $updatedAt;
    }

    public static function create(): self
    {
        return new self(new \DateTimeImmutable());
    }

    public function value(): ?\DateTimeImmutable
    {
        return $this->updatedAt;
    }
}
