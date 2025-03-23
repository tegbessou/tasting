<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection\Projector;

use EmpireDesAmis\Tasting\Application\Adapter\SheetAdapterInterface;
use EmpireDesAmis\Tasting\Application\Exception\SheetDoesntExistException;
use EmpireDesAmis\Tasting\Application\Exception\SheetParticipantDoesntExistException;
use EmpireDesAmis\Tasting\Application\ReadModel\Sheet;
use EmpireDesAmis\Tasting\Domain\Adapter\ParticipantAdapterInterface;
use EmpireDesAmis\Tasting\Domain\Repository\SheetRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\ParticipantId;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;

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
