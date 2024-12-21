<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Specification;

use App\Tasting\Domain\Entity\Eye;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Exception\EyeParticipantAlreadyAddEyeException;
use App\Tasting\Domain\Exception\EyeParticipantNotInvitedException;
use App\Tasting\Domain\Exception\EyeTeinteIsNotForThisWineTypeException;
use App\Tasting\Domain\ValueObject\ParticipantId;

final readonly class EyeCanBeAddSpecification
{
    public function __construct(
        private Tasting $tasting,
    ) {
    }

    public function satisfiedBy(Eye $eye): void
    {
        if (!$this->tasting->participants()->contains(
            ParticipantId::fromString($eye->participant()->value())
        )) {
            throw new EyeParticipantNotInvitedException($eye->participant()->value(), $this->tasting->id()->value());
        }

        if ($this->tasting->eyes()->contains($eye->participant())) {
            throw new EyeParticipantAlreadyAddEyeException($eye->participant()->value(), $this->tasting->id()->value());
        }

        if (!in_array($eye->teinte()->value(), $this->tasting->bottle()->wineType()->getTeintes())) {
            throw new EyeTeinteIsNotForThisWineTypeException($eye->teinte()->value(), $this->tasting->bottle()->wineType()->value);
        }
    }
}
