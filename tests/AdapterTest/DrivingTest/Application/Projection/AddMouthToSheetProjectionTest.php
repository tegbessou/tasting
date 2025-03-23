<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Application\Projection;

use EmpireDesAmis\Tasting\Application\Adapter\SheetAdapterInterface;
use EmpireDesAmis\Tasting\Application\Projection\AddMouthToSheetProjection;
use EmpireDesAmis\Tasting\Domain\Enum\Acide;
use EmpireDesAmis\Tasting\Domain\Enum\Alcool;
use EmpireDesAmis\Tasting\Domain\Enum\Finale;
use EmpireDesAmis\Tasting\Domain\Enum\Matiere;
use EmpireDesAmis\Tasting\Domain\Enum\Tanin;
use EmpireDesAmis\Tasting\Domain\Enum\WineType;
use EmpireDesAmis\Tasting\Domain\Event\MouthAdded;
use EmpireDesAmis\Tasting\Domain\Repository\SheetRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthAcide;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthAlcool;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthFinale;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthId;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthMatiere;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthObservation;
use EmpireDesAmis\Tasting\Domain\ValueObject\MouthTanin;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class AddMouthToSheetProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly AddMouthToSheetProjection $addMouthToSheetProjection;
    private readonly SheetAdapterInterface $sheetAdapter;
    private readonly SheetRepositoryInterface $sheetRepository;

    public function testMouthSheetProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->addMouthToSheetProjection = $container->get(AddMouthToSheetProjection::class);
        $this->sheetAdapter = $container->get(SheetAdapterInterface::class);
        $this->sheetRepository = $container->get(SheetRepositoryInterface::class);

        $sheet = $this->sheetRepository->ofId(SheetId::fromString('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394'));

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

        $event = new MouthAdded(
            '1a9ea2de-bb0b-4104-ab6a-8b57d2e65394',
            'alcooleux',
            'nerveuse',
            'massive',
            'courte',
            'Observation',
            'fade',
        );

        $projection($event);

        $sheet = $this->sheetAdapter->ofId('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394');

        $this->assertEquals(
            Alcool::ALCOOLEUX->value,
            $sheet->mouthAlcool,
        );

        $this->assertEquals(
            Acide::NERVEUSE->value,
            $sheet->mouthAcide,
        );

        $this->assertEquals(
            Matiere::MASSIVE->value,
            $sheet->mouthMatiere,
        );

        $this->assertEquals(
            Finale::COURTE->value,
            $sheet->mouthFinale,
        );

        $this->assertEquals(
            'Observation',
            $sheet->mouthObservation,
        );

        $this->assertEquals(
            Tanin::FADE->value,
            $sheet->mouthTanin,
        );
    }
}
