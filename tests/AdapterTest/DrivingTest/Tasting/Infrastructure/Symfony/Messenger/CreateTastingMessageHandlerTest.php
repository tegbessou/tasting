<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Application\Adapter\TastingAdapterInterface;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Doctrine\Repository\TastingDoctrineRepository;
use App\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\BottleTastedMessage;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\CreateSheetWhenTastingIsCreatedMessage;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class CreateTastingMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;
    use RefreshDatabase;

    private TastingDoctrineRepository $doctrineTastingRepository;
    private TastingAdapterInterface $tastingAdapter;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineTastingRepository = $container->get(TastingDoctrineRepository::class);
        $this->tastingAdapter = $container->get(TastingAdapterInterface::class);
    }

    public function testCreateTasting(): void
    {
        $this->bus('event.bus')->dispatch(new BottleTastedMessage(
            'Château Margaux 2015',
            'red',
            'hugues.gobet@gmail.com',
        ));

        $this->transport('tasting_from_external')->queue()->assertContains(BottleTastedMessage::class, 1);
        $this->transport('tasting_from_external')->process(1);
        $this->transport('tasting_from_external')->queue()->assertContains(BottleTastedMessage::class, 0);

        $this->transport('tasting')->queue()->assertContains(CreateSheetWhenTastingIsCreatedMessage::class, 1);

        $tastings = $this->tastingAdapter->withBottleName(
            'Château Margaux 2015',
        )->getIterator();

        $this->assertNotNull($tastings->current());

        $tasting = $this->doctrineTastingRepository->ofId(TastingId::fromString($tastings->current()->id));

        $this->assertNotNull(
            $tasting,
        );
        $this->assertEquals('hugues.gobet@gmail.com', $tasting->ownerId()->value());
    }
}
