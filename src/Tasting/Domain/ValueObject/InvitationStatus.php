<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Tasting\Domain\Enum\TastingInvitationStatus as TastingInvitationStatusEnum;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class InvitationStatus
{
    public function __construct(#[ORM\Column(name: 'status', type: 'string', length: 10, nullable: false, enumType: TastingInvitationStatusEnum::class)]
        public TastingInvitationStatusEnum $status)
    {
    }

    public static function fromString(
        string $status,
    ): self {
        return new self(
            TastingInvitationStatusEnum::from($status),
        );
    }

    public function isAccepted(): bool
    {
        return $this->status === TastingInvitationStatusEnum::ACCEPTED;
    }

    public function isPending(): bool
    {
        return $this->status === TastingInvitationStatusEnum::PENDING;
    }

    public function isRejected(): bool
    {
        return $this->status === TastingInvitationStatusEnum::REJECTED;
    }
}
