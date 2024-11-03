<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\BottleInventory\Application\Projection;

use App\BottleInventory\Application\Adapter\BottleListAdapterInterface;
use App\BottleInventory\Application\Exception\BottleDoesntExistException;
use App\BottleInventory\Application\Projection\AddPictureBottleListProjection;
use App\BottleInventory\Domain\Event\BottlePictureAdded;
use Doctrine\ODM\MongoDB\DocumentManager;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class AddPictureBottleListProjectionTest extends KernelTestCase
{
    private readonly AddPictureBottleListProjection $addPictureBottleListProjection;
    private readonly BottleListAdapterInterface $bottleListAdapter;
    private readonly DocumentManager $documentManager;

    public function testBottleProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->addPictureBottleListProjection = $container->get(AddPictureBottleListProjection::class);
        $this->bottleListAdapter = $container->get(BottleListAdapterInterface::class);
        $this->documentManager = $container->get(DocumentManager::class);

        $event = new BottlePictureAdded(
            '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'chateau-margaux.jpg',
        );

        $projection($event);

        $bottle = $this->bottleListAdapter->ofId('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d');
        $this->assertEquals('chateau-margaux.jpg', $bottle->picture);

        $bottle->picture = null;
        $this->documentManager->flush();

        $bottle = $this->bottleListAdapter->ofId('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d');
        $this->assertNull($bottle->picture);
    }

    public function testBottleProjectionFailed(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->addPictureBottleListProjection = $container->get(AddPictureBottleListProjection::class);

        $event = new BottlePictureAdded(
            'aacb6bce-1111-42e0-852e-f9813abb49fa',
            'chateau-margaux.jpg',
        );

        $this->expectException(BottleDoesntExistException::class);
        $this->expectExceptionMessage('Bottle aacb6bce-1111-42e0-852e-f9813abb49fa does not exist');

        $projection($event);
    }
}
