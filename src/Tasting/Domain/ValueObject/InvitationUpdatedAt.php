<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class InvitationUpdatedAt
{
    #[ORM\Column(name: 'updated_at', type: 'datetime_immutable', nullable: true)]
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
