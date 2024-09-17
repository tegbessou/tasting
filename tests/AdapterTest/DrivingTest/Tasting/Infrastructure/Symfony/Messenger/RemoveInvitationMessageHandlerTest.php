<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Service\GetInvitationLinkService;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Doctrine\Repository\InvitationWriteDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\ParticipantWriteDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\TastingWriteDoctrineRepository;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationAcceptedMessage;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class RemoveInvitationMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;

    private InvitationWriteDoctrineRepository $invitationWriteDoctrineRepository;
    private TastingWriteDoctrineRepository $tastingWriteDoctrineRepository;
    private ParticipantWriteDoctrineRepository $participantWriteDoctrineRepository;
    private EntityManagerInterface $entityManager;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->invitationWriteDoctrineRepository = $container->get(InvitationWriteDoctrineRepository::class);
        $this->tastingWriteDoctrineRepository = $container->get(TastingWriteDoctrineRepository::class);
        $this->participantWriteDoctrineRepository = $container->get(ParticipantWriteDoctrineRepository::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);
    }

    public function testRemoveInvitation(): void
    {
        $owner = $this->participantWriteDoctrineRepository->ofId(
            ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
        );

        $newParticipant = $this->participantWriteDoctrineRepository->ofId(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
        );

        $this->participantWriteDoctrineRepository->add($newParticipant);

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleName::fromString('Sassicaia 2012'),
            $owner,
        );

        $this->tastingWriteDoctrineRepository->add($tasting);

        $invitation = Invitation::create(
            InvitationId::fromString('9ca4cb8c-74b5-4602-a06d-d5b1fb0c58cc'),
            $tasting,
            $owner,
            GetInvitationLinkService::getLink(),
        );

        $this->invitationWriteDoctrineRepository->add($invitation);

        $invitation->send();
        $invitation->accept();

        $this->invitationWriteDoctrineRepository->update();

        $this->bus('event.bus')->dispatch(new InvitationAcceptedMessage(
            '9ca4cb8c-74b5-4602-a06d-d5b1fb0c58cc',
        ));

        $this->transport('tasting')->queue()->assertContains(InvitationAcceptedMessage::class, 1);
        $this->transport('tasting')->process();
        $this->transport('tasting')->queue()->assertContains(InvitationAcceptedMessage::class, 0);

        $invitationFromToAssert = $this->invitationWriteDoctrineRepository->ofId(
            InvitationId::fromString('9ca4cb8c-74b5-4602-a06d-d5b1fb0c58cc'),
        );

        $this->assertNull($invitationFromToAssert);

        $tastingToRemove = $this->tastingWriteDoctrineRepository->ofId(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
        );

        $this->invitationWriteDoctrineRepository->delete($invitation);
        $this->entityManager->remove($tastingToRemove);
        $this->entityManager->flush();
    }
}
