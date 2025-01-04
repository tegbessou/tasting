<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Repository;

use App\Tasting\Domain\Entity\Sheet;
use App\Tasting\Domain\ValueObject\SheetId;
use App\Tasting\Domain\ValueObject\SheetParticipant;
use App\Tasting\Domain\ValueObject\SheetTastingId;

interface SheetRepositoryInterface
{
    public function ofId(SheetId $id): ?Sheet;

    public function withTastingAndParticipant(SheetTastingId $tasting, SheetParticipant $participant): array;

    public function withTasting(SheetTastingId $tasting): array;

    public function add(Sheet $sheet): void;

    public function update(Sheet $sheet): void;

    public function delete(Sheet $sheet): void;
}
