<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Application\Projection;

use App\Tasting\Application\Adapter\TastingAdapterInterface;
use App\Tasting\Application\Projection\DeleteTastingProjection;
use App\Tasting\Domain\Event\TastingDeleted;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class DeleteTastingProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly DeleteTastingProjection $deleteTastingProjection;
    private readonly TastingAdapterInterface $tastingAdapter;
    private readonly TastingRepositoryInterface $tastingRepository;

    public function testInvitationProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->deleteTastingProjection = $container->get(DeleteTastingProjection::class);
        $this->tastingAdapter = $container->get(TastingAdapterInterface::class);
        $this->tastingRepository = $container->get(TastingRepositoryInterface::class);

        $event = new TastingDeleted(
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
        );

        $projection($event);

        $tasting = $this->tastingAdapter->ofId('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537');
        $this->assertNull($tasting);
    }
}
