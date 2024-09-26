<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use Doctrine\ORM\Mapping as ORM;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

#[ORM\Embeddable]
final readonly class InvitationSentAt
{
    #[ORM\Column(name: 'sent_at', type: 'datetime_immutable', nullable: true)]
    private ?\DateTimeImmutable $sentAt;

    public function __construct(\DateTimeImmutable $sentAt)
    {
        Assert::dateNotInferiorThanToday($sentAt);

        $this->sentAt = $sentAt;
    }

    public static function now(): self
    {
        return new self(new \DateTimeImmutable());
    }

    public function value(): ?\DateTimeImmutable
    {
        return $this->sentAt;
    }

    public function isNull(): bool
    {
        return $this->sentAt === null;
    }
}
