<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\Symfony\Messenger;

use EmpireDesAmis\Tasting\Domain\Entity\Tasting;
use EmpireDesAmis\Tasting\Domain\ValueObject\Bottle;
use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationId;
use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationTarget;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetParticipant;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetTastingId;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingId;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingOwnerId;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Repository\SheetDoctrineRepository;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Repository\TastingDoctrineRepository;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\CreateSheetWhenInvitationIsAcceptedMessage;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class CreateSheetFromInvitationMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;
    use RefreshDatabase;

    private SheetDoctrineRepository $doctrineSheetRepository;
    private TastingDoctrineRepository $doctrineTastingRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineSheetRepository = $container->get(SheetDoctrineRepository::class);
        $this->doctrineTastingRepository = $container->get(TastingDoctrineRepository::class);
    }

    public function testCreateSheet(): void
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

        $tasting->sendInvitation($tasting->invitations()->values()[0]);

        $tasting::eraseRecordedEvents();

        $this->doctrineTastingRepository->update($tasting);

        $tasting->acceptInvitation($tasting->invitations()->values()[0]);

        $tasting::eraseRecordedEvents();

        $this->doctrineTastingRepository->update($tasting);

        $this->bus('event.bus')->dispatch(new CreateSheetWhenInvitationIsAcceptedMessage(
            'c7a497ed-d885-4401-930c-768dc1a85159',
            'root@gmail.com',
        ));

        $this->transport('tasting')->queue()->assertContains(CreateSheetWhenInvitationIsAcceptedMessage::class, 1);
        $this->transport('tasting')->process(1);
        $this->transport('tasting')->queue()->assertContains(CreateSheetWhenInvitationIsAcceptedMessage::class, 0);

        $this->assertCount(1, $this->doctrineSheetRepository->withTastingAndParticipant(
            SheetTastingId::fromString($tasting->id()->value()),
            SheetParticipant::fromString($participant),
        ));
    }
}
