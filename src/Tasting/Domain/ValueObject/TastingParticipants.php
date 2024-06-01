<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Embeddable]
final readonly class TastingParticipants
{
    #[ORM\Column(name: 'participants', type: 'json')]
    private array $values;

    public function __construct(
        array $participants,
    ) {
        Assert::isArray($participants);
        Assert::minCount($participants, 1);
        Assert::allUuid($participants);

        $this->values = $participants;
    }

    public function add(array $participants): self
    {
        return new self(
            array_merge($this->values, $participants),
        );
    }

    public static function fromArray(array $participants): self
    {
        return new self($participants);
    }

    public static function fromOwner(TastingOwnerId $ownerId): self
    {
        return new self([
            $ownerId->id(),
        ]);
    }

    public function values(): array
    {
        return $this->values;
    }
}
