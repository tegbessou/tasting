<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\BottleInventory\Infrastructure\Bottle\Http\Repository;

use App\Tasting\Domain\ValueObject\BottleId;
use App\Tasting\Infrastructure\BottleInventory\Http\Repository\BottleReadHttpRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class BottleReadHttpRepositoryTest extends KernelTestCase
{
    private BottleReadHttpRepository $bottleReadHttpRepository;

    #[\Override]
    protected function setUp(): void
    {
        parent::setUp();

        $container = self::getContainer();
        $this->bottleReadHttpRepository = $container->get(BottleReadHttpRepository::class);
    }

    public function testOfId(): void
    {
        $bottle = $this->bottleReadHttpRepository->ofId(
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
        );

        $this->assertNotNull($bottle);
        $this->assertEquals(
            '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            $bottle->id()->id(),
        );
        $this->assertEquals(
            'Château Margaux',
            $bottle->name()->value(),
        );
    }
}
