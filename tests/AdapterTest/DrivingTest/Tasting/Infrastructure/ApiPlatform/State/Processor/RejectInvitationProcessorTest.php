<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Processor;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Service\GetInvitationLinkService;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Doctrine\Repository\InvitationWriteDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\ParticipantReadDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\TastingWriteDoctrineRepository;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationRejectedMessage;
use App\Tests\Shared\ApiTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class RejectInvitationProcessorTest extends ApiTestCase
{
    use InteractsWithMessenger;

    private InvitationWriteDoctrineRepository $invitationWriteDoctrineRepository;
    private TastingWriteDoctrineRepository $tastingWriteDoctrineRepository;
    private ParticipantReadDoctrineRepository $participantReadDoctrineRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->invitationWriteDoctrineRepository = $container->get(InvitationWriteDoctrineRepository::class);
        $this->tastingWriteDoctrineRepository = $container->get(TastingWriteDoctrineRepository::class);
        $this->participantReadDoctrineRepository = $container->get(ParticipantReadDoctrineRepository::class);
    }

    public function testRejectInvitation(): void
    {
        $invitation = $this->invitationWriteDoctrineRepository->ofId(
            InvitationId::fromString('abed2f69-9aae-4d92-a91c-edfa7c985674'),
        );

        $invitation->send();
        $this->invitationWriteDoctrineRepository->update();

        $this->post(
            '/api/tastings/2ea56c35-8bb9-4c6e-9a49-bd79c5f11537/invitations/abed2f69-9aae-4d92-a91c-edfa7c985674/reject'
        );

        $this->assertResponseStatusCodeSame(204);

        $this->transport('tasting')->queue()->assertContains(InvitationRejectedMessage::class, 1);
        $this->transport('tasting')->process();
        $this->transport('tasting')->queue()->assertContains(InvitationRejectedMessage::class, 0);

        $tasting = $this->tastingWriteDoctrineRepository->ofId(
            TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
        );

        $participantRoot = $this->participantReadDoctrineRepository
            ->ofId(
                ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            )
        ;

        $invitation = Invitation::create(
            InvitationId::fromString('abed2f69-9aae-4d92-a91c-edfa7c985674'),
            $tasting,
            $participantRoot,
            GetInvitationLinkService::getLink(),
        );

        $invitation::eraseRecordedEvents();

        $this->invitationWriteDoctrineRepository->add($invitation);
    }

    public function testRejectInvitationTastingNotFound(): void
    {
        $this->post(
            '/api/tastings/1a3ff284-6c84-4dc6-bbd8-97d1110f2948/invitations/abed2f69-9aae-4d92-a91c-edfa7c985674/reject'
        );

        $this->assertResponseStatusCodeSame(404);

        $this->transport('tasting')->queue()->assertContains(InvitationRejectedMessage::class, 0);
    }

    public function testRejectInvitationInvitationNotFound(): void
    {
        $this->post(
            '/api/tastings/2ea56c35-8bb9-4c6e-9a49-bd79c5f11537/invitations/d03b11e1-161e-42b0-b547-b27c8d089bfa/reject'
        );

        $this->assertResponseStatusCodeSame(404);

        $this->transport('tasting')->queue()->assertContains(InvitationRejectedMessage::class, 0);
    }
}
