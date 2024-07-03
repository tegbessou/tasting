<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Entity;

use App\Shared\Domain\Entity\EntityDomainEventTrait;
use App\Shared\Domain\Entity\EntityWithDomainEventInterface;
use App\Tasting\Domain\Event\ParticipantCreatedEvent;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantFullName;
use App\Tasting\Domain\ValueObject\ParticipantId;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class Participant implements EntityWithDomainEventInterface
{
    use EntityDomainEventTrait;

    public function __construct(
        #[ORM\Embedded(columnPrefix: false)]
        private ParticipantId $id,
        #[ORM\Embedded(columnPrefix: false)]
        private ParticipantEmail $email,
        #[ORM\Embedded(columnPrefix: false)]
        private ParticipantFullName $fullName,
    ) {
    }

    public static function create(
        ParticipantId $id,
        ParticipantEmail $email,
        ParticipantFullName $fullName,
    ): self {
        $participant = new self($id, $email, $fullName);

        self::recordEvent(
            new ParticipantCreatedEvent(
                $participant->id()->id(),
            )
        );

        return $participant;
    }

    public function id(): ParticipantId
    {
        return $this->id;
    }

    public function email(): ParticipantEmail
    {
        return $this->email;
    }

    public function fullName(): ParticipantFullName
    {
        return $this->fullName;
    }
}
