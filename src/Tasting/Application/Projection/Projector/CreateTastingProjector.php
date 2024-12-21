<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection\Projector;

use App\Tasting\Application\Adapter\TastingAdapterInterface;
use App\Tasting\Application\Exception\OwnerDoesntExistException;
use App\Tasting\Application\Exception\TastingDoesntExistException;
use App\Tasting\Application\ReadModel\Tasting;
use App\Tasting\Domain\Adapter\ParticipantAdapterInterface;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;

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
