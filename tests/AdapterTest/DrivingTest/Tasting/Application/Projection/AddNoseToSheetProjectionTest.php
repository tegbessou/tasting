<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Application\Projection;

use App\Tasting\Application\Adapter\SheetAdapterInterface;
use App\Tasting\Application\Projection\AddNoseToSheetProjection;
use App\Tasting\Domain\Enum\Arome;
use App\Tasting\Domain\Enum\Impression;
use App\Tasting\Domain\Enum\Intensite;
use App\Tasting\Domain\Event\NoseAdded;
use App\Tasting\Domain\Repository\SheetRepositoryInterface;
use App\Tasting\Domain\ValueObject\NoseArome;
use App\Tasting\Domain\ValueObject\NoseId;
use App\Tasting\Domain\ValueObject\NoseImpression;
use App\Tasting\Domain\ValueObject\NoseIntensite;
use App\Tasting\Domain\ValueObject\NoseObservation;
use App\Tasting\Domain\ValueObject\SheetId;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class AddNoseToSheetProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly AddNoseToSheetProjection $addNoseToSheetProjection;
    private readonly SheetAdapterInterface $sheetAdapter;
    private readonly SheetRepositoryInterface $sheetRepository;

    public function testNoseSheetProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->addNoseToSheetProjection = $container->get(AddNoseToSheetProjection::class);
        $this->sheetAdapter = $container->get(SheetAdapterInterface::class);
        $this->sheetRepository = $container->get(SheetRepositoryInterface::class);

        $sheet = $this->sheetRepository->ofId(SheetId::fromString('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394'));

        $sheet->addNose(
            NoseId::fromString('99984c77-d0dd-4d52-81b9-5d8962edad68'),
            NoseImpression::fromString(Impression::FRANC->value),
            NoseIntensite::fromString(Intensite::AROMATIQUE->value),
            NoseArome::fromString(Arome::FRUITE->value),
            NoseObservation::fromString('Observation'),
        );

        $sheet::eraseRecordedEvents();

        $this->sheetRepository->update($sheet);

        $event = new NoseAdded(
            '1a9ea2de-bb0b-4104-ab6a-8b57d2e65394',
            Impression::FRANC->value,
            Intensite::AROMATIQUE->value,
            Arome::FRUITE->value,
            'Observation',
        );

        $projection($event);

        $sheet = $this->sheetAdapter->ofId('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394');

        $this->assertEquals(
            Impression::FRANC->value,
            $sheet->noseImpression,
        );

        $this->assertEquals(
            Intensite::AROMATIQUE->value,
            $sheet->noseIntensite,
        );

        $this->assertEquals(
            Arome::FRUITE->value,
            $sheet->noseArome,
        );

        $this->assertEquals(
            'Observation',
            $sheet->noseObservation,
        );
    }
}
