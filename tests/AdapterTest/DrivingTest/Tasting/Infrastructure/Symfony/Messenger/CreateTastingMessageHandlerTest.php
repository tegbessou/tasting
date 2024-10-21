<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Infrastructure\Doctrine\Repository\TastingDoctrineRepository;
use App\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\BottleTastedMessage;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class CreateTastingMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;

    private TastingDoctrineRepository $doctrineTastingRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineTastingRepository = $container->get(TastingDoctrineRepository::class);
    }

    public function testCreateTasting(): void
    {
        $this->bus('event.bus')->dispatch(new BottleTastedMessage(
            'Château Margaux 2015',
            'hugues.gobet@gmail.com',
        ));

        $this->transport('tasting_from_external')->queue()->assertContains(BottleTastedMessage::class, 1);
        $this->transport('tasting_from_external')->process(1);
        $this->transport('tasting_from_external')->queue()->assertContains(BottleTastedMessage::class, 0);

        $tastings = $this->doctrineTastingRepository->withBottle(
            BottleName::fromString('Château Margaux 2015'),
        )->getIterator();

        $this->assertNotNull($tastings->current());
        $this->assertEquals('9964e539-05ff-4611-b39c-ffd6d108b8b7', $tastings->current()->owner()->id()->value());
    }
}
