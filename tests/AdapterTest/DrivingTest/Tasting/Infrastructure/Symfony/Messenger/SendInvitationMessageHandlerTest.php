<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Application\Service\NotificationInterface;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\ValueObject\Bottle;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationTarget;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use App\Tasting\Infrastructure\Doctrine\Repository\TastingDoctrineRepository;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationCreatedMessage;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class SendInvitationMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;
    use RefreshDatabase;

    private TastingDoctrineRepository $doctrineTastingRepository;
    private NotificationInterface $notificationService;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineTastingRepository = $container->get(TastingDoctrineRepository::class);
        $this->notificationService = $container->get(NotificationInterface::class);
    }

    public function testSendInvitation(): void
    {
        $owner = 'hugues.gobet@gmail.com';

        $participant = 'root@gmail.com';

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            Bottle::create(
                'Sassicaia 2012',
                'red',
            ),
            TastingOwnerId::fromString($owner),
        );

        $tasting::eraseRecordedEvents();

        $this->doctrineTastingRepository->add($tasting);

        $this->assertCount(0, $tasting->invitations()->values());

        $tasting->invite(
            InvitationId::fromString('aaa29ab4-e46f-4243-8b7c-20988f2fa25b'),
            InvitationTarget::fromString($participant),
        );

        $tasting::eraseRecordedEvents();

        $this->doctrineTastingRepository->update($tasting);

        $this->bus('event.bus')->dispatch(new InvitationCreatedMessage(
            'c7a497ed-d885-4401-930c-768dc1a85159',
            $tasting->invitations()->values()[0]->id()->value(),
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
        $this->assertEquals('Pedro vous invite à déguster une bouteille de vin Sassicaia 2012', $notifications[0]->body());

        $tasting = $this->doctrineTastingRepository->ofId(TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'));
        $this->assertNotNull($tasting->invitations()->values()[0]);
    }
}
