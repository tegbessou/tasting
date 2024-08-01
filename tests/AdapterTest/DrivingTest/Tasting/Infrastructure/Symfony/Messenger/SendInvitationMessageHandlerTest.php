<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Application\Service\NotificationServiceInterface;
use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Repository\InvitationReadRepositoryInterface;
use App\Tasting\Domain\Service\GetInvitationLinkService;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Doctrine\Repository\InvitationWriteDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\ParticipantReadDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\TastingReadDoctrineRepository;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationCreatedMessage;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class SendInvitationMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;

    private InvitationWriteDoctrineRepository $doctrineInvitationWriteRepository;
    private ParticipantReadDoctrineRepository $doctrineParticipantReadRepository;
    private TastingReadDoctrineRepository $doctrineTastingReadRepository;
    private InvitationReadRepositoryInterface $doctrineInvitationReadRepository;
    private EntityManagerInterface $entityManager;
    private NotificationServiceInterface $notificationService;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineInvitationWriteRepository = $container->get(InvitationWriteDoctrineRepository::class);
        $this->doctrineParticipantReadRepository = $container->get(ParticipantReadDoctrineRepository::class);
        $this->doctrineTastingReadRepository = $container->get(TastingReadDoctrineRepository::class);
        $this->doctrineInvitationReadRepository = $container->get(InvitationReadRepositoryInterface::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);
        $this->notificationService = $container->get(NotificationServiceInterface::class);
    }

    public function testSendInvitation(): void
    {
        $tasting = $this->doctrineTastingReadRepository->ofId(TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'));

        $participant = $this->doctrineParticipantReadRepository->ofId(ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'));

        $invitation = Invitation::create(
            InvitationId::fromString('66b52f43-8185-4923-b601-a48ea69dccf5'),
            $tasting,
            $participant,
            GetInvitationLinkService::getLink(),
        );

        $invitation::eraseRecordedEvents();

        $this->doctrineInvitationWriteRepository->add($invitation);

        $this->bus('event.bus')->dispatch(new InvitationCreatedMessage(
            '66b52f43-8185-4923-b601-a48ea69dccf5',
            'root@gmail.com',
            'hugues.gobet@gmail.com',
            '5ec0917b-179f-46e4-87d6-db76fbddf45f',
        ));

        $this->transport('tasting')->queue()->assertContains(InvitationCreatedMessage::class, 1);
        $this->transport('tasting')->process(1);
        $this->transport('tasting')->queue()->assertContains(InvitationCreatedMessage::class, 0);

        $this->assertEmailCount(1);
        $email = $this->getMailerMessage();
        $this->assertEmailHtmlBodyContains($email, 'Invitation à déguster une bouteille de vin');

        $notifications = $this->notificationService::getSent();
        $this->assertCount(1, $notifications);
        $this->assertEquals('Invitation à déguster une bouteille de vin', $notifications[0]->title());
        $this->assertEquals('Hugues Gobet vous invite à déguster une bouteille de vin Domaine Leflaive Montrachet Grand Cru', $notifications[0]->body());

        $invitation = $this->doctrineInvitationReadRepository->ofId(InvitationId::fromString('66b52f43-8185-4923-b601-a48ea69dccf5'));
        $this->assertNotNull($invitation->sentAt());

        $this->entityManager->remove($invitation);
        $this->entityManager->flush();
    }
}
