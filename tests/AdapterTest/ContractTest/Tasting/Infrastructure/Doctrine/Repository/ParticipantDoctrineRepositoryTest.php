<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Repository\ParticipantRepositoryInterface;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantFullName;
use App\Tasting\Domain\ValueObject\ParticipantId;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class ParticipantDoctrineRepositoryTest extends KernelTestCase
{
    private ParticipantRepositoryInterface $doctrineParticipantRepository;
    private EntityManagerInterface $entityManager;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->doctrineParticipantRepository = $container->get(ParticipantRepositoryInterface::class);
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
            $this->doctrineParticipantRepository->ofId(ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7')),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->doctrineParticipantRepository->ofId(ParticipantId::fromString('4fd831f2-5717-43c1-88de-cdc93bb955c7')),
        );
    }

    public function testOfEmail(): void
    {
        $this->assertNotNull(
            $this->doctrineParticipantRepository->ofEmail(ParticipantEmail::fromString('hugues.gobet@gmail.com')
            ));
    }

    public function testOfEmailNull(): void
    {
        $this->assertNull(
            $this->doctrineParticipantRepository->ofEmail(ParticipantEmail::fromString('pedro@gmail.com')
            ));
    }

    public function testExist(): void
    {
        $this->assertTrue($this->doctrineParticipantRepository->exist(ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7')));
    }

    public function testAdd(): void
    {
        $participant = Participant::create(
            ParticipantId::fromString('3d32e20c-0a28-4764-b513-3453b4b71651'),
            ParticipantEmail::fromString('new@gmail.com'),
            ParticipantFullName::fromString('New One'),
        );

        $this->doctrineParticipantRepository->add($participant);

        $participant::eraseRecordedEvents();

        $newParticipant = $this->doctrineParticipantRepository->ofId(ParticipantId::fromString('3d32e20c-0a28-4764-b513-3453b4b71651'));

        $this->assertNotNull(
            $newParticipant,
        );

        $this->assertEquals(
            'new@gmail.com',
            $newParticipant->email()->value(),
        );
        $this->assertEquals(
            'New One',
            $newParticipant->fullName()->value(),
        );

        $container = static::getContainer();
        $entityManager = $container->get(EntityManagerInterface::class);
        $entityManager->remove($newParticipant);
        $entityManager->flush();
    }

    public function testNextIdentity(): void
    {
        $participantId = $this->doctrineParticipantRepository->nextIdentity();

        $this->assertIsString(
            $participantId->value(),
        );
    }
}
