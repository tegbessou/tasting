<?php

declare(strict_types=1);

namespace App\Tasting\Application\Projection\Projector;

use App\Tasting\Application\Adapter\SheetAdapterInterface;
use App\Tasting\Application\Exception\SheetDoesntExistException;
use App\Tasting\Application\Exception\SheetParticipantDoesntExistException;
use App\Tasting\Application\ReadModel\Sheet;
use App\Tasting\Domain\Adapter\ParticipantAdapterInterface;
use App\Tasting\Domain\Repository\SheetRepositoryInterface;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\SheetId;

final readonly class CreateSheetProjector
{
    public function __construct(
        private SheetRepositoryInterface $sheetRepository,
        private SheetAdapterInterface $sheetAdapter,
        private ParticipantAdapterInterface $userAdapter,
    ) {
    }

    public function project(
        string $id,
        string $tastingId,
        string $participant,
    ): void {
        $sheet = $this->sheetRepository->ofId(SheetId::fromString($id));

        if ($sheet === null) {
            throw new SheetDoesntExistException($id);
        }

        $participantInformation = $this->userAdapter->ofId(ParticipantId::fromString($participant));

        if ($participantInformation === null) {
            throw new SheetParticipantDoesntExistException($participant);
        }

        $sheet = new Sheet(
            $id,
            $tastingId,
            $participantInformation->id()->value(),
            $participantInformation->fullName()?->value() ?? throw new \LogicException(),
        );

        $this->sheetAdapter->add($sheet);
    }
}
