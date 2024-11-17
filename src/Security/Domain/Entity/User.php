<?php

declare(strict_types=1);

namespace App\Security\Domain\Entity;

use App\Security\Domain\Event\UserCreated;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Domain\ValueObject\UserId;
use Doctrine\ORM\Mapping as ORM;
use TegCorp\SharedKernelBundle\Domain\Entity\EntityDomainEventTrait;
use TegCorp\SharedKernelBundle\Domain\Entity\EntityWithDomainEventInterface;

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
            new UserCreated(
                $user->id->value(),
                $user->email->value(),
            ),
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
