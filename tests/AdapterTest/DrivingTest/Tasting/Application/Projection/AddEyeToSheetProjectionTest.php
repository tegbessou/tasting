<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Application\Projection;

use App\Tasting\Application\Adapter\SheetAdapterInterface;
use App\Tasting\Application\Projection\AddEyeToSheetProjection;
use App\Tasting\Domain\Enum\Brillance;
use App\Tasting\Domain\Enum\IntensiteCouleur;
use App\Tasting\Domain\Enum\Larme;
use App\Tasting\Domain\Enum\Limpidite;
use App\Tasting\Domain\Enum\RedTeinte;
use App\Tasting\Domain\Enum\WineType;
use App\Tasting\Domain\Event\EyeAdded;
use App\Tasting\Domain\Repository\SheetRepositoryInterface;
use App\Tasting\Domain\ValueObject\EyeBrillance;
use App\Tasting\Domain\ValueObject\EyeId;
use App\Tasting\Domain\ValueObject\EyeIntensiteCouleur;
use App\Tasting\Domain\ValueObject\EyeLarme;
use App\Tasting\Domain\ValueObject\EyeLimpidite;
use App\Tasting\Domain\ValueObject\EyeObservation;
use App\Tasting\Domain\ValueObject\EyeTeinte;
use App\Tasting\Domain\ValueObject\SheetId;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class AddEyeToSheetProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly AddEyeToSheetProjection $addEyeToSheetProjection;
    private readonly SheetAdapterInterface $sheetAdapter;
    private readonly SheetRepositoryInterface $sheetRepository;

    public function testSheetProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->addEyeToSheetProjection = $container->get(AddEyeToSheetProjection::class);
        $this->sheetAdapter = $container->get(SheetAdapterInterface::class);
        $this->sheetRepository = $container->get(SheetRepositoryInterface::class);

        $sheet = $this->sheetRepository->ofId(SheetId::fromString('53fdb99f-b379-4d28-a1c8-541df07a7c34'));

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
            '53fdb99f-b379-4d28-a1c8-541df07a7c34',
            Limpidite::FLOUE->value,
            Brillance::BRILLANTE->value,
            IntensiteCouleur::INTENSE->value,
            RedTeinte::AMBRE->value,
            Larme::GRASSE->value,
            'Observation',
        );

        $projection($event);

        $sheet = $this->sheetAdapter->ofId('53fdb99f-b379-4d28-a1c8-541df07a7c34');

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
