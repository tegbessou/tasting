<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Mapper;

use App\Tasting\Domain\Entity\Eye;
use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Enum\Brillance;
use App\Tasting\Domain\Enum\IntensiteCouleur;
use App\Tasting\Domain\Enum\Larme;
use App\Tasting\Domain\Enum\Limpidite;
use App\Tasting\Domain\Enum\TastingInvitationStatus;
use App\Tasting\Domain\Enum\WineType;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\Service\GetInvitationLink;
use App\Tasting\Domain\ValueObject\Bottle;
use App\Tasting\Domain\ValueObject\EyeBrillance;
use App\Tasting\Domain\ValueObject\EyeId;
use App\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use App\Tasting\Domain\ValueObject\EyeLarme;
use App\Tasting\Domain\ValueObject\EyeLimpidite;
use App\Tasting\Domain\ValueObject\EyeObservation;
use App\Tasting\Domain\ValueObject\EyeParticipant;
use App\Tasting\Domain\ValueObject\EyeTeinte;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationTarget;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use App\Tasting\Infrastructure\Doctrine\Entity\Eye as EyeDoctrine;
use App\Tasting\Infrastructure\Doctrine\Entity\Invitation as InvitationDoctrine;
use App\Tasting\Infrastructure\Doctrine\Entity\Tasting as TastingDoctrine;
use App\Tasting\Infrastructure\Doctrine\Mapper\TastingMapper;
use Doctrine\Common\Collections\ArrayCollection;
use Shared\RefreshDatabase;
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

        $eyeDoctrine = new EyeDoctrine(
            '20eb3259-1697-4a39-bc34-238d7cf0b57b',
            $tastingDoctrine,
            'hugues.gobet@gmail.com',
            Limpidite::FLOUE,
            Brillance::BRILLANTE,
            IntensiteCouleur::CLAIRE,
            'pourpre',
            Larme::EPAISSE,
            'Observation',
        );

        $tastingDoctrine->addInvitation($invitationDoctrine);
        $tastingDoctrine->addEye($eyeDoctrine);

        $tasting = TastingMapper::toDomain($tastingDoctrine);

        $expected = Tasting::create(
            TastingId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            Bottle::create(
                'Chateaux Margaux 2015',
                'red',
            ),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $expected->invite(
            InvitationId::fromString('ea1341e5-f13b-4ee6-9597-383327c0fc57'),
            InvitationTarget::fromString('root@gmail.com'),
        );

        $expected->addEye(
            EyeId::fromString('20eb3259-1697-4a39-bc34-238d7cf0b57b'),
            EyeParticipant::fromString('hugues.gobet@gmail.com'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString('pourpre'),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation'),
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

        /** @var Eye $expectedEye */
        $expectedEye = $expected->eyes()->values()[0];

        /** @var Eye $eye */
        $eye = $tasting->eyes()->values()[0];

        $this->assertEquals(
            $expectedEye->id(),
            $eye->id(),
        );
        $this->assertEquals(
            $expectedEye->participant(),
            $eye->participant(),
        );
        $this->assertEquals(
            $expectedEye->limpidite(),
            $eye->limpidite(),
        );
        $this->assertEquals(
            $expectedEye->brillance(),
            $eye->brillance(),
        );
        $this->assertEquals(
            $expectedEye->intensiteCouleur(),
            $eye->intensiteCouleur(),
        );
        $this->assertEquals(
            $expectedEye->teinte(),
            $eye->teinte(),
        );
        $this->assertEquals(
            $expectedEye->larme(),
            $eye->larme(),
        );
        $this->assertEquals(
            $expectedEye->observation(),
            $eye->observation(),
        );
    }

    public function testToInfrastructurePersist(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            Bottle::create(
                'Chateaux Margaux 2015',
                'red',
            ),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $this->tastingRepository->add($tasting);

        $tasting::eraseRecordedEvents();

        $expected = new TastingDoctrine(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            'Chateaux Margaux 2015',
            WineType::RedWine,
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
            new ArrayCollection(),
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
        $this->assertEquals(
            $expected->eyes,
            $tasting->eyes,
        );
    }

    public function testToInfrastructureUpdateNewRelations(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            Bottle::create(
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

        $tasting->addEye(
            EyeId::fromString('20eb3259-1697-4a39-bc34-238d7cf0b57b'),
            EyeParticipant::fromString('hugues.gobet@gmail.com'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString('pourpre'),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation'),
        );

        $tasting::eraseRecordedEvents();

        $this->tastingRepository->update($tasting);

        $expected = new TastingDoctrine(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            'Chateaux Margaux 2015',
            WineType::RedWine,
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
            new ArrayCollection(),
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

        $expectedEye = new EyeDoctrine(
            '20eb3259-1697-4a39-bc34-238d7cf0b57b',
            $expected,
            'hugues.gobet@gmail.com',
            Limpidite::FLOUE,
            Brillance::BRILLANTE,
            IntensiteCouleur::CLAIRE,
            'pourpre',
            Larme::EPAISSE,
            'Observation',
        );

        $expected->addEye($expectedEye);

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

        /** @var EyeDoctrine $eye */
        $eye = $tastingDoctrine->eyes->first();

        $this->assertEquals(
            $expectedEye->id,
            $eye->id,
        );
        $this->assertEquals(
            $expectedEye->participant,
            $eye->participant,
        );
        $this->assertEquals(
            $expectedEye->limpidite,
            $eye->limpidite,
        );
        $this->assertEquals(
            $expectedEye->brillance,
            $eye->brillance,
        );
        $this->assertEquals(
            $expectedEye->intensiteCouleur,
            $eye->intensiteCouleur,
        );
        $this->assertEquals(
            $expectedEye->teinte,
            $eye->teinte,
        );
        $this->assertEquals(
            $expectedEye->larme,
            $eye->larme,
        );
        $this->assertEquals(
            $expectedEye->observation,
            $eye->observation,
        );
    }

    public function testToInfrastructureUpdateRelationsUpdated(): void
    {
        $tasting = Tasting::create(
            TastingId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            Bottle::create(
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
            'Chateaux Margaux 2015',
            WineType::RedWine,
            [
                'hugues.gobet@gmail.com',
            ],
            'hugues.gobet@gmail.com',
            new ArrayCollection(),
            new ArrayCollection(),
        );

        $expected = new TastingDoctrine(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
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
