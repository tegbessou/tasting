<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection\Projector;

use EmpireDesAmis\Tasting\Application\Adapter\TastingAdapterInterface;
use EmpireDesAmis\Tasting\Application\Exception\OwnerDoesntExistException;
use EmpireDesAmis\Tasting\Application\Exception\TastingDoesntExistException;
use EmpireDesAmis\Tasting\Application\ReadModel\Tasting;
use EmpireDesAmis\Tasting\Domain\Adapter\ParticipantAdapterInterface;
use EmpireDesAmis\Tasting\Domain\Repository\TastingRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\ParticipantId;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingId;

final readonly class CreateTastingProjector
{
    public function __construct(
        private TastingRepositoryInterface $tastingRepository,
        private TastingAdapterInterface $tastingAdapter,
        private ParticipantAdapterInterface $userAdapter,
    ) {
    }

    public function project(
        string $id,
        string $ownerId,
        string $bottleName,
        string $bottleWineType,
    ): void {
        $tasting = $this->tastingRepository->ofId(TastingId::fromString($id));

        if ($tasting === null) {
            throw new TastingDoesntExistException($id);
        }

        $owner = $this->userAdapter->ofId(ParticipantId::fromString($ownerId));

        if ($owner === null) {
            throw new OwnerDoesntExistException($ownerId);
        }

        $tasting = new Tasting(
            $id,
            [
                [
                    $owner->id()->value(),
                    $owner->fullName()?->value() ?? throw new \LogicException(),
                ],
            ],
            $bottleName,
            $bottleWineType,
            $owner->id()->value(),
            $owner->fullName()->value(),
        );

        $this->tastingAdapter->add($tasting);
    }
}
