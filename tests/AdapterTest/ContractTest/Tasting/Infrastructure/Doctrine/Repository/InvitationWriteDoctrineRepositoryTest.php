<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Service\GetInvitationLinkService;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Doctrine\Repository\InvitationWriteDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\ParticipantReadDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\TastingReadDoctrineRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class InvitationWriteDoctrineRepositoryTest extends KernelTestCase
{
    private InvitationWriteDoctrineRepository $doctrineInvitationWriteRepository;
    private ParticipantReadDoctrineRepository $doctrineParticipantWriteRepository;
    private TastingReadDoctrineRepository $doctrineTastingWriteRepository;
    private EntityManagerInterface $entityManager;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->doctrineInvitationWriteRepository = $container->get(InvitationWriteDoctrineRepository::class);
        $this->doctrineParticipantWriteRepository = $container->get(ParticipantReadDoctrineRepository::class);
        $this->doctrineTastingWriteRepository = $container->get(TastingReadDoctrineRepository::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);

        $this->entityManager->getConnection()->setNestTransactionsWithSavepoints(true);
        $this->entityManager->beginTransaction();
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
            $this->doctrineInvitationWriteRepository->ofId(InvitationId::fromString('abed2f69-9aae-4d92-a91c-edfa7c985674')),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->doctrineInvitationWriteRepository->ofId(InvitationId::fromString('4fd831f2-5717-43c1-88de-cdc93bb955c7')),
        );
    }

    public function testAdd(): void
    {
        $tasting = $this->doctrineTastingWriteRepository->ofId(TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'));

        $participant = $this->doctrineParticipantWriteRepository->ofId(ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'));

        $invitation = Invitation::create(
            InvitationId::fromString('66b52f43-8185-4923-b601-a48ea69dccf5'),
            $tasting,
            $participant,
            GetInvitationLinkService::getLink(),
        );

        $this->doctrineInvitationWriteRepository->add($invitation);

        $invitation = $this->doctrineInvitationWriteRepository->ofId(InvitationId::fromString('66b52f43-8185-4923-b601-a48ea69dccf5'));

        $this->assertNotNull(
            $invitation,
        );
        $this->assertEquals(
            TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            $tasting->id(),
        );
        $this->assertEquals(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            $participant->id(),
        );
    }

    public function testNextId(): void
    {
        $this->assertInstanceOf(
            InvitationId::class,
            $this->doctrineInvitationWriteRepository->nextIdentity(),
        );
    }
}
