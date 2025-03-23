<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Application\Projection;

use EmpireDesAmis\Tasting\Application\Adapter\SheetAdapterInterface;
use EmpireDesAmis\Tasting\Application\Projection\UpdateNoseToSheetProjection;
use EmpireDesAmis\Tasting\Domain\Enum\Arome;
use EmpireDesAmis\Tasting\Domain\Enum\Impression;
use EmpireDesAmis\Tasting\Domain\Enum\Intensite;
use EmpireDesAmis\Tasting\Domain\Event\NoseUpdated;
use EmpireDesAmis\Tasting\Domain\Repository\SheetRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseArome;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseId;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseImpression;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseIntensite;
use EmpireDesAmis\Tasting\Domain\ValueObject\NoseObservation;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class UpdateNoseToSheetProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly UpdateNoseToSheetProjection $updateNoseToSheetProjection;
    private readonly SheetAdapterInterface $sheetAdapter;
    private readonly SheetRepositoryInterface $sheetRepository;

    public function testUpdateNoseSheetProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->updateNoseToSheetProjection = $container->get(UpdateNoseToSheetProjection::class);
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

        $sheet->updateNose(
            NoseImpression::fromString(Impression::SIMPLE->value),
            NoseIntensite::fromString(Intensite::OUVERT->value),
            NoseArome::fromString(Arome::ANIMALE->value),
            NoseObservation::fromString('Observation (modifié)'),
        );

        $this->sheetRepository->update($sheet);

        $event = new NoseUpdated(
            '1a9ea2de-bb0b-4104-ab6a-8b57d2e65394',
            Impression::SIMPLE->value,
            Intensite::OUVERT->value,
            Arome::ANIMALE->value,
            'Observation (modifié)',
        );

        $projection($event);

        $sheet = $this->sheetAdapter->ofId('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394');

        $this->assertEquals(
            Impression::SIMPLE->value,
            $sheet->noseImpression,
        );

        $this->assertEquals(
            Intensite::OUVERT->value,
            $sheet->noseIntensite,
        );

        $this->assertEquals(
            Arome::ANIMALE->value,
            $sheet->noseArome,
        );

        $this->assertEquals(
            'Observation (modifié)',
            $sheet->noseObservation,
        );
    }
}
