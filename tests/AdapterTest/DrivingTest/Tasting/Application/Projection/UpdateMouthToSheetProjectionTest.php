<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Application\Projection;

use App\Tasting\Application\Adapter\SheetAdapterInterface;
use App\Tasting\Application\Projection\UpdateMouthToSheetProjection;
use App\Tasting\Domain\Enum\Acide;
use App\Tasting\Domain\Enum\Alcool;
use App\Tasting\Domain\Enum\Finale;
use App\Tasting\Domain\Enum\Matiere;
use App\Tasting\Domain\Enum\Tanin;
use App\Tasting\Domain\Enum\WineType;
use App\Tasting\Domain\Event\MouthUpdated;
use App\Tasting\Domain\Repository\SheetRepositoryInterface;
use App\Tasting\Domain\ValueObject\MouthAcide;
use App\Tasting\Domain\ValueObject\MouthAlcool;
use App\Tasting\Domain\ValueObject\MouthFinale;
use App\Tasting\Domain\ValueObject\MouthId;
use App\Tasting\Domain\ValueObject\MouthMatiere;
use App\Tasting\Domain\ValueObject\MouthObservation;
use App\Tasting\Domain\ValueObject\MouthTanin;
use App\Tasting\Domain\ValueObject\SheetId;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class UpdateMouthToSheetProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly UpdateMouthToSheetProjection $updateMouthToSheetProjection;
    private readonly SheetAdapterInterface $sheetAdapter;
    private readonly SheetRepositoryInterface $sheetRepository;

    public function testUpdateNoseSheetProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->updateMouthToSheetProjection = $container->get(UpdateMouthToSheetProjection::class);
        $this->sheetAdapter = $container->get(SheetAdapterInterface::class);
        $this->sheetRepository = $container->get(SheetRepositoryInterface::class);

        $sheet = $this->sheetRepository->ofId(SheetId::fromString('53fdb99f-b379-4d28-a1c8-541df07a7c34'));

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

        $this->sheetRepository->update($sheet);

        $sheet->updateMouth(
            alcool: MouthAlcool::fromString(Alcool::FAIBLE->value),
            acide: MouthAcide::fromString(Acide::FRAICHE->value),
            matiere: MouthMatiere::fromString(Matiere::FLUETTE->value),
            finale: MouthFinale::fromString(Finale::PERSISTANTE->value),
            observation: MouthObservation::fromString('Observation (modifié)'),
            wineType: WineType::RedWine,
            tanin: MouthTanin::fromString(Tanin::LISSE->value),
        );

        $this->sheetRepository->update($sheet);

        $event = new MouthUpdated(
            '53fdb99f-b379-4d28-a1c8-541df07a7c34',
            Alcool::FAIBLE->value,
            Acide::FRAICHE->value,
            Matiere::FLUETTE->value,
            Finale::PERSISTANTE->value,
            'Observation (modifié)',
            Tanin::LISSE->value,
        );

        $projection($event);

        $sheet = $this->sheetAdapter->ofId('53fdb99f-b379-4d28-a1c8-541df07a7c34');

        $this->assertEquals(
            Alcool::FAIBLE->value,
            $sheet->mouthAlcool,
        );

        $this->assertEquals(
            Acide::FRAICHE->value,
            $sheet->mouthAcide,
        );

        $this->assertEquals(
            Matiere::FLUETTE->value,
            $sheet->mouthMatiere,
        );

        $this->assertEquals(
            Finale::PERSISTANTE->value,
            $sheet->mouthFinale,
        );

        $this->assertEquals(
            'Observation (modifié)',
            $sheet->mouthObservation,
        );

        $this->assertEquals(
            Tanin::LISSE->value,
            $sheet->mouthTanin,
        );
    }
}
