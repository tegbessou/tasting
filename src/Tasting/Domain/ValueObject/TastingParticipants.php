<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Shared\Infrastructure\Webmozart\Assert;
use App\Tasting\Domain\Entity\Participant;
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

    public function add(ParticipantId $participantId): self
    {
        return new self(
            array_merge($this->values, [$participantId->value()]),
        );
    }

    public function remove(ParticipantId $participantId): self
    {
        return new self(
            array_diff($this->values, [$participantId->value()]),
        );
    }

    /**
     * @param string[] $participants
     */
    public static function fromArray(array $participants): self
    {
        return new self($participants);
    }

    public static function fromOwner(ParticipantId $participantId): self
    {
        return new self([
            $participantId->value(),
        ]);
    }

    public function contains(Participant $participant): bool
    {
        return in_array($participant->id()->value(), $this->values, true);
    }

    public function values(): array
    {
        return $this->values;
    }
}
