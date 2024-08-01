<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Doctrine\Repository\InvitationReadDoctrineRepository;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

final class InvitationReadDoctrineRepositoryTest extends WebTestCase
{
    private InvitationReadDoctrineRepository $doctrineInvitationRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineInvitationRepository = $container->get(InvitationReadDoctrineRepository::class);
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->doctrineInvitationRepository->ofId(InvitationId::fromString('abed2f69-9aae-4d92-a91c-edfa7c985674')),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->doctrineInvitationRepository->ofId(InvitationId::fromString('4fd831f2-5717-43c1-88de-cdc93bb955c7')),
        );
    }

    public function testWithParticipant(): void
    {
        $invitations = $this->doctrineInvitationRepository->withParticipant(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
        )->getIterator();

        foreach ($invitations as $invitation) {
            $this->assertNotNull($invitation);
            $this->assertStringContainsString('c9350812-3f30-4fa4-8580-295ca65a4451', $invitation->target()->id()->value());
        }
    }

    public function testWithParticipantAndTasting(): void
    {
        $invitations = $this->doctrineInvitationRepository->withParticipantAndTasting(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
        )->getIterator();

        foreach ($invitations as $invitation) {
            $this->assertNotNull($invitation);
            $this->assertStringContainsString('c9350812-3f30-4fa4-8580-295ca65a4451', $invitation->target()->id()->value());
            $this->assertStringContainsString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537', $invitation->subject()->id()->value());
        }
    }
}
