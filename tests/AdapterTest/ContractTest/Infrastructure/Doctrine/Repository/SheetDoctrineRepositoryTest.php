<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\ContractTest\Infrastructure\Doctrine\Repository;

use Doctrine\ORM\EntityManagerInterface;
use EmpireDesAmis\Tasting\Domain\Entity\Sheet;
use EmpireDesAmis\Tasting\Domain\Repository\SheetRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetParticipant;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetTastingId;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Eye;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Mouth;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Nose;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use Symfony\Bridge\Doctrine\Types\UuidType;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class SheetDoctrineRepositoryTest extends KernelTestCase
{
    use RefreshDatabase;

    private SheetRepositoryInterface $doctrineSheetRepository;
    private EntityManagerInterface $entityManager;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->doctrineSheetRepository = $container->get(SheetRepositoryInterface::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);

        parent::setUp();
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->doctrineSheetRepository->ofId(
                SheetId::fromString(
                    '1a9ea2de-bb0b-4104-ab6a-8b57d2e65394',
                ),
            ),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->doctrineSheetRepository->ofId(
                SheetId::fromString(
                    '41574f57-f5af-4e0c-bde7-49bb2f161e33',
                ),
            ),
        );
    }

    public function testAdd(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('a78d3413-366a-42ab-a78a-a89e1eec09f0'),
            SheetTastingId::fromString('6c081883-6256-4141-aeba-cba6f358c3c7'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $this->doctrineSheetRepository->add($sheet);

        $sheet = $this->doctrineSheetRepository->ofId(
            SheetId::fromString('a78d3413-366a-42ab-a78a-a89e1eec09f0'),
        );

        $this->assertNotNull($sheet);

        $this->assertEquals(
            'a78d3413-366a-42ab-a78a-a89e1eec09f0',
            $sheet->id()->value(),
        );

        $this->assertEquals(
            '6c081883-6256-4141-aeba-cba6f358c3c7',
            $sheet->tastingId()->value(),
        );
        $this->assertEquals(
            'hugues.gobet@gmail.com',
            $sheet->participant()->value(),
        );
    }

    public function testWithTastingAndParticipant(): void
    {
        $sheets = $this->doctrineSheetRepository->withTastingAndParticipant(
            SheetTastingId::fromString(
                '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            ),
            SheetParticipant::fromString(
                'hugues.gobet@gmail.com',
            ),
        );

        $this->assertNotEmpty($sheets);

        $this->assertEquals(
            '1a9ea2de-bb0b-4104-ab6a-8b57d2e65394',
            $sheets[0]->id()->value(),
        );

        $this->assertEquals(
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            $sheets[0]->tastingId()->value(),
        );
        $this->assertEquals(
            'hugues.gobet@gmail.com',
            $sheets[0]->participant()->value(),
        );
    }

    public function testWithTasting(): void
    {
        $sheets = $this->doctrineSheetRepository->withTasting(
            SheetTastingId::fromString(
                '964a3cb8-5fbd-4678-a5cd-e371c09ea722',
            ),
        );

        $this->assertNotEmpty($sheets);

        $this->assertEquals(
            '53fdb99f-b379-4d28-a1c8-541df07a7c34',
            $sheets[0]->id()->value(),
        );

        $this->assertEquals(
            '964a3cb8-5fbd-4678-a5cd-e371c09ea722',
            $sheets[0]->tastingId()->value(),
        );
        $this->assertEquals(
            'hugues.gobet@gmail.com',
            $sheets[0]->participant()->value(),
        );
    }

    public function testDelete(): void
    {
        $sheet = $this->doctrineSheetRepository->ofId(
            SheetId::fromString('53fdb99f-b379-4d28-a1c8-541df07a7c34'),
        );

        $this->doctrineSheetRepository->delete($sheet);

        $sheet = $this->doctrineSheetRepository->ofId(
            SheetId::fromString('53fdb99f-b379-4d28-a1c8-541df07a7c34'),
        );

        $this->assertNull($sheet);

        $eyes = $this->entityManager->createQueryBuilder()
            ->select('eye')
            ->from(Eye::class, 'eye')
            ->where('eye.sheet = :sheetId')
            ->setParameter(
                'sheetId',
                '53fdb99f-b379-4d28-a1c8-541df07a7c34',
                UuidType::NAME,
            )
            ->getQuery()
            ->getResult()
        ;

        $this->assertEmpty($eyes);

        $noses = $this->entityManager->createQueryBuilder()
            ->select('nose')
            ->from(Nose::class, 'nose')
            ->where('nose.sheet = :sheetId')
            ->setParameter(
                'sheetId',
                '53fdb99f-b379-4d28-a1c8-541df07a7c34',
                UuidType::NAME,
            )
            ->getQuery()
            ->getResult()
        ;

        $this->assertEmpty($noses);

        $mouths = $this->entityManager->createQueryBuilder()
            ->select('mouth')
            ->from(Mouth::class, 'mouth')
            ->where('mouth.sheet = :sheetId')
            ->setParameter(
                'sheetId',
                '53fdb99f-b379-4d28-a1c8-541df07a7c34',
                UuidType::NAME,
            )
            ->getQuery()
            ->getResult()
        ;

        $this->assertEmpty($mouths);
    }
}
