<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Repository;

use EmpireDesAmis\Tasting\Domain\Entity\Sheet;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetParticipant;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetTastingId;

interface SheetRepositoryInterface
{
    public function ofId(SheetId $id): ?Sheet;

    public function withTastingAndParticipant(SheetTastingId $tasting, SheetParticipant $participant): array;

    public function withTasting(SheetTastingId $tasting): array;

    public function add(Sheet $sheet): void;

    public function update(Sheet $sheet): void;

    public function delete(Sheet $sheet): void;
}
