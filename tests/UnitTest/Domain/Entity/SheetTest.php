<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\UnitTest\Domain\Entity;

use EmpireDesAmis\Tasting\Domain\Entity\Sheet;
use EmpireDesAmis\Tasting\Domain\Enum\Acide;
use EmpireDesAmis\Tasting\Domain\Enum\Alcool;
use EmpireDesAmis\Tasting\Domain\Enum\Arome;
use EmpireDesAmis\Tasting\Domain\Enum\Brillance;
use EmpireDesAmis\Tasting\Domain\Enum\Finale;
use EmpireDesAmis\Tasting\Domain\Enum\Impression;
use EmpireDesAmis\Tasting\Domain\Enum\Intensite;
use EmpireDesAmis\Tasting\Domain\Enum\IntensiteCouleur;
use EmpireDesAmis\Tasting\Domain\Enum\Larme;
use EmpireDesAmis\Tasting\Domain\Enum\Limpidite;
use EmpireDesAmis\Tasting\Domain\Enum\Matiere;
use EmpireDesAmis\Tasting\Domain\Enum\RedTeinte;
use EmpireDesAmis\Tasting\Domain\Enum\Sucre;
use EmpireDesAmis\Tasting\Domain\Enum\Tanin;
use EmpireDesAmis\Tasting\Domain\Enum\WhiteTeinte;
use EmpireDesAmis\Tasting\Domain\Enum\WineType;
use EmpireDesAmis\Tasting\Domain\Event\EyeAdded;
use EmpireDesAmis\Tasting\Domain\Event\EyeUpdated;
use EmpireDesAmis\Tasting\Domain\Event\MouthAdded;
use EmpireDesAmis\Tasting\Domain\Event\MouthUpdated;
use EmpireDesAmis\Tasting\Domain\Event\NoseAdded;
use EmpireDesAmis\Tasting\Domain\Event\NoseUpdated;
use EmpireDesAmis\Tasting\Domain\Event\SheetCreated;
use EmpireDesAmis\Tasting\Domain\Event\SheetDeleted;
use EmpireDesAmis\Tasting\Domain\Exception\EyeAlreadyAddedException;
use EmpireDesAmis\Tasting\Domain\Exception\EyeShouldBeAddedException;
use EmpireDesAmis\Tasting\Domain\Exception\EyeTeinteIsNotForThisWineTypeException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthAlreadyAddedException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthShouldBeAddedException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthSucreShouldBeIfWineIsSweetException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthSucreShouldntBeIfWineIsNotSweetException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthTaninShouldBeIfWineTypeIsRedException;
use EmpireDesAmis\Tasting\Domain\Exception\MouthTaninShouldntBeIfWineTypeIsNotRedException;
use EmpireDesAmis\Tasting\Domain\Exception\NoseAlreadyAddedException;
use EmpireDesAmis\Tasting\Domain\Exception\NoseShouldBeAddedException;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeBrillance;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeId;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeLarme;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeLimpidite;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeObservation;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeTeinte;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthAcide;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthAlcool;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthFinale;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthId;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthMatiere;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthObservation;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthSucre;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthTanin;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseArome;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseId;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseImpression;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseIntensite;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseObservation;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetParticipant;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetTastingId;
use PHPUnit\Framework\TestCase;

final class SheetTest extends TestCase
{
    public function testCreate(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $this->assertInstanceOf(Sheet::class, $sheet);
    }

    public function testCreateSuccessEventDispatch(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $this->assertInstanceOf(SheetCreated::class, $sheet::getRecordedEvent()[0]);
        $this->assertEquals('c3827445-9578-43ef-b437-234feba48ec8', $sheet::getRecordedEvent()[0]->sheetId);
        $this->assertEquals('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537', $sheet::getRecordedEvent()[0]->tastingId);
        $this->assertEquals('hugues.gobet@gmail.com', $sheet::getRecordedEvent()[0]->participant);
        $sheet::eraseRecordedEvents();
    }

    public function testCreateFailedBadIdLength(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Sheet::create(
            SheetId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );
    }

    public function testCreateFailedBadId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Sheet::create(
            SheetId::fromString('12'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );
    }

