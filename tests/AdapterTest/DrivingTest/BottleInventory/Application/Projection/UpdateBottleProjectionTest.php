<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\BottleInventory\Application\Projection;

use App\BottleInventory\Application\Adapter\BottleAdapterInterface;
use App\BottleInventory\Application\Exception\BottleDoesntExistException;
use App\BottleInventory\Application\Projection\UpdateBottleProjection;
use App\BottleInventory\Domain\Event\BottleUpdated;
use Doctrine\ODM\MongoDB\DocumentManager;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class UpdateBottleProjectionTest extends KernelTestCase
{
    private readonly UpdateBottleProjection $updateBottleProjection;
    private readonly BottleAdapterInterface $bottleAdapter;
    private readonly DocumentManager $documentManager;

    public function testUpdateBottleProjection(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->updateBottleProjection = $container->get(UpdateBottleProjection::class);
        $projection = $this->updateBottleProjection;
        $this->bottleAdapter = $container->get(BottleAdapterInterface::class);
        $this->documentManager = $container->get(DocumentManager::class);

        $event = new BottleUpdated(
            '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'Château Rayas',
            'Château Rayas',
            'white',
            2005,
            ['Merlot', 'Cabernet Franc'],
            '++',
            'Portugal',
            10.09,
        );

        $projection($event);

        $bottle = $this->bottleAdapter->ofId('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d');
        $this->assertEquals('Château Rayas', $bottle->name);
        $this->assertEquals('Château Rayas', $bottle->estateName);
        $this->assertEquals('white', $bottle->wineType);
        $this->assertEquals(2005, $bottle->year);
        $this->assertEquals(['Merlot', 'Cabernet Franc'], $bottle->grapeVarieties);
        $this->assertEquals('++', $bottle->rate);
        $this->assertEquals('Portugal', $bottle->country);
        $this->assertEquals(10.09, $bottle->price);

        $bottle->name = 'Château Margaux';
        $bottle->estateName = 'Château Margaux';
        $bottle->wineType = 'red';
        $bottle->year = 2015;
        $bottle->grapeVarieties = ['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot'];
        $bottle->rate = '++';
        $bottle->country = 'France';
        $bottle->price = 1099.99;
        $this->documentManager->flush();
    }

    public function testUpdateBottleProjectionFailed(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->updateBottleProjection = $container->get(UpdateBottleProjection::class);

        $event = new BottleUpdated(
            'aacb6bce-1111-42e0-852e-f9813abb49fa',
            'Château Rayas',
            'Château Rayas',
            'white',
            2005,
            ['Merlot', 'Cabernet Franc'],
            '++',
            'Portugal',
            10.09,
        );

        $this->expectException(BottleDoesntExistException::class);
        $this->expectExceptionMessage('Bottle aacb6bce-1111-42e0-852e-f9813abb49fa does not exist');

        $projection($event);
    }
}
