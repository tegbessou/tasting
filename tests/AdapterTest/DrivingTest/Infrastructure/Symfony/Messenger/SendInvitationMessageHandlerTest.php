<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\Symfony\Messenger;

use EmpireDesAmis\Tasting\Application\Service\NotificationInterface;
use EmpireDesAmis\Tasting\Domain\Entity\Tasting;
use EmpireDesAmis\Tasting\Domain\ValueObject\Bottle;
use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationId;
use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationTarget;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingId;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingOwnerId;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Repository\TastingDoctrineRepository;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationCreatedMessage;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
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
                '4eb449d9-7d23-4984-a68d-77aa19fccc60',
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
