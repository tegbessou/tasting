<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Tasting\Domain\Event\InvitationAccepted;
use App\Tasting\Domain\Event\InvitationCreated;
use App\Tasting\Domain\Event\InvitationRejected;
use App\Tasting\Domain\Event\InvitationSent;
use App\Tasting\Domain\Exception\InvitationAlreadyAcceptedException;
use App\Tasting\Domain\Exception\InvitationAlreadyRejectedException;
use App\Tasting\Domain\Exception\InvitationAlreadySentException;
use App\Tasting\Domain\Exception\InvitationMustBeSentBeforeBeingAcceptedException;
use App\Tasting\Domain\Exception\InvitationMustBeSentBeforeBeingRejectedException;
use App\Tasting\Domain\ValueObject\InvitationCreatedAt;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationLink;
use App\Tasting\Domain\ValueObject\InvitationSentAt;
use App\Tasting\Domain\ValueObject\InvitationStatus;
use App\Tasting\Domain\ValueObject\InvitationUpdatedAt;
use Doctrine\ORM\Mapping as ORM;
use TegCorp\SharedKernelBundle\Domain\Entity\EntityDomainEventTrait;
use TegCorp\SharedKernelBundle\Domain\Entity\EntityWithDomainEventInterface;

#[ORM\Entity]
final class Invitation implements EntityWithDomainEventInterface
{
    use EntityDomainEventTrait;

    #[ORM\Embedded(columnPrefix: false)]
    private ?InvitationSentAt $sentAt = null;

    #[ORM\Embedded(columnPrefix: false)]
    private InvitationCreatedAt $createdAt;

    #[ORM\Embedded(columnPrefix: false)]
    private ?InvitationUpdatedAt $updatedAt = null;

    public function __construct(
        #[ORM\Embedded(columnPrefix: false)]
        private InvitationId $id,
        #[ORM\ManyToOne(targetEntity: Tasting::class, inversedBy: 'invitations')]
        #[ORM\JoinColumn(name: 'tasting_id', referencedColumnName: 'id')]
        private Tasting $subject,
        #[ORM\ManyToOne(targetEntity: Participant::class)]
        #[ORM\JoinColumn(name: 'target_id', referencedColumnName: 'id')]
        private Participant $target,
        #[ORM\Embedded(columnPrefix: false)]
        private InvitationLink $link,
        #[ORM\Embedded(columnPrefix: false)]
        private InvitationStatus $status,
    ) {
        $this->createdAt = InvitationCreatedAt::now();
    }

    public static function create(
        InvitationId $id,
        Tasting $subject,
        Participant $target,
        InvitationLink $link,
    ): self {
        $invitation = new self(
            $id,
            $subject,
            $target,
            $link,
            InvitationStatus::fromString('pending'),
        );

        self::recordEvent(
            new InvitationCreated(
                $invitation->id->value(),
                $target->email()->value(),
                $subject->owner()->email()->value(),
                $subject->bottleName()->value(),
            ),
        );

        return $invitation;
    }

    public function send(): void
    {
        if ($this->isAlreadySent()) {
            throw new InvitationAlreadySentException();
        }

        $this->sentAt = InvitationSentAt::now();

        self::recordEvent(
            new InvitationSent(
                $this->id->value(),
                $this->sentAt->value() ?? throw new \InvalidArgumentException(),
            ),
        );
    }

    public function accept(): void
    {
        if (!$this->isAlreadySent()) {
            throw new InvitationMustBeSentBeforeBeingAcceptedException();
        }

        if ($this->isAlreadyAccepted()) {
            throw new InvitationAlreadyAcceptedException();
        }

        $this->status = InvitationStatus::fromString('accepted');

        self::recordEvent(
            new InvitationAccepted(
                $this->id->value(),
            ),
        );
    }

    public function reject(): void
    {
        if (!$this->isAlreadySent()) {
            throw new InvitationMustBeSentBeforeBeingRejectedException();
        }

        if ($this->isAlreadyRejected()) {
            throw new InvitationAlreadyRejectedException();
        }

        $this->status = InvitationStatus::fromString('rejected');

        self::recordEvent(
            new InvitationRejected(
                $this->id->value(),
            ),
        );
    }

    public function id(): InvitationId
    {
        return $this->id;
    }

    public function target(): Participant
    {
        return $this->target;
    }

    public function subject(): Tasting
    {
        return $this->subject;
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

    public function isAlreadyAccepted(): bool
    {
        if ($this->status->isAccepted()) {
            return true;
        }

        return false;
    }

    public function isAlreadyRejected(): bool
    {
        if ($this->status->isRejected()) {
            return true;
        }

        return false;
    }
}
