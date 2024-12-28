<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Application\Projection;

use App\Tasting\Application\Adapter\SheetAdapterInterface;
use App\Tasting\Application\Projection\CreateSheetProjection;
use App\Tasting\Domain\Entity\Sheet;
use App\Tasting\Domain\Event\SheetCreated;
use App\Tasting\Domain\Repository\SheetRepositoryInterface;
use App\Tasting\Domain\ValueObject\SheetId;
use App\Tasting\Domain\ValueObject\SheetParticipant;
use App\Tasting\Domain\ValueObject\SheetTastingId;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CreateSheetProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly CreateSheetProjection $createSheetProjection;
    private readonly SheetAdapterInterface $sheetAdapter;
    private readonly SheetRepositoryInterface $sheetRepository;

    public function testSheetProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->createSheetProjection = $container->get(CreateSheetProjection::class);
        $this->sheetAdapter = $container->get(SheetAdapterInterface::class);
        $this->sheetRepository = $container->get(SheetRepositoryInterface::class);

        $sheet = Sheet::create(
            SheetId::fromString('12875790-2d23-4e5a-8598-39f5af889334'),
            SheetTastingId::fromString('eea293fa-212b-4d30-92d6-0cdae7b803d0'),
            SheetParticipant::fromString('hugues.gobet@gmail.com'),
        );

        $sheet::eraseRecordedEvents();

        $this->sheetRepository->add($sheet);

        $event = new SheetCreated(
            '12875790-2d23-4e5a-8598-39f5af889334',
            'eea293fa-212b-4d30-92d6-0cdae7b803d0',
            'hugues.gobet@gmail.com',
        );

        $projection($event);

        $sheet = $this->sheetAdapter->ofId('12875790-2d23-4e5a-8598-39f5af889334');
        $this->assertNotNull($sheet);
    }
}
