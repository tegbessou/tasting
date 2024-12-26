<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Mapper;

use App\Tasting\Domain\Entity\Sheet;
use App\Tasting\Domain\ValueObject\SheetId;
use App\Tasting\Domain\ValueObject\SheetParticipant;
use App\Tasting\Domain\ValueObject\SheetTastingId;
use App\Tasting\Infrastructure\Doctrine\Entity\Sheet as SheetDoctrine;

final readonly class SheetMapper
{
    public static function toDomain(SheetDoctrine $sheet): Sheet
    {
        return new Sheet(
            SheetId::fromString($sheet->id),
            SheetTastingId::fromString($sheet->tastingId),
            SheetParticipant::fromString($sheet->participant),
            $sheet->eye === null ? null : EyeMapper::toDomain($sheet->eye),
        );
    }

    public static function toInfrastructurePersist(Sheet $sheet): SheetDoctrine
    {
        return new SheetDoctrine(
            $sheet->id()->value(),
            $sheet->tastingId()->value(),
            $sheet->participant()->value(),
        );
    }

    public static function toInfrastructureUpdate(Sheet $sheet, SheetDoctrine $sheetDoctrine): SheetDoctrine
    {
        $sheetDoctrine->tastingId = $sheet->tastingId()->value();
        $sheetDoctrine->participant = $sheet->participant()->value();

        if ($sheetDoctrine->eye === null) {
            self::synchronizeEye($sheet, $sheetDoctrine);
        }

        return $sheetDoctrine;
    }

    public static function synchronizeEye(Sheet $sheet, SheetDoctrine $sheetDoctrine): void
    {
        if ($sheetDoctrine->eye === null) {
            $sheetDoctrine->eye = EyeMapper::toInfrastructurePersist($sheet->eye(), $sheetDoctrine);

            return;
        }

        $sheetDoctrine->eye = EyeMapper::toInfrastructureUpdate($sheet->eye(), $sheetDoctrine->eye);
    }
}
