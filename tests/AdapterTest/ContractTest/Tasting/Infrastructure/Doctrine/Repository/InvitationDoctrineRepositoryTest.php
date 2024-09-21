<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Service\GetInvitationLinkService;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Doctrine\Repository\InvitationDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\ParticipantDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\TastingDoctrineRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

final class InvitationDoctrineRepositoryTest extends WebTestCase
{
    private InvitationDoctrineRepository $doctrineInvitationRepository;
    private ParticipantDoctrineRepository $doctrineParticipantRepository;
    private TastingDoctrineRepository $doctrineTastingRepository;
    private EntityManagerInterface $entityManager;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->doctrineInvitationRepository = $container->get(InvitationDoctrineRepository::class);
        $this->doctrineParticipantRepository = $container->get(ParticipantDoctrineRepository::class);
        $this->doctrineTastingRepository = $container->get(TastingDoctrineRepository::class);
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
            $this->doctrineInvitationRepository->ofId(InvitationId::fromString('abed2f69-9aae-4d92-a91c-edfa7c985674')),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->doctrineInvitationRepository->ofId(InvitationId::fromString('4fd831f2-5717-43c1-88de-cdc93bb955c7')),
        );
    }

    public function testWithParticipant(): void
    {
        $invitations = $this->doctrineInvitationRepository->withParticipant(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
        )->getIterator();

        foreach ($invitations as $invitation) {
            $this->assertNotNull($invitation);
            $this->assertStringContainsString('c9350812-3f30-4fa4-8580-295ca65a4451', $invitation->target()->id()->value());
        }
    }

    public function testWithParticipantAndTasting(): void
    {
        $invitations = $this->doctrineInvitationRepository->withParticipantAndTasting(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
        )->getIterator();

        foreach ($invitations as $invitation) {
            $this->assertNotNull($invitation);
            $this->assertStringContainsString('c9350812-3f30-4fa4-8580-295ca65a4451', $invitation->target()->id()->value());
        }
    }

    public function testAdd(): void
    {
        $tasting = $this->doctrineTastingRepository->ofId(TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'));

        $participant = $this->doctrineParticipantRepository->ofId(ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'));

        $invitation = Invitation::create(
            InvitationId::fromString('66b52f43-8185-4923-b601-a48ea69dccf5'),
            $tasting,
            $participant,
            GetInvitationLinkService::getLink(),
        );

        $this->doctrineInvitationRepository->add($invitation);

        $invitation = $this->doctrineInvitationRepository->ofId(InvitationId::fromString('66b52f43-8185-4923-b601-a48ea69dccf5'));

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

        $invitation::eraseRecordedEvents();
    }

    public function testNextId(): void
    {
        $this->assertInstanceOf(
            InvitationId::class,
            $this->doctrineInvitationRepository->nextIdentity(),
        );
    }

    public function testUpdate(): void
    {
        $tasting = $this->doctrineTastingRepository->ofId(TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'));

        $participant = $this->doctrineParticipantRepository->ofId(ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'));

        $invitation = Invitation::create(
            InvitationId::fromString('66b52f43-8185-4923-b601-a48ea69dccf5'),
            $tasting,
            $participant,
            GetInvitationLinkService::getLink(),
        );

        $this->doctrineInvitationRepository->add($invitation);

        $this->assertNull($invitation->sentAt());

        $invitation->send();

        $this->doctrineInvitationRepository->update();

        $invitation = $this->doctrineInvitationRepository->ofId(InvitationId::fromString('66b52f43-8185-4923-b601-a48ea69dccf5'));

        $this->assertNotNull(
            $invitation->sentAt(),
        );

        $this->doctrineInvitationRepository->delete($invitation);
        $invitation::eraseRecordedEvents();
    }

    public function testDelete(): void
    {
        $tasting = $this->doctrineTastingRepository->ofId(TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'));

        $participant = $this->doctrineParticipantRepository->ofId(ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'));

        $invitation = Invitation::create(
            InvitationId::fromString('41fb800e-90dd-4b82-a1a0-982f4d9740a1'),
            $tasting,
            $participant,
            GetInvitationLinkService::getLink(),
        );

        $this->doctrineInvitationRepository->add($invitation);

        $this->doctrineInvitationRepository->delete($invitation);

        $invitationFromDatabase = $this->doctrineInvitationRepository->ofId(
            InvitationId::fromString('41fb800e-90dd-4b82-a1a0-982f4d9740a1'),
        );

        $this->assertNull($invitationFromDatabase);
    }
}
