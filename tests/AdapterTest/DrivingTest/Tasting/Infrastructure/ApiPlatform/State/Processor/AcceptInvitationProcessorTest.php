<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Processor;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\Service\GetInvitationLink;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Doctrine\Repository\InvitationDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\ParticipantDoctrineRepository;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationAcceptedMessage;
use App\Tests\Shared\ApiTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class AcceptInvitationProcessorTest extends ApiTestCase
{
    use InteractsWithMessenger;

    private InvitationDoctrineRepository $invitationDoctrineRepository;
    private TastingRepositoryInterface $tastingDoctrineRepository;
    private ParticipantDoctrineRepository $participantDoctrineRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->invitationDoctrineRepository = $container->get(InvitationDoctrineRepository::class);
        $this->tastingDoctrineRepository = $container->get(TastingRepositoryInterface::class);
        $this->participantDoctrineRepository = $container->get(ParticipantDoctrineRepository::class);
    }

    public function testAcceptInvitation(): void
    {
        $invitation = $this->invitationDoctrineRepository->ofId(
            InvitationId::fromString('abed2f69-9aae-4d92-a91c-edfa7c985674'),
        );

        $invitation->send();
        $this->invitationDoctrineRepository->update();

        $this->post(
            '/api/tastings/2ea56c35-8bb9-4c6e-9a49-bd79c5f11537/invitations/abed2f69-9aae-4d92-a91c-edfa7c985674/accept'
        );

        $this->assertResponseStatusCodeSame(204);

        $this->transport('tasting')->queue()->assertContains(InvitationAcceptedMessage::class, 1);
        $this->transport('tasting')->process();
        $this->transport('tasting')->queue()->assertContains(InvitationAcceptedMessage::class, 0);

        $tasting = $this->tastingDoctrineRepository->ofId(
            TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
        );

        $tasting->participants()->remove(
            ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7'),
        );

        $this->tastingDoctrineRepository->update();

        $participantRoot = $this->participantDoctrineRepository
            ->ofId(
                ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            )
        ;

        $invitation = Invitation::create(
            InvitationId::fromString('abed2f69-9aae-4d92-a91c-edfa7c985674'),
            $tasting,
            $participantRoot,
            GetInvitationLink::getLink(),
        );

        $invitation::eraseRecordedEvents();

        $this->invitationDoctrineRepository->add($invitation);
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
