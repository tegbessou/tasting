<?php

declare(strict_types=1);

namespace App\BottleInventory\Domain\Entity;

use App\BottleInventory\Domain\Event\OwnerCreatedEvent;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Domain\ValueObject\OwnerFullName;
use App\BottleInventory\Domain\ValueObject\OwnerId;
use App\Shared\Domain\Entity\EntityDomainEventTrait;
use App\Shared\Domain\Entity\EntityWithDomainEventInterface;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class Owner implements EntityWithDomainEventInterface
{
    use EntityDomainEventTrait;

    public function __construct(
        #[ORM\Embedded(columnPrefix: false)]
        private OwnerId $id,
        #[ORM\Embedded(columnPrefix: false)]
        private OwnerEmail $email,
        #[ORM\Embedded(columnPrefix: false)]
        private OwnerFullName $fullName,
    ) {
    }

    public static function create(
        OwnerId $id,
        OwnerEmail $email,
        OwnerFullName $fullName,
    ): self {
        $owner = new self($id, $email, $fullName);

        $owner::recordEvent(
            new OwnerCreatedEvent(
                $owner->id()->value(),
            )
        );

        return $owner;
    }

    public function id(): OwnerId
    {
        return $this->id;
    }

    public function email(): OwnerEmail
    {
        return $this->email;
    }

    public function fullName(): OwnerFullName
    {
        return $this->fullName;
    }
}
