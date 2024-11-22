<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use App\Tasting\Infrastructure\Doctrine\Entity\Tasting as TastingDoctrine;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class TastingDoctrineRepositoryTest extends KernelTestCase
{
    private TastingRepositoryInterface $doctrineTastingRepository;

    private EntityManagerInterface $entityManager;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->doctrineTastingRepository = $container->get(TastingRepositoryInterface::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);

        $this->entityManager->beginTransaction();

        parent::setUp();
    }

    #[\Override]
    protected function tearDown(): void
    {
        $this->entityManager->rollback();

        parent::tearDown();
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->doctrineTastingRepository->ofId(
                TastingId::fromString(
                    '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'
                ),
            ),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->doctrineTastingRepository->ofId(
                TastingId::fromString(
                    '41574f57-f5af-4e0c-bde7-49bb2f161e33'
                ),
            ),
        );
    }

    public function testWithBottle(): void
    {
        $tastings = $this->doctrineTastingRepository->withBottle(
            BottleName::fromString('Domaine Leflaive Montrachet Grand Cru 2016'),
        );

        $this->assertNotNull($tastings->current());
        $this->assertStringContainsString('hugues.gobet@gmail.com', $tastings->current()->ownerId()->value());
    }

    public function testAdd(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('0d022ae1-7129-49c2-b0a4-ed8b8612715f'),
            BottleName::fromString('Château Margaux 2015'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $this->doctrineTastingRepository->add($tasting);

        $tasting = $this->doctrineTastingRepository->ofId(
            TastingId::fromString('0d022ae1-7129-49c2-b0a4-ed8b8612715f'),
        );

        $this->assertNotNull($tasting);

        $this->assertEquals(
            'Château Margaux 2015',
            $tasting->bottleName()->value(),
        );
        $this->assertEquals(
            'hugues.gobet@gmail.com',
            $tasting->ownerId()->value(),
        );

        $tastingDoctrine = $this->entityManager
            ->getRepository(TastingDoctrine::class)
            ->find('0d022ae1-7129-49c2-b0a4-ed8b8612715f')
        ;

        $this->entityManager->remove($tastingDoctrine);
        $this->entityManager->flush();
    }

    public function testNextIdentity(): void
    {
        $this->assertIsString(
            $this->doctrineTastingRepository->nextIdentity()->value(),
        );
    }
}
