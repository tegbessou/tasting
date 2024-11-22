<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\Service\InviteParticipant;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use App\Tasting\Infrastructure\Doctrine\Entity\Tasting as TastingDoctrine;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationAcceptedMessage;
use Doctrine\ODM\MongoDB\DocumentManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class RemoveInvitationMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;

    private TastingRepositoryInterface $tastingDoctrineRepository;
    private InviteParticipant $inviteParticipant;
    private EntityManagerInterface $entityManager;
    private DocumentManager $documentManager;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->tastingDoctrineRepository = $container->get(TastingRepositoryInterface::class);
        $this->inviteParticipant = $container->get(InviteParticipant::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);
        $this->documentManager = $container->get(DocumentManager::class);
    }

    public function testRemoveInvitation(): void
    {
        $owner = 'hugues.gobet@gmail.com';

        $participant = 'root@gmail.com';

        $tasting = Tasting::create(
            TastingId::fromString('9ca4cb8c-74b5-4602-a06d-d5b1fb0c58cc'),
            BottleName::fromString('Sassicaia 2012'),
            TastingOwnerId::fromString($owner),
        );

        $tasting::eraseRecordedEvents();

        $this->tastingDoctrineRepository->add($tasting);

        $this->inviteParticipant->inviteParticipants(
            $tasting,
            [
                $participant,
            ],
        );

        $this->tastingDoctrineRepository->update($tasting);

        $invitation = $tasting->invitations()->values()[0];

        $tasting->sendInvitation($invitation);

        $this->tastingDoctrineRepository->update($tasting);

        $tasting->acceptInvitation($invitation);

        $this->tastingDoctrineRepository->update($tasting);

        $this->bus('event.bus')->dispatch(new InvitationAcceptedMessage(
            '9ca4cb8c-74b5-4602-a06d-d5b1fb0c58cc',
            $invitation->id()->value(),
        ));

        $this->transport('tasting')->queue()->assertContains(InvitationAcceptedMessage::class, 1);
        $this->transport('tasting')->process();
        $this->transport('tasting')->queue()->assertContains(InvitationAcceptedMessage::class, 0);

        $tasting = $this->tastingDoctrineRepository->ofId(
            TastingId::fromString('9ca4cb8c-74b5-4602-a06d-d5b1fb0c58cc'),
        );

        $this->assertCount(0, $tasting->invitations()->values());

        $tastingToRemove = $this->entityManager->getRepository(TastingDoctrine::class)->find('9ca4cb8c-74b5-4602-a06d-d5b1fb0c58cc');
        $this->entityManager->remove($tastingToRemove);
        $this->entityManager->flush();
    }
}
