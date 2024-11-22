<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Adapter;

use App\Tasting\Application\Adapter\InvitationAdapterInterface;
use App\Tasting\Application\ReadModel\Invitation;
use App\Tasting\Domain\Service\GetInvitationLink;
use Doctrine\ODM\MongoDB\DocumentManager;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class InvitationDoctrineAdapterTest extends KernelTestCase
{
    private readonly InvitationAdapterInterface $invitationAdapter;

    private readonly DocumentManager $documentManager;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->invitationAdapter = $container->get(InvitationAdapterInterface::class);
        $this->documentManager = $container->get(DocumentManager::class);
    }

    public function testAdd(): void
    {
        $invitation = new Invitation(
            'b5880b05-073b-4224-95ed-21af2cf4e737',
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            'Domaine Leflaive Montrachet Grand Cru 2016',
            'hugues.gobet@gmail.com',
            'Pedro',
            'root@gmail.com',
            GetInvitationLink::getLink()->value(),
            new \DateTimeImmutable(),
            'Pedro',
        );

        $this->invitationAdapter->add($invitation);

        $invitation = $this->invitationAdapter->ofId('b5880b05-073b-4224-95ed-21af2cf4e737');
        $this->assertNotNull($invitation);

        $this->documentManager->remove($invitation);
        $this->documentManager->flush();
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->invitationAdapter->ofId('abed2f69-9aae-4d92-a91c-edfa7c985674'),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->invitationAdapter->ofId('324ad167-1805-4a61-b2d3-3832e7a4e286'),
        );
    }

    public function testWithTarget(): void
    {
        $invitations = $this->invitationAdapter->withTarget(
            'root@gmail.com',
        )->getIterator();

        foreach ($invitations as $invitation) {
            $this->assertNotNull($invitation);
            $this->assertStringContainsString('root@gmail.com', $invitation->targetId);
        }
    }

    public function testWithTargetAndSubject(): void
    {
        $invitations = $this->invitationAdapter->withTargetAndSubject(
            'root@gmail.com',
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
        )->getIterator();

        foreach ($invitations as $invitation) {
            $this->assertNotNull($invitation);
            $this->assertStringContainsString('root@gmail.com', $invitation->targetId);
        }
    }

    public function testDelete(): void
    {
        $invitation = new Invitation(
            'b5880b05-073b-4224-95ed-21af2cf4e737',
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            'Domaine Leflaive Montrachet Grand Cru 2016',
            'hugues.gobet@gmail.com',
            'Pedro',
            'root@gmail.com',
            GetInvitationLink::getLink()->value(),
            new \DateTimeImmutable(),
            'Pedro',
        );

        $this->invitationAdapter->add($invitation);

        $this->invitationAdapter->delete($invitation);

        $invitation = $this->invitationAdapter->ofId('b5880b05-073b-4224-95ed-21af2cf4e737');
        $this->assertNull($invitation);
    }
}
