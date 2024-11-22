<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Application\Projection;

use App\Tasting\Application\Adapter\TastingAdapterInterface;
use App\Tasting\Application\Projection\CreateTastingProjection;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Event\TastingCreated;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use App\Tasting\Infrastructure\Doctrine\Entity\Tasting as TastingDoctrine;
use Doctrine\ODM\MongoDB\DocumentManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CreateTastingProjectionTest extends KernelTestCase
{
    private readonly CreateTastingProjection $tastingProjection;
    private readonly TastingAdapterInterface $tastingAdapter;
    private readonly TastingRepositoryInterface $tastingRepository;
    private readonly DocumentManager $documentManager;
    private readonly EntityManagerInterface $entityManager;

    public function testTastingProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->tastingProjection = $container->get(CreateTastingProjection::class);
        $this->tastingAdapter = $container->get(TastingAdapterInterface::class);
        $this->tastingRepository = $container->get(TastingRepositoryInterface::class);
        $this->documentManager = $container->get(DocumentManager::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);

        $tasting = Tasting::create(
            TastingId::fromString('4ad98deb-4295-455d-99e2-66e148c162af'),
            BottleName::fromString('Château de Fonsalette'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );
        $tasting::eraseRecordedEvents();

        $this->tastingRepository->add($tasting);

        $event = new TastingCreated(
            '4ad98deb-4295-455d-99e2-66e148c162af',
            'Château de Fonsalette',
            'hugues.gobet@gmail.com',
            [
                'hugues.gobet@gmail.com',
            ],
        );

        $projection($event);

        $tasting = $this->tastingAdapter->ofId('4ad98deb-4295-455d-99e2-66e148c162af');
        $this->assertNotNull($tasting);

        $this->documentManager->remove($tasting);
        $this->documentManager->flush();

        $tastingEntity = $this->entityManager->getRepository(TastingDoctrine::class)->find(
            '4ad98deb-4295-455d-99e2-66e148c162af',
        );

        $this->entityManager->remove($tastingEntity);
        $this->entityManager->flush();
    }
}
