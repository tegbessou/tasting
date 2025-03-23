<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\ContractTest\Infrastructure\Doctrine\Mapper;

use Doctrine\Common\Collections\ArrayCollection;
use EmpireDesAmis\Tasting\Domain\Entity\Invitation;
use EmpireDesAmis\Tasting\Domain\Entity\Tasting;
use EmpireDesAmis\Tasting\Domain\Enum\TastingInvitationStatus;
use EmpireDesAmis\Tasting\Domain\Enum\WineType;
use EmpireDesAmis\Tasting\Domain\Repository\TastingRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\Service\GetInvitationLink;
use EmpireDesAmis\Tasting\Domain\ValueObject\Bottle;
use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationId;
use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationTarget;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingId;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingOwnerId;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Invitation as InvitationDoctrine;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity\Tasting as TastingDoctrine;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Mapper\TastingMapper;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class TastingMapperTest extends KernelTestCase
{
    use RefreshDatabase;

    private TastingRepositoryInterface $tastingRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->tastingRepository = $container->get(TastingRepositoryInterface::class);
    }

    public function testToDomain(): void
    {
        $tastingDoctrine = new TastingDoctrine(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'Chateaux Margaux 2015',
            WineType::RedWine,
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
            new ArrayCollection(),
        );

        $invitationDoctrine = new InvitationDoctrine(
            'ea1341e5-f13b-4ee6-9597-383327c0fc57',
            $tastingDoctrine,
            'root@gmail.com',
            GetInvitationLink::getLink()->value(),
            TastingInvitationStatus::PENDING,
            new \DateTimeImmutable(),
        );

        $tastingDoctrine->addInvitation($invitationDoctrine);

        $tasting = TastingMapper::toDomain($tastingDoctrine);

        $expected = Tasting::create(
            TastingId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            Bottle::create(
                '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
                'Chateaux Margaux 2015',
                'red',
            ),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $expected->invite(
            InvitationId::fromString('ea1341e5-f13b-4ee6-9597-383327c0fc57'),
            InvitationTarget::fromString('root@gmail.com'),
        );

        $expected::eraseRecordedEvents();

        $this->assertEquals(
            $expected->id(),
            $tasting->id(),
        );
        $this->assertEquals(
            $expected->bottle(),
            $tasting->bottle(),
        );
        $this->assertEquals(
            $expected->participants()->values(),
            $tasting->participants()->values(),
        );
        $this->assertEquals(
            $expected->ownerId(),
            $tasting->ownerId(),
        );

        /** @var Invitation $expectedInvitation */
        $expectedInvitation = $expected->invitations()->values()[0];

        /** @var Invitation $invitation */
        $invitation = $tasting->invitations()->values()[0];

        $this->assertEquals(
            $expectedInvitation->id(),
            $invitation->id(),
        );
        $this->assertEquals(
            $expectedInvitation->target(),
            $invitation->target(),
        );
        $this->assertEquals(
            $expectedInvitation->status(),
            $invitation->status(),
        );
    }

    public function testToInfrastructurePersist(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            Bottle::create(
                '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
                'Chateaux Margaux 2015',
                'red',
            ),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $this->tastingRepository->add($tasting);

        $tasting::eraseRecordedEvents();

        $expected = new TastingDoctrine(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'Chateaux Margaux 2015',
            WineType::RedWine,
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
            new ArrayCollection(),
        );

        $tasting = TastingMapper::toInfrastructurePersist($tasting);

        $this->assertEquals(
            $expected->id,
            $tasting->id,
        );
        $this->assertEquals(
            $expected->bottleName,
            $tasting->bottleName,
        );
        $this->assertEquals(
            $expected->participants,
            $tasting->participants,
        );
        $this->assertEquals(
            $expected->ownerId,
            $tasting->ownerId,
        );
        $this->assertEquals(
            $expected->invitations,
            $tasting->invitations,
        );
    }

    public function testToInfrastructureUpdateNewRelations(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            Bottle::create(
                '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
                'Chateaux Margaux 2015',
                'red',
            ),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $this->tastingRepository->add($tasting);

        $tasting->invite(
            InvitationId::fromString('ea1341e5-f13b-4ee6-9597-383327c0fc57'),
            InvitationTarget::fromString('root@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $this->tastingRepository->update($tasting);

        $expected = new TastingDoctrine(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'Chateaux Margaux 2015',
            WineType::RedWine,
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
            new ArrayCollection(),
        );

        $tastingDoctrine = TastingMapper::toInfrastructureUpdate($tasting, $expected);

        $expectedInvitation = new InvitationDoctrine(
            'ea1341e5-f13b-4ee6-9597-383327c0fc57',
            $expected,
            'root@gmail.com',
            GetInvitationLink::getLink()->value(),
            TastingInvitationStatus::PENDING,
            new \DateTimeImmutable(),
        );

        $expected->addInvitation($expectedInvitation);

        $this->assertEquals(
            $expected->id,
            $tastingDoctrine->id,
        );
        $this->assertEquals(
            $expected->bottleName,
            $tastingDoctrine->bottleName,
        );
        $this->assertEquals(
            $expected->participants,
            $tastingDoctrine->participants,
        );
        $this->assertEquals(
            $expected->ownerId,
            $tastingDoctrine->ownerId,
        );

        /** @var InvitationDoctrine $invitation */
        $invitation = $tastingDoctrine->invitations->first();

        $this->assertEquals(
            $expectedInvitation->id,
            $invitation->id,
        );
        $this->assertEquals(
            $expectedInvitation->targetId,
            $invitation->targetId,
        );
        $this->assertNotNull(
            $invitation->subject,
        );
        $this->assertEquals(
            $expectedInvitation->status,
            $invitation->status,
        );
        $this->assertEquals(
            $expectedInvitation->sentAt,
            $invitation->sentAt,
        );
    }

    public function testToInfrastructureUpdateRelationsUpdated(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            Bottle::create(
                '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
                'Chateaux Margaux 2015',
                'red',
            ),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $this->tastingRepository->add($tasting);

        $tasting->invite(
            InvitationId::fromString('ea1341e5-f13b-4ee6-9597-383327c0fc57'),
            InvitationTarget::fromString('root@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $this->tastingRepository->update($tasting);

        $tasting->sendInvitation($tasting->invitations()->values()[0]);

        $this->tastingRepository->update($tasting);

        $oldTasting = new TastingDoctrine(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'Chateaux Margaux 2015',
            WineType::RedWine,
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
            new ArrayCollection(),
        );

        $expected = new TastingDoctrine(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'Chateaux Margaux 2015',
            WineType::RedWine,
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
            new ArrayCollection(),
            new ArrayCollection(),
        );

        $tastingDoctrine = TastingMapper::toInfrastructureUpdate($tasting, $oldTasting);

        $expectedInvitation = new InvitationDoctrine(
            'ea1341e5-f13b-4ee6-9597-383327c0fc57',
            $expected,
            'root@gmail.com',
            GetInvitationLink::getLink()->value(),
            TastingInvitationStatus::PENDING,
            new \DateTimeImmutable(),
            new \DateTimeImmutable(),
        );

        $expected->addInvitation($expectedInvitation);

        $this->assertEquals(
            $expected->id,
            $tastingDoctrine->id,
        );
        $this->assertEquals(
            $expected->bottleName,
            $tastingDoctrine->bottleName,
        );
        $this->assertEquals(
            $expected->participants,
            $tastingDoctrine->participants,
        );
        $this->assertEquals(
            $expected->ownerId,
            $tastingDoctrine->ownerId,
        );

        /** @var InvitationDoctrine $invitation */
        $invitation = $tastingDoctrine->invitations->first();

        $this->assertEquals(
            $expectedInvitation->id,
            $invitation->id,
        );
        $this->assertEquals(
            $expectedInvitation->targetId,
            $invitation->targetId,
        );
        $this->assertNotNull(
            $invitation->subject,
        );
        $this->assertEquals(
            $expectedInvitation->status,
            $invitation->status,
        );
        $this->assertNotNull(
            $invitation->sentAt,
        );
    }

    public function testToInfrastructureUpdateInvitationRemoved(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            Bottle::create(
                '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
                'Chateaux Margaux 2015',
                'red',
            ),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $this->tastingRepository->add($tasting);

        $tasting::eraseRecordedEvents();

        $tasting->invite(
            InvitationId::fromString('ea1341e5-f13b-4ee6-9597-383327c0fc57'),
            InvitationTarget::fromString('root@gmail.com'),
        );

        $this->tastingRepository->update($tasting);

        $tasting->sendInvitation($tasting->invitations()->values()[0]);

        $this->tastingRepository->update($tasting);

        $tasting->rejectInvitation($tasting->invitations()->values()[0]);

        $this->tastingRepository->update($tasting);

        $tasting->deleteInvitation($tasting->invitations()->values()[0]);

        $this->tastingRepository->update($tasting);

        $oldTasting = new TastingDoctrine(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'Chateaux Margaux 2015',
            WineType::RedWine,
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
            new ArrayCollection(),
        );

        $expected = new TastingDoctrine(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'Chateaux Margaux 2015',
            WineType::RedWine,
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
            new ArrayCollection(),
        );

        $tastingDoctrine = TastingMapper::toInfrastructureUpdate($tasting, $oldTasting);

        $this->assertEquals(
            $expected->id,
            $tastingDoctrine->id,
        );
        $this->assertEquals(
            $expected->bottleName,
            $tastingDoctrine->bottleName,
        );
        $this->assertEquals(
            $expected->participants,
            $tastingDoctrine->participants,
        );
        $this->assertEquals(
            $expected->ownerId,
            $tastingDoctrine->ownerId,
        );
        $this->assertCount(0, $tastingDoctrine->invitations);
    }
}
