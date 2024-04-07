<?php

declare(strict_types=1);

namespace App\User\Domain\Entity;

use App\Shared\Domain\Entity\EntityDomainEventTrait;
use App\Shared\Domain\Entity\EntityWithDomainEventInterface;
use App\User\Domain\Event\UserCreatedEvent;
use App\User\Domain\ValueObject\UserEmail;
use App\User\Domain\ValueObject\UserId;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
final class User implements EntityWithDomainEventInterface
{
    use EntityDomainEventTrait;

    public function __construct(
        #[ORM\Embedded(columnPrefix: false)]
        private UserId $id,
        #[ORM\Embedded(columnPrefix: false)]
        private UserEmail $email,
    ) {
    }

    public static function create(
        UserId $id,
        UserEmail $email,
    ): self {
        $user = new self(
            $id,
            $email,
        );

        $user::recordEvent(
            new UserCreatedEvent(
                $user->id->value(),
            )
        );

        return $user;
    }

    public function id(): UserId
    {
        return $this->id;
    }

    public function email(): UserEmail
    {
        return $this->email;
    }
}
