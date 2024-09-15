<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class InvitationCreatedAt
{
    #[ORM\Column(name: 'created_at', type: 'datetime_immutable', nullable: true)]
    private ?\DateTimeImmutable $createdAt;

    public function __construct(\DateTimeImmutable $createdAt)
    {
        Assert::dateNotInferiorThanToday($createdAt);

        $this->createdAt = $createdAt;
    }

    public static function now(): self
    {
        return new self(new \DateTimeImmutable());
    }

    public function value(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

    public function isNull(): bool
    {
        return $this->createdAt === null;
    }
}
