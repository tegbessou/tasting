<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\Symfony\Messenger;

use EmpireDesAmis\Tasting\Domain\Repository\SheetRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\TastingDeletedMessage;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class DeleteTastingMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;
    use RefreshDatabase;

    private SheetRepositoryInterface $sheetDoctrineRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->sheetDoctrineRepository = $container->get(SheetRepositoryInterface::class);
    }

    public function testDeleteTasting(): void
    {
        $this->bus('event.bus')->dispatch(new TastingDeletedMessage(
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
        ));

        $this->transport('tasting')->queue()->assertContains(TastingDeletedMessage::class, 1);
        $this->transport('tasting')->process();
        $this->transport('tasting')->queue()->assertContains(TastingDeletedMessage::class, 0);

        $tasting = $this->sheetDoctrineRepository->ofId(
            SheetId::fromString('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394'),
        );

        $this->assertNull($tasting);
    }
}
