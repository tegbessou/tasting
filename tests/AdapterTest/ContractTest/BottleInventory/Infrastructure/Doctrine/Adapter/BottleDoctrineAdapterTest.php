<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\BottleInventory\Infrastructure\Doctrine\Adapter;

use App\BottleInventory\Application\Adapter\BottleAdapterInterface;
use App\BottleInventory\Application\ReadModel\Bottle;
use Doctrine\ODM\MongoDB\DocumentManager;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class BottleDoctrineAdapterTest extends KernelTestCase
{
    private readonly BottleAdapterInterface $bottleDoctrineAdapter;

    private readonly DocumentManager $documentManager;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->bottleDoctrineAdapter = $container->get(BottleAdapterInterface::class);
        $this->documentManager = $container->get(DocumentManager::class);
    }

    public function testAdd(): void
    {
        $bottle = new Bottle(
            'b5880b05-073b-4224-95ed-21af2cf4e737',
            'Château Margaux',
            'Château Margaux',
            '++',
            2015,
            'red',
            '2021-01-01',
            ['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
            'hugues.gobet@gmail.com',
            'Hoge Hoge',
            'France',
            1099.99,
        );

        $this->bottleDoctrineAdapter->add($bottle);

        $bottle = $this->bottleDoctrineAdapter->ofId('b5880b05-073b-4224-95ed-21af2cf4e737');
        $this->assertNotNull($bottle);

        $this->documentManager->remove($bottle);
        $this->documentManager->flush();
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->bottleDoctrineAdapter->ofId('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
        );
    }

    public function testOfIdNull(): void
    {
        $this->assertNull(
            $this->bottleDoctrineAdapter->ofId('324ad167-1805-4a61-b2d3-3832e7a4e286'),
        );
    }

    public function testUpdate(): void
    {
        $bottle = new Bottle(
            'b5880b05-073b-4224-95ed-21af2cf4e737',
            'Château Margaux',
            'Château Margaux',
            '++',
            2015,
            'red',
            '2021-01-01',
            ['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
            'hugues.gobet@gmail.com',
            'Hoge Hoge',
            'France',
            1099.99,
        );

        $this->bottleDoctrineAdapter->add($bottle);

        $bottle = $this->bottleDoctrineAdapter->ofId('b5880b05-073b-4224-95ed-21af2cf4e737');

        $bottle->picture = 'cheateau-margaux.jpg';

        $this->bottleDoctrineAdapter->update($bottle);

        $bottle = $this->bottleDoctrineAdapter->ofId('b5880b05-073b-4224-95ed-21af2cf4e737');
        $this->assertEquals('cheateau-margaux.jpg', $bottle->picture);

        $this->documentManager->remove($bottle);
        $this->documentManager->flush();
    }
}
