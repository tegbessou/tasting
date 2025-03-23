<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\ContractTest\Infrastructure\Doctrine\Adapter;

use EmpireDesAmis\Tasting\Application\Adapter\SheetAdapterInterface;
use EmpireDesAmis\Tasting\Application\ReadModel\Sheet;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class SheetDoctrineAdapterTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly SheetAdapterInterface $sheetAdapter;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->sheetAdapter = $container->get(SheetAdapterInterface::class);
    }

    public function testAdd(): void
    {
        $sheet = new Sheet(
            'b5880b05-073b-4224-95ed-21af2cf4e737',
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            'hugues.gobet@gmail.com',
            'Pedro',
        );

        $this->sheetAdapter->add($sheet);

        $sheet = $this->sheetAdapter->ofId('b5880b05-073b-4224-95ed-21af2cf4e737');
        $this->assertNotNull($sheet);
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->sheetAdapter->ofId('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394'),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->sheetAdapter->ofId('324ad167-1805-4a61-b2d3-3832e7a4e286'),
        );
    }

    public function testWithTasting(): void
    {
        $sheets = $this->sheetAdapter->withTasting(
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
        )->getIterator();

        foreach ($sheets as $sheet) {
            $this->assertNotNull($sheet);
            $this->assertStringContainsString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537', $sheet->tastingId);
        }
    }

    public function testWithParticipant(): void
    {
        $sheets = $this->sheetAdapter->withParticipant(
            'hugues.gobet@gmail.com',
        )->getIterator();

        foreach ($sheets as $sheet) {
            $this->assertNotNull($sheet);
            $this->assertStringContainsString('hugues.gobet@gmail.com', $sheet->participantId);
        }
    }

    public function testUpdate(): void
    {
        $sheet = $this->sheetAdapter->ofId('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394');

        $this->assertNull($sheet->eyeObservation);

        $sheet->eyeObservation = 'Observation';

        $this->sheetAdapter->update($sheet);

        $sheet = $this->sheetAdapter->ofId('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394');

        $this->assertNotNull($sheet->eyeObservation);
    }

    public function testDelete(): void
    {
        $sheet = $this->sheetAdapter->ofId('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394');

        $this->sheetAdapter->delete($sheet);

        $sheet = $this->sheetAdapter->ofId('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394');

        $this->assertNull($sheet);
    }
}
