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
            $sheet->nose === null ? null : NoseMapper::toDomain($sheet->nose),
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
        if ($sheet->eye() !== null) {
            self::synchronizeEye($sheet, $sheetDoctrine);
        }

        if ($sheet->nose() !== null) {
            self::synchronizeNose($sheet, $sheetDoctrine);
        }

        return $sheetDoctrine;
    }

    public static function synchronizeEye(Sheet $sheet, SheetDoctrine $sheetDoctrine): void
    {
        if ($sheet->eye() === null) {
            throw new \LogicException('Eye shouln\'t be null');
        }

        if ($sheetDoctrine->eye === null) {
            $sheetDoctrine->eye = EyeMapper::toInfrastructurePersist($sheet->eye(), $sheetDoctrine);

            return;
        }

        $sheetDoctrine->eye = EyeMapper::toInfrastructureUpdate($sheet->eye(), $sheetDoctrine->eye);
    }

    public static function synchronizeNose(Sheet $sheet, SheetDoctrine $sheetDoctrine): void
    {
        if ($sheet->nose() === null) {
            throw new \LogicException('Nose shouln\'t be null');
        }

        if ($sheetDoctrine->nose === null) {
            $sheetDoctrine->nose = NoseMapper::toInfrastructurePersist($sheet->nose(), $sheetDoctrine);

            return;
        }

        $sheetDoctrine->nose = NoseMapper::toInfrastructureUpdate($sheet->nose(), $sheetDoctrine->nose);
    }
}
