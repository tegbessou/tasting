<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Processor;

use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\Bottle;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationTarget;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationAcceptedMessage;
use Shared\ApiTestCase;
use Shared\RefreshDatabase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class AcceptInvitationProcessorTest extends ApiTestCase
{
    use InteractsWithMessenger;
    use RefreshDatabase;

    private TastingRepositoryInterface $tastingDoctrineRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->tastingDoctrineRepository = $container->get(TastingRepositoryInterface::class);
    }

    public function testAcceptInvitation(): void
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

        $this->tastingDoctrineRepository->add($tasting);

        $tasting->invite(
            InvitationId::fromString('aaa29ab4-e46f-4243-8b7c-20988f2fa25b'),
            InvitationTarget::fromString($participant),
        );

        $this->tastingDoctrineRepository->update($tasting);

        $invitation = $tasting->invitations()->values()[0];

        $tasting->sendInvitation($invitation);

        $this->tastingDoctrineRepository->update($tasting);

        $this->assertCount(1, $tasting->invitations()->values());
        $this->assertCount(1, $tasting->participants()->values());

        $this->post(
            sprintf(
                '/api/tastings/c7a497ed-d885-4401-930c-768dc1a85159/invitations/%s/accept',
                $invitation->id()->value(),
            ),
        );

        $this->assertResponseStatusCodeSame(204);

        $this->transport('tasting')->queue()->assertContains(InvitationAcceptedMessage::class, 1);
        $this->transport('tasting')->process();
        $this->transport('tasting')->queue()->assertContains(InvitationAcceptedMessage::class, 0);

        $tasting = $this->tastingDoctrineRepository->ofId(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
        );

        $this->assertCount(0, $tasting->invitations()->values());
        $this->assertCount(2, $tasting->participants()->values());
    }

    public function testAcceptInvitationTastingNotFound(): void
    {
        $this->post(
            '/api/tastings/1a3ff284-6c84-4dc6-bbd8-97d1110f2948/invitations/abed2f69-9aae-4d92-a91c-edfa7c985674/accept'
        );

        $this->assertResponseStatusCodeSame(404);

        $this->transport('tasting')->queue()->assertContains(InvitationAcceptedMessage::class, 0);
    }

    public function testAcceptInvitationInvitationNotFound(): void
    {
        $this->post(
            '/api/tastings/2ea56c35-8bb9-4c6e-9a49-bd79c5f11537/invitations/d03b11e1-161e-42b0-b547-b27c8d089bfa/accept'
        );

        $this->assertResponseStatusCodeSame(404);

        $this->transport('tasting')->queue()->assertContains(InvitationAcceptedMessage::class, 0);
    }
}
