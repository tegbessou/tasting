<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Sheet;
use App\Tasting\Domain\Repository\SheetRepositoryInterface;
use App\Tasting\Domain\ValueObject\SheetId;
use App\Tasting\Domain\ValueObject\SheetParticipant;
use App\Tasting\Domain\ValueObject\SheetTastingId;
use App\Tasting\Infrastructure\Doctrine\Entity\Sheet as SheetDoctrine;
use App\Tasting\Infrastructure\Doctrine\Mapper\SheetMapper;
use Doctrine\ORM\EntityManagerInterface;
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
}
