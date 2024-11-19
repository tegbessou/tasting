<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Tasting\Domain\ValueObject\InvitationCreatedAt;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationLink;
use App\Tasting\Domain\ValueObject\InvitationSentAt;
use App\Tasting\Domain\ValueObject\InvitationStatus;
use App\Tasting\Domain\ValueObject\InvitationTarget;
use App\Tasting\Domain\ValueObject\InvitationUpdatedAt;

final class Invitation
{
    public function __construct(
        private readonly InvitationId $id,
        private readonly InvitationTarget $target,
        private readonly InvitationLink $link,
        private InvitationStatus $status,
        private readonly InvitationCreatedAt $createdAt,
        private readonly ?InvitationUpdatedAt $updatedAt = null,
        private ?InvitationSentAt $sentAt = null,
    ) {
    }

    public static function create(
        InvitationId $id,
        InvitationTarget $target,
        InvitationLink $link,
    ): self {
        return new self(
            $id,
            $target,
            $link,
            InvitationStatus::fromString('pending'),
            InvitationCreatedAt::now(),
        );
    }

    public function changeStatus(
        InvitationStatus $status,
    ): void {
        $this->status = $status;
    }

    public function send(): void
    {
        $this->sentAt = InvitationSentAt::now();
    }

    public function id(): InvitationId
    {
        return $this->id;
    }

    public function target(): InvitationTarget
    {
        return $this->target;
    }

    public function link(): InvitationLink
    {
        return $this->link;
    }

    public function status(): InvitationStatus
    {
        return $this->status;
    }

    public function sentAt(): ?InvitationSentAt
    {
        return $this->sentAt;
    }

    public function updatedAt(): ?InvitationUpdatedAt
    {
        return $this->updatedAt;
    }

    public function createdAt(): InvitationCreatedAt
    {
        return $this->createdAt;
    }

    public function isAlreadySent(): bool
    {
        if ($this->sentAt === null) {
            return false;
        }

        if ($this->sentAt->isNull()) {
            return false;
        }

        return true;
    }
}
