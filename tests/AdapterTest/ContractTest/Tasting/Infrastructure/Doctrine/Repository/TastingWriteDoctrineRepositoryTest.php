<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Doctrine\Repository\ParticipantReadDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\TastingWriteDoctrineRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class TastingWriteDoctrineRepositoryTest extends KernelTestCase
{
    private TastingWriteDoctrineRepository $doctrineTastingWriteRepository;

    private ParticipantReadDoctrineRepository $doctrineParticipantReadRepository;

    private EntityManagerInterface $entityManager;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->doctrineTastingWriteRepository = $container->get(TastingWriteDoctrineRepository::class);
        $this->doctrineParticipantReadRepository = $container->get(ParticipantReadDoctrineRepository::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);

        $this->entityManager->getConnection()->setNestTransactionsWithSavepoints(true);
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
            $this->doctrineTastingWriteRepository->ofId(TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537')),
        );
    }

    public function testAdd(): void
    {
        $participant = $this->doctrineParticipantReadRepository->ofEmail(
            ParticipantEmail::fromString('hugues.gobet@gmail.com'),
        );

        $tasting = Tasting::create(
            TastingId::fromString('0d022ae1-7129-49c2-b0a4-ed8b8612715f'),
            BottleName::fromString('Château Margaux 2015'),
            $participant,
        );

        $this->doctrineTastingWriteRepository->add($tasting);

        $tasting = $this->doctrineTastingWriteRepository->ofId(
            TastingId::fromString('0d022ae1-7129-49c2-b0a4-ed8b8612715f'),
        );

        $this->assertNotNull($tasting);

        $this->assertEquals(
            'Château Margaux 2015',
            $tasting->bottleName()->value(),
        );
        $this->assertEquals(
            'hugues.gobet@gmail.com',
            $tasting->owner()->email()->value(),
        );

        $this->entityManager->remove($tasting);
        $this->entityManager->flush();
    }

    public function testNextIdentity(): void
    {
        $this->assertIsString(
            $this->doctrineTastingWriteRepository->nextIdentity()->value(),
        );
    }
}
