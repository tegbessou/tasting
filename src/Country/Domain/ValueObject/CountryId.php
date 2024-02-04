<?php

declare(strict_types=1);

namespace App\Country\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class CountryId
{
    #[ORM\Id]
    #[ORM\Column(type: 'uuid', unique: true)]
    private string $id;

    public function __construct(
        string $id,
    ) {
        Assert::uuid($id);

        $this->id = $id;
    }

    public static function fromString(string $id): self
    {
        return new self($id);
    }

    public function id(): string
    {
        return $this->id;
    }
}