    public function testCreateFailedBadTastingIdLength(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('af785dbb-4ac1-4786-a5aa-1fed08f6ec26-1fed08f6ec26'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );
    }

    public function testCreateFailedBadTastingId(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('12'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );
    }

    public function testCreateFailedBadParticipantShouldBeEmail(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet'),
        );
    }

    public function testAddEye(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addEye(
            EyeId::fromString('aaa29ab4-e46f-4243-8b7c-20988f2fa25b'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString(RedTeinte::AMBRE->value),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation'),
            WineType::RedWine,
        );

        $this->assertEquals('aaa29ab4-e46f-4243-8b7c-20988f2fa25b', $sheet->eye()->id()->value());
        $this->assertEquals(Limpidite::FLOUE->value, $sheet->eye()->limpidite()->value());
        $this->assertEquals(Brillance::BRILLANTE->value, $sheet->eye()->brillance()->value());
        $this->assertEquals(IntensiteCouleur::CLAIRE->value, $sheet->eye()->intensiteCouleur()->value());
        $this->assertEquals(RedTeinte::AMBRE->value, $sheet->eye()->teinte()->value());
        $this->assertEquals(Larme::EPAISSE->value, $sheet->eye()->larme()->value());
        $this->assertEquals('Observation', $sheet->eye()->observation()->value());
    }

    public function testAddEyeSuccessEventDispatch(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addEye(
            EyeId::fromString('aaa29ab4-e46f-4243-8b7c-20988f2fa25b'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString(RedTeinte::AMBRE->value),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation'),
            WineType::RedWine,
        );

        $this->assertInstanceOf(EyeAdded::class, $sheet::getRecordedEvent()[0]);
        $this->assertEquals('c3827445-9578-43ef-b437-234feba48ec8', $sheet::getRecordedEvent()[0]->sheetId);
        $this->assertEquals('floue', $sheet::getRecordedEvent()[0]->limpidite);
        $this->assertEquals('brillante', $sheet::getRecordedEvent()[0]->brillance);
        $this->assertEquals('claire', $sheet::getRecordedEvent()[0]->intensiteCouleur);
        $this->assertEquals('ambre', $sheet::getRecordedEvent()[0]->teinte);
        $this->assertEquals('épaisse', $sheet::getRecordedEvent()[0]->larme);
        $this->assertEquals('Observation', $sheet::getRecordedEvent()[0]->observation);
        $sheet::eraseRecordedEvents();
    }

    public function testAddEyeTeinteIsIncompatibleWithWineType(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(EyeTeinteIsNotForThisWineTypeException::class);

        $sheet->addEye(
            EyeId::fromString('aaa29ab4-e46f-4243-8b7c-20988f2fa25b'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString('moche'),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation'),
            WineType::RedWine,
        );
    }

    public function testAddEyeAlreadyAdded(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addEye(
            EyeId::fromString('aaa29ab4-e46f-4243-8b7c-20988f2fa25b'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString(RedTeinte::AMBRE->value),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation'),
            WineType::RedWine,
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(EyeAlreadyAddedException::class);

        $sheet->addEye(
            EyeId::fromString('aaa29ab4-e46f-4243-8b7c-20988f2fa25b'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString(RedTeinte::AMBRE->value),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation'),
            WineType::RedWine,
        );
    }

    public function testUpdateEye(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addEye(
            EyeId::fromString('aaa29ab4-e46f-4243-8b7c-20988f2fa25b'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString(RedTeinte::AMBRE->value),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation'),
            WineType::RedWine,
        );

        $sheet::eraseRecordedEvents();

        $this->assertEquals('aaa29ab4-e46f-4243-8b7c-20988f2fa25b', $sheet->eye()->id()->value());
        $this->assertEquals(Limpidite::FLOUE->value, $sheet->eye()->limpidite()->value());
        $this->assertEquals(Brillance::BRILLANTE->value, $sheet->eye()->brillance()->value());
        $this->assertEquals(IntensiteCouleur::CLAIRE->value, $sheet->eye()->intensiteCouleur()->value());
        $this->assertEquals(RedTeinte::AMBRE->value, $sheet->eye()->teinte()->value());
        $this->assertEquals(Larme::EPAISSE->value, $sheet->eye()->larme()->value());
        $this->assertEquals('Observation', $sheet->eye()->observation()->value());

        $sheet->updateEye(
            EyeLimpidite::fromString(Limpidite::LIMPIDE->value),
            EyeBrillance::fromString(Brillance::TERNE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::INTENSE->value),
            EyeTeinte::fromString(RedTeinte::GRENAT->value),
            EyeLarme::fromString(Larme::FLUIDE->value),
            EyeObservation::fromString('Observation (modifié)'),
            WineType::RedWine,
        );

        $this->assertEquals(Limpidite::LIMPIDE->value, $sheet->eye()->limpidite()->value());
        $this->assertEquals(Brillance::TERNE->value, $sheet->eye()->brillance()->value());
        $this->assertEquals(IntensiteCouleur::INTENSE->value, $sheet->eye()->intensiteCouleur()->value());
        $this->assertEquals(RedTeinte::GRENAT->value, $sheet->eye()->teinte()->value());
        $this->assertEquals(Larme::FLUIDE->value, $sheet->eye()->larme()->value());
        $this->assertEquals('Observation (modifié)', $sheet->eye()->observation()->value());
    }

    public function testUpdateEyeSuccessEventDispatch(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addEye(
            EyeId::fromString('aaa29ab4-e46f-4243-8b7c-20988f2fa25b'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString(RedTeinte::AMBRE->value),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation'),
            WineType::RedWine,
        );

        $sheet::eraseRecordedEvents();

        $sheet->updateEye(
            EyeLimpidite::fromString(Limpidite::LIMPIDE->value),
            EyeBrillance::fromString(Brillance::TERNE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::INTENSE->value),
            EyeTeinte::fromString(RedTeinte::GRENAT->value),
            EyeLarme::fromString(Larme::FLUIDE->value),
            EyeObservation::fromString('Observation (modifié)'),
            WineType::RedWine,
        );

        $this->assertInstanceOf(EyeUpdated::class, $sheet::getRecordedEvent()[0]);
        $this->assertEquals('c3827445-9578-43ef-b437-234feba48ec8', $sheet::getRecordedEvent()[0]->sheetId);
        $this->assertEquals('limpide', $sheet::getRecordedEvent()[0]->limpidite);
        $this->assertEquals('terne', $sheet::getRecordedEvent()[0]->brillance);
        $this->assertEquals('intense', $sheet::getRecordedEvent()[0]->intensiteCouleur);
        $this->assertEquals('grenat', $sheet::getRecordedEvent()[0]->teinte);
        $this->assertEquals('fluide', $sheet::getRecordedEvent()[0]->larme);
        $this->assertEquals('Observation (modifié)', $sheet::getRecordedEvent()[0]->observation);
        $sheet::eraseRecordedEvents();
    }

    public function testUpdateEyeBadTeinte(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addEye(
            EyeId::fromString('aaa29ab4-e46f-4243-8b7c-20988f2fa25b'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString(RedTeinte::AMBRE->value),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation'),
            WineType::RedWine,
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(EyeTeinteIsNotForThisWineTypeException::class);

        $sheet->updateEye(
            EyeLimpidite::fromString(Limpidite::LIMPIDE->value),
            EyeBrillance::fromString(Brillance::TERNE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::INTENSE->value),
            EyeTeinte::fromString(WhiteTeinte::ROUX->value),
            EyeLarme::fromString(Larme::FLUIDE->value),
            EyeObservation::fromString('Observation (modifié)'),
            WineType::RedWine,
        );
    }

    public function testUpdateEyeNotAdded(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(EyeShouldBeAddedException::class);

        $sheet->updateEye(
            EyeLimpidite::fromString(Limpidite::LIMPIDE->value),
            EyeBrillance::fromString(Brillance::TERNE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::INTENSE->value),
            EyeTeinte::fromString(RedTeinte::GRENAT->value),
            EyeLarme::fromString(Larme::FLUIDE->value),
            EyeObservation::fromString('Observation (modifié)'),
            WineType::RedWine,
        );
    }

    public function testAddNose(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addNose(
            NoseId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            NoseImpression::fromString(Impression::COMPLEXE->value),
            NoseIntensite::fromString(Intensite::OUVERT->value),
            NoseArome::fromString(Arome::FRUITE->value),
            NoseObservation::fromString('Observation'),
        );

        $this->assertEquals('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0', $sheet->nose()->id()->value());
        $this->assertEquals(Impression::COMPLEXE->value, $sheet->nose()->impression()->value());
        $this->assertEquals(Intensite::OUVERT->value, $sheet->nose()->intensite()->value());
        $this->assertEquals(Arome::FRUITE->value, $sheet->nose()->arome()->value());
        $this->assertEquals('Observation', $sheet->nose()->observation()->value());
    }

    public function testAddNoseSuccessEventDispatch(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addNose(
            NoseId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            NoseImpression::fromString(Impression::COMPLEXE->value),
            NoseIntensite::fromString(Intensite::OUVERT->value),
            NoseArome::fromString(Arome::FRUITE->value),
            NoseObservation::fromString('Observation'),
        );

        $this->assertInstanceOf(NoseAdded::class, $sheet::getRecordedEvent()[0]);
        $this->assertEquals('c3827445-9578-43ef-b437-234feba48ec8', $sheet::getRecordedEvent()[0]->sheetId);
        $this->assertEquals('complexe', $sheet::getRecordedEvent()[0]->impression);
        $this->assertEquals('ouvert', $sheet::getRecordedEvent()[0]->intensite);
        $this->assertEquals('fruité', $sheet::getRecordedEvent()[0]->arome);
        $this->assertEquals('Observation', $sheet::getRecordedEvent()[0]->observation);
        $sheet::eraseRecordedEvents();
    }

    public function testAddNoseAlreadyAdded(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addNose(
            NoseId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            NoseImpression::fromString(Impression::COMPLEXE->value),
            NoseIntensite::fromString(Intensite::OUVERT->value),
            NoseArome::fromString(Arome::FRUITE->value),
            NoseObservation::fromString('Observation'),
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(NoseAlreadyAddedException::class);

        $sheet->addNose(
            NoseId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            NoseImpression::fromString(Impression::COMPLEXE->value),
            NoseIntensite::fromString(Intensite::OUVERT->value),
            NoseArome::fromString(Arome::FRUITE->value),
            NoseObservation::fromString('Observation'),
        );
    }

    public function testUpdateNose(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addNose(
            NoseId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            NoseImpression::fromString(Impression::COMPLEXE->value),
            NoseIntensite::fromString(Intensite::OUVERT->value),
            NoseArome::fromString(Arome::FRUITE->value),
            NoseObservation::fromString('Observation'),
        );

        $sheet::eraseRecordedEvents();

        $this->assertEquals('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0', $sheet->nose()->id()->value());
        $this->assertEquals(Impression::COMPLEXE->value, $sheet->nose()->impression()->value());
        $this->assertEquals(Intensite::OUVERT->value, $sheet->nose()->intensite()->value());
        $this->assertEquals(Arome::FRUITE->value, $sheet->nose()->arome()->value());
        $this->assertEquals('Observation', $sheet->nose()->observation()->value());

        $sheet->updateNose(
            NoseImpression::fromString(Impression::DEFAUTS->value),
            NoseIntensite::fromString(Intensite::AROMATIQUE->value),
            NoseArome::fromString(Arome::BALSAMIQUE->value),
            NoseObservation::fromString('Observation (modifié)'),
        );

        $this->assertEquals('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0', $sheet->nose()->id()->value());
        $this->assertEquals(Impression::DEFAUTS->value, $sheet->nose()->impression()->value());
        $this->assertEquals(Intensite::AROMATIQUE->value, $sheet->nose()->intensite()->value());
        $this->assertEquals(Arome::BALSAMIQUE->value, $sheet->nose()->arome()->value());
        $this->assertEquals('Observation (modifié)', $sheet->nose()->observation()->value());
    }

    public function testUpdateNoseSuccessEventDispatch(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet->addNose(
            NoseId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            NoseImpression::fromString(Impression::COMPLEXE->value),
            NoseIntensite::fromString(Intensite::OUVERT->value),
            NoseArome::fromString(Arome::FRUITE->value),
            NoseObservation::fromString('Observation'),
        );

        $sheet::eraseRecordedEvents();

        $this->assertEquals('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0', $sheet->nose()->id()->value());
        $this->assertEquals(Impression::COMPLEXE->value, $sheet->nose()->impression()->value());
        $this->assertEquals(Intensite::OUVERT->value, $sheet->nose()->intensite()->value());
        $this->assertEquals(Arome::FRUITE->value, $sheet->nose()->arome()->value());
        $this->assertEquals('Observation', $sheet->nose()->observation()->value());

        $sheet->updateNose(
            NoseImpression::fromString(Impression::DEFAUTS->value),
            NoseIntensite::fromString(Intensite::AROMATIQUE->value),
            NoseArome::fromString(Arome::BALSAMIQUE->value),
            NoseObservation::fromString('Observation (modifié)'),
        );

        $this->assertInstanceOf(NoseUpdated::class, $sheet::getRecordedEvent()[0]);
        $this->assertEquals('c3827445-9578-43ef-b437-234feba48ec8', $sheet::getRecordedEvent()[0]->sheetId);
        $this->assertEquals('défauts', $sheet::getRecordedEvent()[0]->impression);
        $this->assertEquals('aromatique', $sheet::getRecordedEvent()[0]->intensite);
        $this->assertEquals('balsamique', $sheet::getRecordedEvent()[0]->arome);
        $this->assertEquals('Observation (modifié)', $sheet::getRecordedEvent()[0]->observation);
        $sheet::eraseRecordedEvents();
    }

    public function testUpdateNoseNotAdded(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(NoseShouldBeAddedException::class);

        $sheet->updateNose(
            NoseImpression::fromString(Impression::DEFAUTS->value),
            NoseIntensite::fromString(Intensite::AROMATIQUE->value),
            NoseArome::fromString(Arome::BALSAMIQUE->value),
            NoseObservation::fromString('Observation (modifié)'),
        );
    }

    public function testAddMouth(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::RedWine,
            tanin: MouthTanin::fromString(Tanin::FADE->value),
        );

        $this->assertEquals('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0', $sheet->mouth()->id()->value());
        $this->assertEquals(Alcool::ALCOOLEUX->value, $sheet->mouth()->alcool()->value());
        $this->assertEquals(Acide::NERVEUSE->value, $sheet->mouth()->acide()->value());
        $this->assertEquals(Matiere::MASSIVE->value, $sheet->mouth()->matiere()->value());
        $this->assertEquals(Finale::COURTE->value, $sheet->mouth()->finale()->value());
        $this->assertEquals(Tanin::FADE->value, $sheet->mouth()->tanin()->value());
        $this->assertEquals('Observation', $sheet->mouth()->observation()->value());
    }

    public function testAddMouthSuccessDispatchEvent(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::RedWine,
            tanin: MouthTanin::fromString(Tanin::FADE->value),
        );

        $this->assertInstanceOf(MouthAdded::class, $sheet::getRecordedEvent()[0]);
        $this->assertEquals('c3827445-9578-43ef-b437-234feba48ec8', $sheet::getRecordedEvent()[0]->sheetId);
        $this->assertEquals('alcooleux', $sheet::getRecordedEvent()[0]->alcool);
        $this->assertEquals('nerveuse', $sheet::getRecordedEvent()[0]->acide);
        $this->assertEquals('massive', $sheet::getRecordedEvent()[0]->matiere);
        $this->assertEquals('courte', $sheet::getRecordedEvent()[0]->finale);
        $this->assertEquals('Observation', $sheet::getRecordedEvent()[0]->observation);
        $this->assertEquals('fade', $sheet::getRecordedEvent()[0]->tanin);
        $sheet::eraseRecordedEvents();
    }

    public function testAddMouthWithTaninButItsNotARedWine(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(MouthTaninShouldntBeIfWineTypeIsNotRedException::class);

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::WhiteWine,
            tanin: MouthTanin::fromString(Tanin::FADE->value),
        );
    }

    public function testAddMouthWithRedWinenButWithoutTanin(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(MouthTaninShouldBeIfWineTypeIsRedException::class);

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::RedWine,
        );
    }

    public function testAddMouthWithSugarOnSweetWine(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::WhiteWine,
            sucre: MouthSucre::fromString(Sucre::SEC->value),
        );

        $this->assertEquals('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0', $sheet->mouth()->id()->value());
        $this->assertEquals(Sucre::SEC->value, $sheet->mouth()->sucre()->value());
    }

    public function testAddMouthWithSugarOnANoneSweetWine(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(MouthSucreShouldntBeIfWineIsNotSweetException::class);

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::RedWine,
            tanin: MouthTanin::fromString(Tanin::APRE->value),
            sucre: MouthSucre::fromString(Sucre::SEC->value),
        );
    }

    public function testAddMouthWithoutSugarOnASweetWine(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(MouthSucreShouldBeIfWineIsSweetException::class);

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::WhiteWine,
        );
    }

    public function testAddMouthAlreadyAdded(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::RedWine,
            tanin: MouthTanin::fromString(Tanin::FADE->value),
        );

        $this->expectException(MouthAlreadyAddedException::class);

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::RedWine,
            tanin: MouthTanin::fromString(Tanin::FADE->value),
        );
    }

    public function testUpdateMouth(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::RedWine,
            tanin: MouthTanin::fromString(Tanin::FADE->value),
        );

        $sheet::eraseRecordedEvents();

        $this->assertEquals('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0', $sheet->mouth()->id()->value());
        $this->assertEquals(Alcool::ALCOOLEUX->value, $sheet->mouth()->alcool()->value());
        $this->assertEquals(Acide::NERVEUSE->value, $sheet->mouth()->acide()->value());
        $this->assertEquals(Matiere::MASSIVE->value, $sheet->mouth()->matiere()->value());
        $this->assertEquals(Finale::COURTE->value, $sheet->mouth()->finale()->value());
        $this->assertEquals(Tanin::FADE->value, $sheet->mouth()->tanin()->value());
        $this->assertEquals('Observation', $sheet->mouth()->observation()->value());

        $sheet->updateMouth(
            alcool: MouthAlcool::fromString(Alcool::CAPITEUX->value),
            acide: MouthAcide::fromString(Acide::FRAICHE->value),
            matiere: MouthMatiere::fromString(Matiere::ETOFFEE->value),
            finale: MouthFinale::fromString(Finale::DEVELOPPEE->value),
            observation: MouthObservation::fromString('Observation (modifié)'),
            wineType: WineType::RedWine,
            tanin: MouthTanin::fromString(Tanin::CHARPENTE->value),
        );

        $this->assertEquals('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0', $sheet->mouth()->id()->value());
        $this->assertEquals(Alcool::CAPITEUX->value, $sheet->mouth()->alcool()->value());
        $this->assertEquals(Acide::FRAICHE->value, $sheet->mouth()->acide()->value());
        $this->assertEquals(Matiere::ETOFFEE->value, $sheet->mouth()->matiere()->value());
        $this->assertEquals(Finale::DEVELOPPEE->value, $sheet->mouth()->finale()->value());
        $this->assertEquals(Tanin::CHARPENTE->value, $sheet->mouth()->tanin()->value());
        $this->assertEquals('Observation (modifié)', $sheet->mouth()->observation()->value());
    }

    public function testUpdateMouthSuccessDispatchEvent(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::RedWine,
            tanin: MouthTanin::fromString(Tanin::FADE->value),
        );

        $sheet::eraseRecordedEvents();

        $this->assertEquals('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0', $sheet->mouth()->id()->value());
        $this->assertEquals(Alcool::ALCOOLEUX->value, $sheet->mouth()->alcool()->value());
        $this->assertEquals(Acide::NERVEUSE->value, $sheet->mouth()->acide()->value());
        $this->assertEquals(Matiere::MASSIVE->value, $sheet->mouth()->matiere()->value());
        $this->assertEquals(Finale::COURTE->value, $sheet->mouth()->finale()->value());
        $this->assertEquals(Tanin::FADE->value, $sheet->mouth()->tanin()->value());
        $this->assertEquals('Observation', $sheet->mouth()->observation()->value());

        $sheet->updateMouth(
            alcool: MouthAlcool::fromString(Alcool::CAPITEUX->value),
            acide: MouthAcide::fromString(Acide::FRAICHE->value),
            matiere: MouthMatiere::fromString(Matiere::ETOFFEE->value),
            finale: MouthFinale::fromString(Finale::DEVELOPPEE->value),
            observation: MouthObservation::fromString('Observation (modifié)'),
            wineType: WineType::RedWine,
            tanin: MouthTanin::fromString(Tanin::CHARPENTE->value),
        );

        $this->assertInstanceOf(MouthUpdated::class, $sheet::getRecordedEvent()[0]);
        $this->assertEquals('c3827445-9578-43ef-b437-234feba48ec8', $sheet::getRecordedEvent()[0]->sheetId);
        $this->assertEquals('capiteux', $sheet::getRecordedEvent()[0]->alcool);
        $this->assertEquals('fraîche', $sheet::getRecordedEvent()[0]->acide);
        $this->assertEquals('étoffée', $sheet::getRecordedEvent()[0]->matiere);
        $this->assertEquals('développée', $sheet::getRecordedEvent()[0]->finale);
        $this->assertEquals('Observation (modifié)', $sheet::getRecordedEvent()[0]->observation);
        $this->assertEquals('charpenté', $sheet::getRecordedEvent()[0]->tanin);
        $sheet::eraseRecordedEvents();
    }

    public function testUpdateMouthWithTaninButItsNotARedWine(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::WhiteWine,
            sucre: MouthSucre::fromString(Sucre::SEC->value),
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(MouthTaninShouldntBeIfWineTypeIsNotRedException::class);

        $sheet->updateMouth(
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::WhiteWine,
            tanin: MouthTanin::fromString(Tanin::FADE->value),
        );
    }

    public function testUpdateMouthWithRedWinenButWithoutTanin(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::RedWine,
            tanin: MouthTanin::fromString(Tanin::FADE->value),
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(MouthTaninShouldBeIfWineTypeIsRedException::class);

        $sheet->updateMouth(
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::RedWine,
        );
    }

    public function testUpdateMouthWithSugarOnSweetWine(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::WhiteWine,
            sucre: MouthSucre::fromString(Sucre::SEC->value),
        );

        $sheet::eraseRecordedEvents();

        $sheet->updateMouth(
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::WhiteWine,
            sucre: MouthSucre::fromString(Sucre::LIQOREUX->value),
        );

        $this->assertEquals('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0', $sheet->mouth()->id()->value());
        $this->assertEquals(Sucre::LIQOREUX->value, $sheet->mouth()->sucre()->value());
    }

    public function testUpdateMouthWithSugarOnANoneSweetWine(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::RedWine,
            tanin: MouthTanin::fromString(Tanin::FADE->value),
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(MouthSucreShouldntBeIfWineIsNotSweetException::class);

        $sheet->updateMouth(
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::RedWine,
            tanin: MouthTanin::fromString(Tanin::APRE->value),
            sucre: MouthSucre::fromString(Sucre::SEC->value),
        );
    }

    public function testUpdateMouthWithoutSugarOnASweetWine(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->addMouth(
            id: MouthId::fromString('4dd4ae6c-5ecd-4a19-be7c-ed6e3c9eddb0'),
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::WhiteWine,
            sucre: MouthSucre::fromString(Sucre::SEC->value),
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(MouthSucreShouldBeIfWineIsSweetException::class);

        $sheet->updateMouth(
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::WhiteWine,
        );
    }

    public function testUpdateMouthNotAdded(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $this->expectException(MouthShouldBeAddedException::class);

        $sheet->updateMouth(
            alcool: MouthAlcool::fromString(Alcool::ALCOOLEUX->value),
            acide: MouthAcide::fromString(Acide::NERVEUSE->value),
            matiere: MouthMatiere::fromString(Matiere::MASSIVE->value),
            finale: MouthFinale::fromString(Finale::COURTE->value),
            observation: MouthObservation::fromString('Observation'),
            wineType: WineType::WhiteWine,
        );
    }

    public function testDeleteSuccessEventDispatch(): void
    {
        $sheet = Sheet::create(
            SheetId::fromString('c3827445-9578-43ef-b437-234feba48ec8'),
            SheetTastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $sheet->delete();

        $this->assertInstanceOf(SheetDeleted::class, $sheet::getRecordedEvent()[0]);
        $this->assertEquals('c3827445-9578-43ef-b437-234feba48ec8', $sheet::getRecordedEvent()[0]->sheetId);
        $sheet::eraseRecordedEvents();
    }
}
