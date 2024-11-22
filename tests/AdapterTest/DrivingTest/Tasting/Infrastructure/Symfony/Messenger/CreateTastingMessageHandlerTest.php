<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Application\ReadModel\Tasting as TastingReadModel;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Infrastructure\Doctrine\Entity\Tasting as TastingDoctrine;
use App\Tasting\Infrastructure\Doctrine\Repository\TastingDoctrineRepository;
use App\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\BottleTastedMessage;
use Doctrine\ODM\MongoDB\DocumentManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class CreateTastingMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;

    private TastingDoctrineRepository $doctrineTastingRepository;
    private EntityManagerInterface $entityManager;
    private DocumentManager $documentManager;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineTastingRepository = $container->get(TastingDoctrineRepository::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);
        $this->documentManager = $container->get(DocumentManager::class);
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
        );

        $this->assertNotNull($tastings->current());
        $this->assertEquals('hugues.gobet@gmail.com', $tastings->current()->ownerId()->value());

        $tastingReadModel = $this->documentManager->getRepository(TastingReadModel::class)->find($tastings->current()->id()->value());
        $this->documentManager->remove($tastingReadModel);
        $this->documentManager->flush();

        $tasting = $this->entityManager->getRepository(TastingDoctrine::class)->find($tastings->current()->id()->value());
        $this->entityManager->remove($tasting);
        $this->entityManager->flush();
    }
}
