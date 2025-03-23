<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Doctrine\Mapper;

use EmpireDesAmis\Tasting\Domain\Entity\Sheet;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetParticipant;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetTastingId;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Sheet as SheetDoctrine;

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
            $sheet->mouth === null ? null : MouthMapper::toDomain($sheet->mouth),
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

        if ($sheet->mouth() !== null) {
            self::synchronizeMouth($sheet, $sheetDoctrine);
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

    public static function synchronizeMouth(Sheet $sheet, SheetDoctrine $sheetDoctrine): void
    {
        if ($sheet->mouth() === null) {
            throw new \LogicException('Mouth shouln\'t be null');
        }

        if ($sheetDoctrine->mouth === null) {
            $sheetDoctrine->mouth = MouthMapper::toInfrastructurePersist($sheet->mouth(), $sheetDoctrine);

            return;
        }

        $sheetDoctrine->mouth = MouthMapper::toInfrastructureUpdate($sheet->mouth(), $sheetDoctrine->mouth);
    }
}
