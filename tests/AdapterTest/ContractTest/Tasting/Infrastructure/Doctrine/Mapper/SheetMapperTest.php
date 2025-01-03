<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Mapper;

use App\Tasting\Domain\Entity\Sheet;
use App\Tasting\Domain\Enum\Acide;
use App\Tasting\Domain\Enum\Alcool;
use App\Tasting\Domain\Enum\Arome;
use App\Tasting\Domain\Enum\Brillance;
use App\Tasting\Domain\Enum\Finale;
use App\Tasting\Domain\Enum\Impression;
use App\Tasting\Domain\Enum\Intensite;
use App\Tasting\Domain\Enum\IntensiteCouleur;
use App\Tasting\Domain\Enum\Larme;
use App\Tasting\Domain\Enum\Limpidite;
use App\Tasting\Domain\Enum\Matiere;
use App\Tasting\Domain\Enum\RedTeinte;
use App\Tasting\Domain\Enum\Tanin;
use App\Tasting\Domain\Enum\WineType;
use App\Tasting\Domain\Repository\SheetRepositoryInterface;
use App\Tasting\Domain\ValueObject\EyeBrillance;
use App\Tasting\Domain\ValueObject\EyeId;
use App\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use App\Tasting\Domain\ValueObject\EyeLarme;
use App\Tasting\Domain\ValueObject\EyeLimpidite;
use App\Tasting\Domain\ValueObject\EyeObservation;
use App\Tasting\Domain\ValueObject\EyeTeinte;
use App\Tasting\Domain\ValueObject\MouthAcide;
use App\Tasting\Domain\ValueObject\MouthAlcool;
use App\Tasting\Domain\ValueObject\MouthFinale;
use App\Tasting\Domain\ValueObject\MouthId;
use App\Tasting\Domain\ValueObject\MouthMatiere;
use App\Tasting\Domain\ValueObject\MouthObservation;
use App\Tasting\Domain\ValueObject\MouthTanin;
use App\Tasting\Domain\ValueObject\NoseArome;
use App\Tasting\Domain\ValueObject\NoseId;
use App\Tasting\Domain\ValueObject\NoseImpression;
use App\Tasting\Domain\ValueObject\NoseIntensite;
use App\Tasting\Domain\ValueObject\NoseObservation;
use App\Tasting\Domain\ValueObject\SheetId;
use App\Tasting\Domain\ValueObject\SheetParticipant;
use App\Tasting\Domain\ValueObject\SheetTastingId;
use App\Tasting\Infrastructure\Doctrine\Entity\Eye as EyeDoctrine;
use App\Tasting\Infrastructure\Doctrine\Entity\Mouth as MouthDoctrine;
use App\Tasting\Infrastructure\Doctrine\Entity\Nose as NoseDoctrine;
use App\Tasting\Infrastructure\Doctrine\Entity\Sheet as SheetDoctrine;
use App\Tasting\Infrastructure\Doctrine\Mapper\SheetMapper;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class SheetMapperTest extends KernelTestCase
{
    use RefreshDatabase;

    private SheetRepositoryInterface $sheetRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->sheetRepository = $container->get(SheetRepositoryInterface::class);
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

        $nose = new NoseDoctrine(
            'bf79ca01-b07e-4804-a958-4f4d6e4a6649',
            $sheetDoctrine,
            Impression::FRANC,
            Intensite::AROMATIQUE,
            Arome::BALSAMIQUE,
            'Observation',
        );

        $mouth = new MouthDoctrine(
            'd49fd204-c621-4d07-aa75-27ae45bf92c4',
            $sheetDoctrine,
            Alcool::GENEREUX,
            Acide::VITE,
            Matiere::MASSIVE,
            Finale::DEVELOPPEE,
            'Observation',
            Tanin::APRE,
        );

        $sheetDoctrine->eye = $eye;
        $sheetDoctrine->nose = $nose;
        $sheetDoctrine->mouth = $mouth;

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

        $expectedSheet->addNose(
            NoseId::fromString('bf79ca01-b07e-4804-a958-4f4d6e4a6649'),
            NoseImpression::fromString(Impression::FRANC->value),
            NoseIntensite::fromString(Intensite::AROMATIQUE->value),
            NoseArome::fromString(Arome::BALSAMIQUE->value),
            NoseObservation::fromString('Observation'),
        );

        $expectedSheet->addMouth(
            MouthId::fromString('d49fd204-c621-4d07-aa75-27ae45bf92c4'),
            MouthAlcool::fromString(Alcool::GENEREUX->value),
            MouthAcide::fromString(Acide::VITE->value),
            MouthMatiere::fromString(Matiere::MASSIVE->value),
            MouthFinale::fromString(Finale::DEVELOPPEE->value),
            MouthObservation::fromString('Observation'),
            WineType::RedWine,
            MouthTanin::fromString(Tanin::APRE->value),
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
        $this->assertEquals(
            $expectedSheet->nose()->id(),
            $sheet->nose()->id(),
        );
        $this->assertEquals(
            $expectedSheet->nose()->impression(),
            $sheet->nose()->impression(),
        );
        $this->assertEquals(
            $expectedSheet->nose()->intensite(),
            $sheet->nose()->intensite(),
        );
        $this->assertEquals(
            $expectedSheet->nose()->arome(),
            $sheet->nose()->arome(),
        );
        $this->assertEquals(
            $expectedSheet->nose()->observation(),
            $sheet->nose()->observation(),
        );
        $this->assertEquals(
            $expectedSheet->mouth()->id(),
            $sheet->mouth()->id(),
        );
        $this->assertEquals(
            $expectedSheet->mouth()->alcool(),
            $sheet->mouth()->alcool(),
        );
        $this->assertEquals(
            $expectedSheet->mouth()->acide(),
            $sheet->mouth()->acide(),
        );
        $this->assertEquals(
            $expectedSheet->mouth()->matiere(),
            $sheet->mouth()->matiere(),
        );
        $this->assertEquals(
            $expectedSheet->mouth()->finale(),
            $sheet->mouth()->finale(),
        );
        $this->assertEquals(
            $expectedSheet->mouth()->observation(),
            $sheet->mouth()->observation(),
        );
        $this->assertEquals(
            $expectedSheet->mouth()->tanin(),
            $sheet->mouth()->tanin(),
        );
        $this->assertEquals(
            $expectedSheet->mouth()->matiere(),
            $sheet->mouth()->matiere(),
        );
    }

    public function testToInfrastructurePersist(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('root@gmail.com'),
        );

        $this->sheetRepository->add($sheet);

        $sheet::eraseRecordedEvents();

        $expected = new SheetDoctrine(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            'root@gmail.com',
        );

        $sheet = SheetMapper::toInfrastructurePersist($sheet);

        $this->assertEquals(
            $expected->id,
            $sheet->id,
        );
        $this->assertEquals(
            $expected->tastingId,
            $sheet->tastingId,
        );
        $this->assertEquals(
            $expected->participant,
            $sheet->participant,
        );
    }

    public function testToInfrastructureUpdateNewRelations(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('root@gmail.com'),
        );

        $this->sheetRepository->add($sheet);

        $sheet->addEye(
            EyeId::fromString('20eb3259-1697-4a39-bc34-238d7cf0b57b'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString('pourpre'),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation'),
            WineType::RedWine,
        );

        $sheet::eraseRecordedEvents();

        $sheet->addNose(
            NoseId::fromString('2fc41d55-b6a5-43e1-8afa-75bc512f4c78'),
            NoseImpression::fromString(Impression::SIMPLE->value),
            NoseIntensite::fromString(Intensite::AROMATIQUE->value),
            NoseArome::fromString(Arome::ANIMALE->value),
            NoseObservation::fromString('Observation'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addMouth(
            MouthId::fromString('4b757551-504e-4684-90ef-9cae9835ca58'),
            MouthAlcool::fromString(Alcool::GENEREUX->value),
            MouthAcide::fromString(Acide::VITE->value),
            MouthMatiere::fromString(Matiere::MASSIVE->value),
            MouthFinale::fromString(Finale::PERSISTANTE->value),
            MouthObservation::fromString('Observation'),
            WineType::RedWine,
            MouthTanin::fromString(Tanin::CHARGE->value),
        );

        $sheet::eraseRecordedEvents();

        $this->sheetRepository->update($sheet);

        $expected = new SheetDoctrine(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            'root@gmail.com',
        );

        $sheetDoctrine = SheetMapper::toInfrastructureUpdate($sheet, $expected);

        $expectedEye = new EyeDoctrine(
            '20eb3259-1697-4a39-bc34-238d7cf0b57b',
            $expected,
            Limpidite::FLOUE,
            Brillance::BRILLANTE,
            IntensiteCouleur::CLAIRE,
            'pourpre',
            Larme::EPAISSE,
            'Observation',
        );

        $expectedNose = new NoseDoctrine(
            '2fc41d55-b6a5-43e1-8afa-75bc512f4c78',
            $expected,
            Impression::SIMPLE,
            Intensite::AROMATIQUE,
            Arome::ANIMALE,
            'Observation',
        );

        $expectedMouth = new MouthDoctrine(
            '4b757551-504e-4684-90ef-9cae9835ca58',
            $expected,
            Alcool::GENEREUX,
            Acide::VITE,
            Matiere::MASSIVE,
            Finale::PERSISTANTE,
            'Observation',
            Tanin::CHARGE,
        );

        $this->assertEquals(
            $expected->id,
            $sheetDoctrine->id,
        );
        $this->assertEquals(
            $expected->tastingId,
            $sheetDoctrine->tastingId,
        );
        $this->assertEquals(
            $expected->participant,
            $sheetDoctrine->participant,
        );

        /** @var EyeDoctrine $eye */
        $eye = $sheetDoctrine->eye;

        $this->assertEquals(
            $expectedEye->id,
            $eye->id,
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

        /** @var NoseDoctrine $nose */
        $nose = $sheetDoctrine->nose;

        $this->assertEquals(
            $expectedNose->id,
            $nose->id,
        );
        $this->assertEquals(
            $expectedNose->impression,
            $nose->impression,
        );
        $this->assertEquals(
            $expectedNose->intensite,
            $nose->intensite,
        );
        $this->assertEquals(
            $expectedNose->arome,
            $nose->arome,
        );
        $this->assertEquals(
            $expectedNose->observation,
            $nose->observation,
        );

        /** @var MouthDoctrine $mouth */
        $mouth = $sheetDoctrine->mouth;

        $this->assertEquals(
            $expectedMouth->id,
            $mouth->id,
        );
        $this->assertEquals(
            $expectedMouth->alcool,
            $mouth->alcool,
        );
        $this->assertEquals(
            $expectedMouth->acide,
            $mouth->acide,
        );
        $this->assertEquals(
            $expectedMouth->matiere,
            $mouth->matiere,
        );
        $this->assertEquals(
            $expectedMouth->finale,
            $mouth->finale,
        );
        $this->assertEquals(
            $expectedMouth->observation,
            $mouth->observation,
        );
        $this->assertEquals(
            $expectedMouth->tanin,
            $mouth->tanin,
        );
        $this->assertEquals(
            $expectedMouth->sucre,
            $mouth->sucre,
        );
    }

    public function testToInfrastructureUpdateRelationsUpdated(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('root@gmail.com'),
        );

        $this->sheetRepository->add($sheet);

        $sheet->addEye(
            EyeId::fromString('20eb3259-1697-4a39-bc34-238d7cf0b57b'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString('pourpre'),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation'),
            WineType::RedWine,
        );

        $sheet::eraseRecordedEvents();

        $sheet->addNose(
            NoseId::fromString('2fc41d55-b6a5-43e1-8afa-75bc512f4c78'),
            NoseImpression::fromString(Impression::SIMPLE->value),
            NoseIntensite::fromString(Intensite::AROMATIQUE->value),
            NoseArome::fromString(Arome::ANIMALE->value),
            NoseObservation::fromString('Observation'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addMouth(
            MouthId::fromString('4b757551-504e-4684-90ef-9cae9835ca58'),
            MouthAlcool::fromString(Alcool::GENEREUX->value),
            MouthAcide::fromString(Acide::VITE->value),
            MouthMatiere::fromString(Matiere::MASSIVE->value),
            MouthFinale::fromString(Finale::PERSISTANTE->value),
            MouthObservation::fromString('Observation'),
            WineType::RedWine,
            MouthTanin::fromString(Tanin::CHARGE->value),
        );

        $sheet::eraseRecordedEvents();

        $this->sheetRepository->update($sheet);

        $sheet->updateEye(
            EyeLimpidite::fromString(Limpidite::OPALESCENTE->value),
            EyeBrillance::fromString(Brillance::TERNE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::SATANE->value),
            EyeTeinte::fromString('ambre'),
            EyeLarme::fromString(Larme::FLUIDE->value),
            EyeObservation::fromString('Observation (modifié)'),
            WineType::RedWine,
        );

        $sheet::eraseRecordedEvents();

        $sheet->updateNose(
            NoseImpression::fromString(Impression::FRANC->value),
            NoseIntensite::fromString(Intensite::DISCRET_FERME->value),
            NoseArome::fromString(Arome::FRUITE->value),
            NoseObservation::fromString('Observation (modifié)'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->updateMouth(
            MouthAlcool::fromString(Alcool::FAIBLE->value),
            MouthAcide::fromString(Acide::FRAICHE->value),
            MouthMatiere::fromString(Matiere::ETOFFEE->value),
            MouthFinale::fromString(Finale::REMANENTE->value),
            MouthObservation::fromString('Observation (modifié)'),
            WineType::RedWine,
            MouthTanin::fromString(Tanin::FADE->value),
        );

        $sheet::eraseRecordedEvents();

        $this->sheetRepository->update($sheet);

        $oldSheet = new SheetDoctrine(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            'root@gmail.com',
        );

        $oldEye = new EyeDoctrine(
            '20eb3259-1697-4a39-bc34-238d7cf0b57b',
            $oldSheet,
            Limpidite::FLOUE,
            Brillance::BRILLANTE,
            IntensiteCouleur::CLAIRE,
            'pourpre',
            Larme::EPAISSE,
            'Observation',
        );

        $oldNose = new NoseDoctrine(
            '2fc41d55-b6a5-43e1-8afa-75bc512f4c78',
            $oldSheet,
            Impression::SIMPLE,
            Intensite::AROMATIQUE,
            Arome::ANIMALE,
            'Observation',
        );

        $oldMouth = new MouthDoctrine(
            '4b757551-504e-4684-90ef-9cae9835ca58',
            $oldSheet,
            Alcool::GENEREUX,
            Acide::VITE,
            Matiere::MASSIVE,
            Finale::PERSISTANTE,
            'Observation',
            Tanin::CHARGE,
        );

        $oldSheet->eye = $oldEye;
        $oldSheet->nose = $oldNose;
        $oldSheet->mouth = $oldMouth;

        $sheetDoctrine = SheetMapper::toInfrastructureUpdate($sheet, $oldSheet);

        $eyeExpected = new EyeDoctrine(
            '20eb3259-1697-4a39-bc34-238d7cf0b57b',
            $oldSheet,
            Limpidite::OPALESCENTE,
            Brillance::TERNE,
            IntensiteCouleur::SATANE,
            'ambre',
            Larme::FLUIDE,
            'Observation (modifié)',
        );

        $expectedNose = new NoseDoctrine(
            '2fc41d55-b6a5-43e1-8afa-75bc512f4c78',
            $oldSheet,
            Impression::FRANC,
            Intensite::DISCRET_FERME,
            Arome::FRUITE,
            'Observation (modifié)',
        );

        $expectedMouth = new MouthDoctrine(
            '4b757551-504e-4684-90ef-9cae9835ca58',
            $sheetDoctrine,
            Alcool::FAIBLE,
            Acide::FRAICHE,
            Matiere::ETOFFEE,
            Finale::REMANENTE,
            'Observation (modifié)',
            Tanin::FADE,
        );

        /** @var EyeDoctrine $eye */
        $eye = $sheetDoctrine->eye;

        $this->assertEquals(
            $eyeExpected->id,
            $eye->id,
        );
        $this->assertEquals(
            $eye->limpidite,
            $eyeExpected->limpidite,
        );
        $this->assertEquals(
            $eye->brillance,
            $eyeExpected->brillance,
        );
        $this->assertEquals(
            $eye->intensiteCouleur,
            $eyeExpected->intensiteCouleur,
        );
        $this->assertEquals(
            $eye->teinte,
            $eyeExpected->teinte,
        );
        $this->assertEquals(
            $eye->larme,
            $eyeExpected->larme,
        );
        $this->assertEquals(
            $eye->observation,
            $eyeExpected->observation,
        );

        /** @var NoseDoctrine $nose */
        $nose = $sheetDoctrine->nose;

        $this->assertEquals(
            $expectedNose->id,
            $nose->id,
        );
        $this->assertEquals(
            $expectedNose->impression,
            $nose->impression,
        );
        $this->assertEquals(
            $expectedNose->intensite,
            $nose->intensite,
        );
        $this->assertEquals(
            $expectedNose->arome,
            $nose->arome,
        );
        $this->assertEquals(
            $expectedNose->observation,
            $nose->observation,
        );

        /** @var MouthDoctrine $mouth */
        $mouth = $sheetDoctrine->mouth;

        $this->assertEquals(
            $expectedMouth->id,
            $mouth->id,
        );
        $this->assertEquals(
            $expectedMouth->alcool,
            $mouth->alcool,
        );
        $this->assertEquals(
            $expectedMouth->acide,
            $mouth->acide,
        );
        $this->assertEquals(
            $expectedMouth->matiere,
            $mouth->matiere,
        );
        $this->assertEquals(
            $expectedMouth->finale,
            $mouth->finale,
        );
        $this->assertEquals(
            $expectedMouth->observation,
            $mouth->observation,
        );
        $this->assertEquals(
            $expectedMouth->tanin,
            $mouth->tanin,
        );
        $this->assertEquals(
            $expectedMouth->sucre,
            $mouth->sucre,
        );
    }
}
