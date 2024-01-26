<?php

declare(strict_types=1);

namespace App\User\Domain\ValueObject;

use Doctrine\ORM\Mapping as ORM;
use Webmozart\Assert\Assert;

#[ORM\Embeddable]
final class UserId
{
    #[ORM\Id]
    #[ORM\Column(type: 'uuid', unique: true)]
    private string $id;

    public function __construct(string $id)
    {
        Assert::uuid($id);

        $this->id = $id;
    }

    public function id(): string
    {
        return $this->id;
    }
}
