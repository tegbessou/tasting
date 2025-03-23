<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\ValueObject;

use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

final readonly class TastingParticipants
{
    /** @var string[] */
    private array $values;

    public function __construct(
        array $participants,
    ) {
        Assert::isArray($participants);
        Assert::minCount($participants, 1);
        Assert::allEmail($participants);

        $this->values = $participants;
    }

    public function add(ParticipantId $participantId): self
    {
        return new self(
            array_merge($this->values, [$participantId->value()]),
        );
    }

    public function delete(ParticipantId $participantId): self
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

    public static function fromOwner(TastingOwnerId $ownerId): self
    {
        return new self([
            $ownerId->value(),
        ]);
    }

    public function contains(ParticipantId $participantId): bool
    {
        return in_array($participantId->value(), $this->values, true);
    }

    public function values(): array
    {
        return $this->values;
    }
}
