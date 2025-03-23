<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\ContractTest\Infrastructure\Doctrine\Adapter;

use EmpireDesAmis\Tasting\Application\Adapter\TastingAdapterInterface;
use EmpireDesAmis\Tasting\Application\ReadModel\Tasting;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class TastingDoctrineAdapterTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly TastingAdapterInterface $tastingAdapter;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->tastingAdapter = $container->get(TastingAdapterInterface::class);
    }

    public function testAdd(): void
    {
        $tasting = new Tasting(
            'b5880b05-073b-4224-95ed-21af2cf4e737',
            [
                'hugues.gobet@gmail.com',
            ],
            'Château Margaux',
            'red',
            'hugues.gobet@gmail.com',
            'Pedro',
        );

        $this->tastingAdapter->add($tasting);

        $tasting = $this->tastingAdapter->ofId('b5880b05-073b-4224-95ed-21af2cf4e737');
        $this->assertNotNull($tasting);
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->tastingAdapter->ofId('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->tastingAdapter->ofId('324ad167-1805-4a61-b2d3-3832e7a4e286'),
        );
    }

    public function testWithTarget(): void
    {
        $tastings = $this->tastingAdapter->withBottleName(
            'Domaine Leflaive Montrachet Grand Cru 2016',
        )->getIterator();

        foreach ($tastings as $tasting) {
            $this->assertNotNull($tasting);
            $this->assertStringContainsString('Domaine Leflaive Montrachet Grand Cru 2016', $tasting->bottleName);
        }
    }

    public function testDelete(): void
    {
        $tasting = $this->tastingAdapter->ofId('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537');

        $this->tastingAdapter->delete($tasting);

        $tasting = $this->tastingAdapter->ofId('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537');
        $this->assertNull($tasting);
    }
}
