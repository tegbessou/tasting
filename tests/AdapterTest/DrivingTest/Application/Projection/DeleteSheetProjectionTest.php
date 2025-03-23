<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Application\Projection;

use EmpireDesAmis\Tasting\Application\Adapter\SheetAdapterInterface;
use EmpireDesAmis\Tasting\Application\Projection\DeleteSheetProjection;
use EmpireDesAmis\Tasting\Domain\Event\SheetDeleted;
use EmpireDesAmis\Tasting\Domain\Repository\SheetRepositoryInterface;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class DeleteSheetProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly DeleteSheetProjection $deleteSheetProjection;
    private readonly SheetAdapterInterface $sheetAdapter;
    private readonly SheetRepositoryInterface $sheetRepository;

    public function testSheetDeleteProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->deleteSheetProjection = $container->get(DeleteSheetProjection::class);
        $this->sheetAdapter = $container->get(SheetAdapterInterface::class);
        $this->sheetRepository = $container->get(SheetRepositoryInterface::class);

        $event = new SheetDeleted(
            '53fdb99f-b379-4d28-a1c8-541df07a7c34',
        );

        $projection($event);

        $tasting = $this->sheetAdapter->ofId('53fdb99f-b379-4d28-a1c8-541df07a7c34');
        $this->assertNull($tasting);
    }
}
