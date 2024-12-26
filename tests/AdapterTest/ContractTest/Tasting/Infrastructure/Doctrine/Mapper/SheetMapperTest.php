<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Mapper;

use App\Tasting\Domain\Entity\Sheet;
use App\Tasting\Domain\Enum\Brillance;
use App\Tasting\Domain\Enum\IntensiteCouleur;
use App\Tasting\Domain\Enum\Larme;
use App\Tasting\Domain\Enum\Limpidite;
use App\Tasting\Domain\Enum\RedTeinte;
use App\Tasting\Domain\Enum\WineType;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\EyeBrillance;
use App\Tasting\Domain\ValueObject\EyeId;
use App\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use App\Tasting\Domain\ValueObject\EyeLarme;
use App\Tasting\Domain\ValueObject\EyeLimpidite;
use App\Tasting\Domain\ValueObject\EyeObservation;
use App\Tasting\Domain\ValueObject\EyeTeinte;
use App\Tasting\Domain\ValueObject\SheetId;
use App\Tasting\Domain\ValueObject\SheetParticipant;
use App\Tasting\Domain\ValueObject\SheetTastingId;
use App\Tasting\Infrastructure\Doctrine\Entity\Eye as EyeDoctrine;
use App\Tasting\Infrastructure\Doctrine\Entity\Sheet as SheetDoctrine;
use App\Tasting\Infrastructure\Doctrine\Mapper\SheetMapper;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class SheetMapperTest extends KernelTestCase
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
        $sheetDoctrine = new SheetDoctrine(
            'c3827445-9578-43ef-b437-234feba48ec8',
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            'root@gmail.com',
        );

        $eye = new EyeDoctrine(
            'aaa29ab4-e46f-4243-8b7c-20988f2fa25b',
            $sheetDoctrine,
            Limpidite::FLOUE,
            Brillance::BRILLANTE,
            IntensiteCouleur::CLAIRE,
            RedTeinte::AMBRE->value,
            Larme::EPAISSE,
            'Observation',
        );

        $sheetDoctrine->eye = $eye;

        $sheet = SheetMapper::toDomain($sheetDoctrine);

        $expectedSheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('root@gmail.com'),
        );

        $expectedSheet->addEye(
            EyeId::fromString('aaa29ab4-e46f-4243-8b7c-20988f2fa25b'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString(RedTeinte::AMBRE->value),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation'),
            WineType::RedWine,
        );

        $this->assertEquals(
            $expectedSheet->id(),
            $sheet->id(),
        );
        $this->assertEquals(
            $expectedSheet->tastingId(),
            $sheet->tastingId(),
        );
        $this->assertEquals(
            $expectedSheet->participant(),
            $sheet->participant(),
        );
        $this->assertEquals(
            $expectedSheet->eye()->id(),
            $sheet->eye()->id(),
        );
        $this->assertEquals(
            $expectedSheet->eye()->limpidite(),
            $sheet->eye()->limpidite(),
        );
        $this->assertEquals(
            $expectedSheet->eye()->brillance(),
            $sheet->eye()->brillance(),
        );
        $this->assertEquals(
            $expectedSheet->eye()->intensiteCouleur(),
            $sheet->eye()->intensiteCouleur(),
        );
        $this->assertEquals(
            $expectedSheet->eye()->teinte(),
            $sheet->eye()->teinte(),
        );
        $this->assertEquals(
            $expectedSheet->eye()->larme(),
            $sheet->eye()->larme(),
        );
        $this->assertEquals(
            $expectedSheet->eye()->observation(),
            $sheet->eye()->observation(),
        );
    }

    /*public function testToInfrastructurePersist(): void
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
    }*/

    // public function testToInfrastructureUpdateNewRelations(): void
    // {
    //    $tasting = Tasting::create(
    //        TastingId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
    //        Bottle::create(
    //            'Chateaux Margaux 2015',
    //            'red',
    //        ),
    //        TastingOwnerId::fromString('hugues.gobet@gmail.com'),
    //    );
    //
    //    $this->tastingRepository->add($tasting);
    //
    //    $tasting->invite(
    //        InvitationId::fromString('ea1341e5-f13b-4ee6-9597-383327c0fc57'),
    //        InvitationTarget::fromString('root@gmail.com'),
    //    );
    //
    //    $tasting->addEye(
    //        EyeId::fromString('20eb3259-1697-4a39-bc34-238d7cf0b57b'),
    //        EyeParticipant::fromString('hugues.gobet@gmail.com'),
    //        EyeLimpidite::fromString(Limpidite::FLOUE->value),
    //        EyeBrillance::fromString(Brillance::BRILLANTE->value),
    //        EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
    //        EyeTeinte::fromString('pourpre'),
    //        EyeLarme::fromString(Larme::EPAISSE->value),
    //        EyeObservation::fromString('Observation'),
    //    );
    //
    //    $tasting::eraseRecordedEvents();
    //
    //    $this->tastingRepository->update($tasting);
    //
    //    $expected = new TastingDoctrine(
    //        'b9857453-1891-4fe8-80a9-1b873f15f0ec',
    //        'Chateaux Margaux 2015',
    //        WineType::RedWine,
    //        [
    //            'hugues.gobet@gmail.com',
    //        ],
    //        'hugues.gobet@gmail.com',
    //        new ArrayCollection(),
    //        new ArrayCollection(),
    //    );
    //
    //    $tastingDoctrine = TastingMapper::toInfrastructureUpdate($tasting, $expected);
    //
    //    $expectedInvitation = new InvitationDoctrine(
    //        'ea1341e5-f13b-4ee6-9597-383327c0fc57',
    //        $expected,
    //        'root@gmail.com',
    //        GetInvitationLink::getLink()->value(),
    //        TastingInvitationStatus::PENDING,
    //        new \DateTimeImmutable(),
    //    );
    //
    //    $expected->addInvitation($expectedInvitation);
    //
    //    $expectedEye = new EyeDoctrine(
    //        '20eb3259-1697-4a39-bc34-238d7cf0b57b',
    //        $expected,
    //        'hugues.gobet@gmail.com',
    //        Limpidite::FLOUE,
    //        Brillance::BRILLANTE,
    //        IntensiteCouleur::CLAIRE,
    //        'pourpre',
    //        Larme::EPAISSE,
    //        'Observation',
    //    );
    //
    //    $expected->addEye($expectedEye);
    //
    //    $this->assertEquals(
    //        $expected->id,
    //        $tastingDoctrine->id,
    //    );
    //    $this->assertEquals(
    //        $expected->bottleName,
    //        $tastingDoctrine->bottleName,
    //    );
    //    $this->assertEquals(
    //        $expected->participants,
    //        $tastingDoctrine->participants,
    //    );
    //    $this->assertEquals(
    //        $expected->ownerId,
    //        $tastingDoctrine->ownerId,
    //    );
    //
    //    /** @var InvitationDoctrine $invitation */
    //    $invitation = $tastingDoctrine->invitations->first();
    //
    //    $this->assertEquals(
    //        $expectedInvitation->id,
    //        $invitation->id,
    //    );
    //    $this->assertEquals(
    //        $expectedInvitation->targetId,
    //        $invitation->targetId,
    //    );
    //    $this->assertNotNull(
    //        $invitation->subject,
    //    );
    //    $this->assertEquals(
    //        $expectedInvitation->status,
    //        $invitation->status,
    //    );
    //    $this->assertEquals(
    //        $expectedInvitation->sentAt,
    //        $invitation->sentAt,
    //    );
    //
    //    /** @var EyeDoctrine $eye */
    //    $eye = $tastingDoctrine->eyes->first();
    //
    //    $this->assertEquals(
    //        $expectedEye->id,
    //        $eye->id,
    //    );
    //    $this->assertEquals(
    //        $expectedEye->participant,
    //        $eye->participant,
    //    );
    //    $this->assertEquals(
    //        $expectedEye->limpidite,
    //        $eye->limpidite,
    //    );
    //    $this->assertEquals(
    //        $expectedEye->brillance,
    //        $eye->brillance,
    //    );
    //    $this->assertEquals(
    //        $expectedEye->intensiteCouleur,
    //        $eye->intensiteCouleur,
    //    );
    //    $this->assertEquals(
    //        $expectedEye->teinte,
    //        $eye->teinte,
    //    );
    //    $this->assertEquals(
    //        $expectedEye->larme,
    //        $eye->larme,
    //    );
    //    $this->assertEquals(
    //        $expectedEye->observation,
    //        $eye->observation,
    //    );
    // }
    //
    // public function testToInfrastructureUpdateRelationsUpdated(): void
    // {
    //    $tasting = Tasting::create(
    //        TastingId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
    //        Bottle::create(
    //            'Chateaux Margaux 2015',
    //            'red',
    //        ),
    //        TastingOwnerId::fromString('hugues.gobet@gmail.com'),
    //    );
    //
    //    $this->tastingRepository->add($tasting);
    //
    //    $tasting->invite(
    //        InvitationId::fromString('ea1341e5-f13b-4ee6-9597-383327c0fc57'),
    //        InvitationTarget::fromString('root@gmail.com'),
    //    );
    //
    //    $tasting::eraseRecordedEvents();
    //
    //    $this->tastingRepository->update($tasting);
    //
    //    $tasting->sendInvitation($tasting->invitations()->values()[0]);
    //
    //    $this->tastingRepository->update($tasting);
    //
    //    $oldTasting = new TastingDoctrine(
    //        'b9857453-1891-4fe8-80a9-1b873f15f0ec',
    //        'Chateaux Margaux 2015',
    //        WineType::RedWine,
    //        [
    //            'hugues.gobet@gmail.com',
    //        ],
    //        'hugues.gobet@gmail.com',
    //        new ArrayCollection(),
    //        new ArrayCollection(),
    //    );
    //
    //    $expected = new TastingDoctrine(
    //        'b9857453-1891-4fe8-80a9-1b873f15f0ec',
    //        'Chateaux Margaux 2015',
    //        WineType::RedWine,
    //        [
    //            'hugues.gobet@gmail.com',
    //        ],
    //        'hugues.gobet@gmail.com',
    //        new ArrayCollection(),
    //        new ArrayCollection(),
    //    );
    //
    //    $tastingDoctrine = TastingMapper::toInfrastructureUpdate($tasting, $oldTasting);
    //
    //    $expectedInvitation = new InvitationDoctrine(
    //        'ea1341e5-f13b-4ee6-9597-383327c0fc57',
    //        $expected,
    //        'root@gmail.com',
    //        GetInvitationLink::getLink()->value(),
    //        TastingInvitationStatus::PENDING,
    //        new \DateTimeImmutable(),
    //        new \DateTimeImmutable(),
    //    );
    //
    //    $expected->addInvitation($expectedInvitation);
    //
    //    $this->assertEquals(
    //        $expected->id,
    //        $tastingDoctrine->id,
    //    );
    //    $this->assertEquals(
    //        $expected->bottleName,
    //        $tastingDoctrine->bottleName,
    //    );
    //    $this->assertEquals(
    //        $expected->participants,
    //        $tastingDoctrine->participants,
    //    );
    //    $this->assertEquals(
    //        $expected->ownerId,
    //        $tastingDoctrine->ownerId,
    //    );
    //
    //    /** @var InvitationDoctrine $invitation */
    //    $invitation = $tastingDoctrine->invitations->first();
    //
    //    $this->assertEquals(
    //        $expectedInvitation->id,
    //        $invitation->id,
    //    );
    //    $this->assertEquals(
    //        $expectedInvitation->targetId,
    //        $invitation->targetId,
    //    );
    //    $this->assertNotNull(
    //        $invitation->subject,
    //    );
    //    $this->assertEquals(
    //        $expectedInvitation->status,
    //        $invitation->status,
    //    );
    //    $this->assertNotNull(
    //        $invitation->sentAt,
    //    );
    // }
    //
    // public function testToInfrastructureUpdateInvitationRemoved(): void
    // {
    //    $tasting = Tasting::create(
    //        TastingId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
    //        Bottle::create(
    //            'Chateaux Margaux 2015',
    //            'red',
    //        ),
    //        TastingOwnerId::fromString('hugues.gobet@gmail.com'),
    //    );
    //
    //    $this->tastingRepository->add($tasting);
    //
    //    $tasting::eraseRecordedEvents();
    //
    //    $tasting->invite(
    //        InvitationId::fromString('ea1341e5-f13b-4ee6-9597-383327c0fc57'),
    //        InvitationTarget::fromString('root@gmail.com'),
    //    );
    //
    //    $this->tastingRepository->update($tasting);
    //
    //    $tasting->sendInvitation($tasting->invitations()->values()[0]);
    //
    //    $this->tastingRepository->update($tasting);
    //
    //    $tasting->rejectInvitation($tasting->invitations()->values()[0]);
    //
    //    $this->tastingRepository->update($tasting);
    //
    //    $tasting->deleteInvitation($tasting->invitations()->values()[0]);
    //
    //    $this->tastingRepository->update($tasting);
    //
    //    $oldTasting = new TastingDoctrine(
    //        'b9857453-1891-4fe8-80a9-1b873f15f0ec',
    //        'Chateaux Margaux 2015',
    //        WineType::RedWine,
    //        [
    //            'hugues.gobet@gmail.com',
    //        ],
    //        'hugues.gobet@gmail.com',
    //        new ArrayCollection(),
    //    );
    //
    //    $expected = new TastingDoctrine(
    //        'b9857453-1891-4fe8-80a9-1b873f15f0ec',
    //        'Chateaux Margaux 2015',
    //        WineType::RedWine,
    //        [
    //            'hugues.gobet@gmail.com',
    //        ],
    //        'hugues.gobet@gmail.com',
    //        new ArrayCollection(),
    //    );
    //
    //    $tastingDoctrine = TastingMapper::toInfrastructureUpdate($tasting, $oldTasting);
    //
    //    $this->assertEquals(
    //        $expected->id,
    //        $tastingDoctrine->id,
    //    );
    //    $this->assertEquals(
    //        $expected->bottleName,
    //        $tastingDoctrine->bottleName,
    //    );
    //    $this->assertEquals(
    //        $expected->participants,
    //        $tastingDoctrine->participants,
    //    );
    //    $this->assertEquals(
    //        $expected->ownerId,
    //        $tastingDoctrine->ownerId,
    //    );
    //    $this->assertCount(0, $tastingDoctrine->invitations);
    // }
}
