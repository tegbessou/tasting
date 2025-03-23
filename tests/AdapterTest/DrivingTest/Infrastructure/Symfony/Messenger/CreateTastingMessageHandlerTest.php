<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\Symfony\Messenger;

use EmpireDesAmis\Tasting\Application\Adapter\TastingAdapterInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingId;
use EmpireDesAmis\Tasting\Infrastructure\Doctrine\Repository\TastingDoctrineRepository;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\BottleTastedMessage;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\CreateSheetWhenTastingIsCreatedMessage;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
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
            '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
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
