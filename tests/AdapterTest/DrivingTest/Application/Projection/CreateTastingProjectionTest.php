<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Application\Projection;

use EmpireDesAmis\Tasting\Application\Adapter\TastingAdapterInterface;
use EmpireDesAmis\Tasting\Application\Projection\CreateTastingProjection;
use EmpireDesAmis\Tasting\Domain\Entity\Tasting;
use EmpireDesAmis\Tasting\Domain\Event\TastingCreated;
use EmpireDesAmis\Tasting\Domain\Repository\TastingRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\Bottle;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingId;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingOwnerId;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CreateTastingProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly CreateTastingProjection $tastingProjection;
    private readonly TastingAdapterInterface $tastingAdapter;
    private readonly TastingRepositoryInterface $tastingRepository;

    public function testTastingProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->tastingProjection = $container->get(CreateTastingProjection::class);
        $this->tastingAdapter = $container->get(TastingAdapterInterface::class);
        $this->tastingRepository = $container->get(TastingRepositoryInterface::class);

        $tasting = Tasting::create(
            TastingId::fromString('4ad98deb-4295-455d-99e2-66e148c162af'),
            Bottle::create(
                '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
                'Château Margaux 2015',
                'red',
            ),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );
        $tasting::eraseRecordedEvents();

        $this->tastingRepository->add($tasting);

        $event = new TastingCreated(
            '4ad98deb-4295-455d-99e2-66e148c162af',
            'Château Margaux 2015',
            'red',
            'hugues.gobet@gmail.com',
            [
                'hugues.gobet@gmail.com',
            ],
        );

        $projection($event);

        $tasting = $this->tastingAdapter->ofId('4ad98deb-4295-455d-99e2-66e148c162af');
        $this->assertNotNull($tasting);
    }
}
