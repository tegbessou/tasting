<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Processor;

use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationRejectedMessage;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\TastingDeletedMessage;
use Shared\ApiTestCase;
use Shared\RefreshDatabase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class DeleteTastingProcessorTest extends ApiTestCase
{
    use InteractsWithMessenger;
    use RefreshDatabase;

    private TastingRepositoryInterface $tastingDoctrineRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->tastingDoctrineRepository = $container->get(TastingRepositoryInterface::class);
    }

    public function testDeleteTasting(): void
    {
        $this->delete(
            '/api/tastings/2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
        );

        $this->assertResponseStatusCodeSame(204);

        $this->transport('tasting')->queue()->assertContains(TastingDeletedMessage::class, 1);

        $tasting = $this->tastingDoctrineRepository->ofId(
            TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
        );

        $this->assertNull($tasting);
    }

    public function testDeleteTastingNotFound(): void
    {
        $this->delete(
            '/api/tastings/1a3ff284-6c84-4dc6-bbd8-97d1110f2948'
        );

        $this->assertResponseStatusCodeSame(404);

        $this->transport('tasting')->queue()->assertContains(InvitationRejectedMessage::class, 0);
    }
}
