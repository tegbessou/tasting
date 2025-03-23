<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Doctrine\Repository;

use Doctrine\ORM\EntityManagerInterface;
use EmpireDesAmis\Tasting\Domain\Entity\Sheet;
use EmpireDesAmis\Tasting\Domain\Repository\SheetRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetParticipant;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetTastingId;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Sheet as SheetDoctrine;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Mapper\SheetMapper;
use Symfony\Bridge\Doctrine\Types\UuidType;

final readonly class SheetDoctrineRepository implements SheetRepositoryInterface
{
    private const string ENTITY_CLASS = SheetDoctrine::class;

    public function __construct(
        private EntityManagerInterface $entityManager,
    ) {
    }

    #[\Override]
    public function ofId(SheetId $id): ?Sheet
    {
        $sheet = $this->entityManager->getRepository(self::ENTITY_CLASS)->find($id->value());

        if ($sheet === null) {
            return null;
        }

        return SheetMapper::toDomain($sheet);
    }

    #[\Override]
    public function withTastingAndParticipant(SheetTastingId $tasting, SheetParticipant $participant): array
    {
        $sheets = $this->entityManager->createQueryBuilder()
            ->select('sheet')
            ->from(self::ENTITY_CLASS, 'sheet')
            ->where('sheet.tastingId = :tastingId AND sheet.participant = :participant')
            ->setParameter(
                'tastingId',
                $tasting->value(),
                UuidType::NAME,
            )
            ->setParameter(
                'participant',
                $participant->value(),
            )
            ->getQuery()->getResult()
        ;

        return array_map(fn (SheetDoctrine $sheet) => SheetMapper::toDomain($sheet), $sheets);
    }

    public function withTasting(SheetTastingId $tasting): array
    {
        $sheets = $this->entityManager->createQueryBuilder()
            ->select('sheet')
            ->from(self::ENTITY_CLASS, 'sheet')
            ->where('sheet.tastingId = :tastingId')
            ->setParameter(
                'tastingId',
                $tasting->value(),
                UuidType::NAME,
            )
            ->getQuery()->getResult()
        ;

        return array_map(fn (SheetDoctrine $sheet) => SheetMapper::toDomain($sheet), $sheets);
    }

    #[\Override]
    public function add(Sheet $sheet): void
    {
        $sheetDoctrine = SheetMapper::toInfrastructurePersist($sheet);

        $this->entityManager->persist($sheetDoctrine);
        $this->entityManager->flush();
    }

    #[\Override]
    public function update(Sheet $sheet): void
    {
        $sheetDoctrine = $this->entityManager->getRepository(self::ENTITY_CLASS)->find($sheet->id()->value());

        if ($sheetDoctrine === null) {
            throw new \LogicException('SheetDoctrineRepository Sheet must exist in doctrine.');
        }

        SheetMapper::toInfrastructureUpdate($sheet, $sheetDoctrine);

        $this->entityManager->flush();
    }

    #[\Override]
    public function delete(Sheet $sheet): void
    {
        $sheetDoctrine = $this->entityManager->getRepository(self::ENTITY_CLASS)->find($sheet->id()->value());

        if ($sheetDoctrine === null) {
            throw new \LogicException('SheetDoctrineRepository Sheet must exist in doctrine.');
        }

        $this->entityManager->remove($sheetDoctrine);
        $this->entityManager->flush();
    }
}
