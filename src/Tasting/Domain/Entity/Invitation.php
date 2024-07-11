<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Shared\Domain\Entity\EntityDomainEventTrait;
use App\Shared\Domain\Entity\EntityWithDomainEventInterface;
use App\Tasting\Domain\Event\InvitationCreatedEvent;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationLink;
use App\Tasting\Domain\ValueObject\InvitationSentAt;
use App\Tasting\Domain\ValueObject\InvitationStatus;
use App\Tasting\Domain\ValueObject\InvitationUpdatedAt;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
final class Invitation implements EntityWithDomainEventInterface
{
    use EntityDomainEventTrait;

    #[ORM\Embedded(columnPrefix: false)]
    private ?InvitationSentAt $sentAt = null;

    #[ORM\Embedded(columnPrefix: false)]
    private ?InvitationUpdatedAt $updatedAt = null;

    public function __construct(
        #[ORM\Embedded(columnPrefix: false)]
        private InvitationId $id,
        #[ORM\ManyToOne(targetEntity: Tasting::class)]
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
            new InvitationCreatedEvent(
                $invitation->id->id(),
                $subject->id()->id(),
                $target->email()->value(),
                $link->value(),
            ),
        );

        return $invitation;
    }

    public function id(): InvitationId
    {
        return $this->id;
    }

    public function subject(): Tasting
    {
        return $this->subject;
    }

    public function target(): Participant
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

    // create method to read invitation
    // create method to reject invitation
    // create method to accept invitation
    // update when sent via email + send notification in an asynchronous way
}
