<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection\Projector;

use App\Tasting\Application\Adapter\TastingAdapterInterface;
use App\Tasting\Application\Exception\OwnerDoesntExistException;
use App\Tasting\Application\Exception\TastingDoesntExistException;
use App\Tasting\Application\ReadModel\Tasting;
use App\Tasting\Domain\Adapter\UserAdapterInterface;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;

final readonly class CreateTastingProjector
{
    public function __construct(
        private TastingRepositoryInterface $tastingRepository,
        private TastingAdapterInterface $tastingAdapter,
        private UserAdapterInterface $userAdapter,
    ) {
    }

    public function project(
        string $id,
        string $ownerId,
        string $bottleName,
    ): void {
        $tasting = $this->tastingRepository->ofId(TastingId::fromString($id));

        if ($tasting === null) {
            throw new TastingDoesntExistException($id);
        }

        $owner = $this->userAdapter->ofEmail(ParticipantId::fromString($ownerId));

        if ($owner === null) {
            throw new OwnerDoesntExistException($ownerId);
        }

        $tasting = new Tasting(
            $id,
            [
                [
                    $owner->email()->value(),
                    $owner->fullName()?->value() ?? throw new \LogicException(),
                ],
            ],
            $bottleName,
            $owner->email()->value(),
            $owner->fullName()->value(),
        );

        $this->tastingAdapter->add($tasting);
    }
}
