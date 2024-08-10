<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Processor;

use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Infrastructure\Doctrine\Repository\InvitationWriteDoctrineRepository;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationAcceptedMessage;
use App\Tests\Shared\ApiTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class AcceptInvitationProcessorTest extends ApiTestCase
{
    use InteractsWithMessenger;

    private InvitationWriteDoctrineRepository $invitationWriteDoctrineRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->invitationWriteDoctrineRepository = $container->get(InvitationWriteDoctrineRepository::class);
    }

    public function testAcceptInvitation(): void
    {
        $invitation = $this->invitationWriteDoctrineRepository->ofId(
            InvitationId::fromString('abed2f69-9aae-4d92-a91c-edfa7c985674'),
        );

        $invitation->send();
        $this->invitationWriteDoctrineRepository->update();

        $this->post('/api/invitations/abed2f69-9aae-4d92-a91c-edfa7c985674/accept');

        $this->assertResponseStatusCodeSame(204);

        $this->transport('tasting')->queue()->assertContains(InvitationAcceptedMessage::class, 1);

        // remettre en état initial
    }
}
