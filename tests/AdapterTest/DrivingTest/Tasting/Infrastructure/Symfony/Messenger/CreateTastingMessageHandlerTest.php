<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Domain\ValueObject\BottleId;
use App\Tasting\Infrastructure\Doctrine\Repository\TastingReadDoctrineRepository;
use App\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\BottleTastedMessage;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class CreateTastingMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;

    private TastingReadDoctrineRepository $doctrineTastingRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineTastingRepository = $container->get(TastingReadDoctrineRepository::class);
    }

    public function testCreateTasting(): void
    {
        $this->bus('event.bus')->dispatch(new BottleTastedMessage(
            '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'hugues.gobet@gmail.com',
        ));

        $this->transport('tasting')->queue()->assertContains(BottleTastedMessage::class, 1);
        $this->transport('tasting')->process(1);
        $this->transport('tasting')->queue()->assertContains(BottleTastedMessage::class, 0);

        $tastings = $this->doctrineTastingRepository->withBottle(
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
        )->getIterator();

        $this->assertNotNull($tastings->current());
        $this->assertEquals('9964e539-05ff-4611-b39c-ffd6d108b8b7', $tastings->current()->owner()->id()->value());
    }
}
