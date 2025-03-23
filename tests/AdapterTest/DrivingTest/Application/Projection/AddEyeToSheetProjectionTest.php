<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Application\Projection;

use EmpireDesAmis\Tasting\Application\Adapter\SheetAdapterInterface;
use EmpireDesAmis\Tasting\Application\Projection\AddEyeToSheetProjection;
use EmpireDesAmis\Tasting\Domain\Enum\Brillance;
use EmpireDesAmis\Tasting\Domain\Enum\IntensiteCouleur;
use EmpireDesAmis\Tasting\Domain\Enum\Larme;
use EmpireDesAmis\Tasting\Domain\Enum\Limpidite;
use EmpireDesAmis\Tasting\Domain\Enum\RedTeinte;
use EmpireDesAmis\Tasting\Domain\Enum\WineType;
use EmpireDesAmis\Tasting\Domain\Event\EyeAdded;
use EmpireDesAmis\Tasting\Domain\Repository\SheetRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeBrillance;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeId;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeLarme;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeLimpidite;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeObservation;
use EmpireDesAmis\Tasting\Domain\ValueObject\EyeTeinte;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class AddEyeToSheetProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly AddEyeToSheetProjection $addEyeToSheetProjection;
    private readonly SheetAdapterInterface $sheetAdapter;
    private readonly SheetRepositoryInterface $sheetRepository;

    public function testEyeSheetProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->addEyeToSheetProjection = $container->get(AddEyeToSheetProjection::class);
        $this->sheetAdapter = $container->get(SheetAdapterInterface::class);
        $this->sheetRepository = $container->get(SheetRepositoryInterface::class);

        $sheet = $this->sheetRepository->ofId(SheetId::fromString('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394'));

        $sheet->addEye(
            EyeId::fromString('691b560c-d2ab-4e21-859b-f6a246ffc9d6'),
            EyeLimpidite::fromString(Limpidite::FLOUE->value),
            EyeBrillance::fromString(Brillance::BRILLANTE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::INTENSE->value),
            EyeTeinte::fromString(RedTeinte::AMBRE->value),
            EyeLarme::fromString(Larme::GRASSE->value),
            EyeObservation::fromString('Observation'),
            WineType::RedWine,
        );

        $sheet::eraseRecordedEvents();

        $this->sheetRepository->update($sheet);

        $event = new EyeAdded(
            '1a9ea2de-bb0b-4104-ab6a-8b57d2e65394',
            Limpidite::FLOUE->value,
            Brillance::BRILLANTE->value,
            IntensiteCouleur::INTENSE->value,
            RedTeinte::AMBRE->value,
            Larme::GRASSE->value,
            'Observation',
        );

        $projection($event);

        $sheet = $this->sheetAdapter->ofId('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394');

        $this->assertEquals(
            Limpidite::FLOUE->value,
            $sheet->eyeLimpidite,
        );

        $this->assertEquals(
            Brillance::BRILLANTE->value,
            $sheet->eyeBrillance,
        );

        $this->assertEquals(
            IntensiteCouleur::INTENSE->value,
            $sheet->eyeIntensiteCouleur,
        );

        $this->assertEquals(
            RedTeinte::AMBRE->value,
            $sheet->eyeTeinte,
        );

        $this->assertEquals(
            Larme::GRASSE->value,
            $sheet->eyeLarme,
        );

        $this->assertEquals(
            'Observation',
            $sheet->eyeObservation,
        );
    }
}
