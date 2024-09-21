<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Repository\ParticipantRepositoryInterface;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\Service\GetInvitationLinkService;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Doctrine\Repository\InvitationDoctrineRepository;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationAcceptedMessage;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class RemoveInvitationMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;

    private InvitationDoctrineRepository $invitationDoctrineRepository;
    private TastingRepositoryInterface $tastingDoctrineRepository;
    private ParticipantRepositoryInterface $participantDoctrineRepository;
    private EntityManagerInterface $entityManager;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->invitationDoctrineRepository = $container->get(InvitationDoctrineRepository::class);
        $this->tastingDoctrineRepository = $container->get(TastingRepositoryInterface::class);
        $this->participantDoctrineRepository = $container->get(ParticipantRepositoryInterface::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);
    }

    public function testRemoveInvitation(): void
    {
        $owner = $this->participantDoctrineRepository->ofId(
            ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
        );

        $newParticipant = $this->participantDoctrineRepository->ofId(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
        );

        $this->participantDoctrineRepository->add($newParticipant);

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleName::fromString('Sassicaia 2012'),
            $owner,
        );

        $this->tastingDoctrineRepository->add($tasting);

        $invitation = Invitation::create(
            InvitationId::fromString('9ca4cb8c-74b5-4602-a06d-d5b1fb0c58cc'),
            $tasting,
            $owner,
            GetInvitationLinkService::getLink(),
        );

        $this->invitationDoctrineRepository->add($invitation);

        $invitation->send();
        $invitation->accept();

        $this->invitationDoctrineRepository->update();

        $this->bus('event.bus')->dispatch(new InvitationAcceptedMessage(
            '9ca4cb8c-74b5-4602-a06d-d5b1fb0c58cc',
        ));

        $this->transport('tasting')->queue()->assertContains(InvitationAcceptedMessage::class, 1);
        $this->transport('tasting')->process();
        $this->transport('tasting')->queue()->assertContains(InvitationAcceptedMessage::class, 0);

        $invitationFromToAssert = $this->invitationDoctrineRepository->ofId(
            InvitationId::fromString('9ca4cb8c-74b5-4602-a06d-d5b1fb0c58cc'),
        );

        $this->assertNull($invitationFromToAssert);

        $tastingToRemove = $this->tastingDoctrineRepository->ofId(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
        );

        $this->invitationDoctrineRepository->delete($invitation);
        $this->entityManager->remove($tastingToRemove);
        $this->entityManager->flush();
    }
}
