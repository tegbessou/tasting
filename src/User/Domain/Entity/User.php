<?php

declare(strict_types=1);

namespace App\User\Domain\Entity;

use App\User\Domain\ValueObject\Email;
use App\User\Domain\ValueObject\UserId;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
final readonly class User
{
    public function __construct(
        #[ORM\Embedded(columnPrefix: false)]
        private UserId $id,
        #[ORM\Embedded(columnPrefix: false)]
        private Email $email,
    ) {
    }

    public static function create(
        UserId $id,
        Email $email,
    ): self {
        return new self(
            $id,
            $email,
        );
    }

    public function id(): UserId
    {
        return $this->id;
    }

    public function email(): Email
    {
        return $this->email;
    }
}
