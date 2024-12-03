<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\BottleInventory\Application\Projection;

use App\BottleInventory\Application\Adapter\BottleAdapterInterface;
use App\BottleInventory\Application\Exception\BottleDoesntExistException;
use App\BottleInventory\Application\Projection\TasteBottleProjection;
use App\BottleInventory\Domain\Event\BottleTasted;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class TasteBottleProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly TasteBottleProjection $tasteBottleProjection;
    private readonly BottleAdapterInterface $bottleAdapter;

    public function testTasteBottleProjection(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->tasteBottleProjection = $container->get(TasteBottleProjection::class);
        $projection = $this->tasteBottleProjection;
        $this->bottleAdapter = $container->get(BottleAdapterInterface::class);

        $event = new BottleTasted(
            '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'hugues.gobet@gmail.com',
            '2021-10-10',
        );

        $projection($event);

        $bottle = $this->bottleAdapter->ofId('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d');
        $this->assertEquals('2021-10-10', $bottle->tastedAt);
    }

    public function testTasteBottleProjectionFailed(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->tasteBottleProjection = $container->get(TasteBottleProjection::class);

        $event = new BottleTasted(
            'aacb6bce-1111-42e0-852e-f9813abb49fa',
            'hugues.gobet@gmail.com',
            '2021-10-10',
        );

        $this->expectException(BottleDoesntExistException::class);
        $this->expectExceptionMessage('Bottle aacb6bce-1111-42e0-852e-f9813abb49fa does not exist');

        $projection($event);
    }
}
