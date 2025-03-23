<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Application\Projection;

use EmpireDesAmis\Tasting\Application\Adapter\SheetAdapterInterface;
use EmpireDesAmis\Tasting\Application\Projection\UpdateEyeToSheetProjection;
use EmpireDesAmis\Tasting\Domain\Enum\Brillance;
use EmpireDesAmis\Tasting\Domain\Enum\IntensiteCouleur;
use EmpireDesAmis\Tasting\Domain\Enum\Larme;
use EmpireDesAmis\Tasting\Domain\Enum\Limpidite;
use EmpireDesAmis\Tasting\Domain\Enum\RedTeinte;
use EmpireDesAmis\Tasting\Domain\Enum\WineType;
use EmpireDesAmis\Tasting\Domain\Event\EyeUpdated;
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

final class UpdateEyeToSheetProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly UpdateEyeToSheetProjection $updateEyeToSheetProjection;
    private readonly SheetAdapterInterface $sheetAdapter;
    private readonly SheetRepositoryInterface $sheetRepository;

    public function testUpdateNoseSheetProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->updateEyeToSheetProjection = $container->get(UpdateEyeToSheetProjection::class);
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

        $sheet->updateEye(
            EyeLimpidite::fromString(Limpidite::OPALESCENTE->value),
            EyeBrillance::fromString(Brillance::TERNE->value),
            EyeIntensiteCouleur::fromString(IntensiteCouleur::CLAIRE->value),
            EyeTeinte::fromString(RedTeinte::CERISE->value),
            EyeLarme::fromString(Larme::EPAISSE->value),
            EyeObservation::fromString('Observation (modifié)'),
            WineType::RedWine,
        );

        $this->sheetRepository->update($sheet);

        $event = new EyeUpdated(
            '1a9ea2de-bb0b-4104-ab6a-8b57d2e65394',
            Limpidite::OPALESCENTE->value,
            Brillance::TERNE->value,
            IntensiteCouleur::CLAIRE->value,
            RedTeinte::CERISE->value,
            Larme::EPAISSE->value,
            'Observation (modifié)',
        );

        $projection($event);

        $sheet = $this->sheetAdapter->ofId('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394');

        $this->assertEquals(
            Limpidite::OPALESCENTE->value,
            $sheet->eyeLimpidite,
        );

        $this->assertEquals(
            Brillance::TERNE->value,
            $sheet->eyeBrillance,
        );

        $this->assertEquals(
            IntensiteCouleur::CLAIRE->value,
            $sheet->eyeIntensiteCouleur,
        );

        $this->assertEquals(
            RedTeinte::CERISE->value,
            $sheet->eyeTeinte,
        );

        $this->assertEquals(
            Larme::EPAISSE->value,
            $sheet->eyeLarme,
        );

        $this->assertEquals(
            'Observation (modifié)',
            $sheet->eyeObservation,
        );
    }
}
