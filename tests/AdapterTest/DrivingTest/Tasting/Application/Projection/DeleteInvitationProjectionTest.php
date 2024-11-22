<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Application\Projection;

use App\Tasting\Application\Adapter\InvitationAdapterInterface;
use App\Tasting\Application\Projection\DeleteInvitationProjection;
use App\Tasting\Application\ReadModel\Invitation;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Event\InvitationRemoved;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\Service\GetInvitationLink;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Domain\ValueObject\InvitationTarget;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use App\Tasting\Infrastructure\Doctrine\Entity\Tasting as TastingDoctrine;
use Doctrine\ODM\MongoDB\DocumentManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class DeleteInvitationProjectionTest extends KernelTestCase
{
    private readonly DeleteInvitationProjection $deleteInvitationProjection;
    private readonly InvitationAdapterInterface $invitationAdapter;
    private readonly TastingRepositoryInterface $tastingRepository;
    private readonly DocumentManager $documentManager;
    private readonly EntityManagerInterface $entityManager;

    public function testInvitationProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->deleteInvitationProjection = $container->get(DeleteInvitationProjection::class);
        $this->invitationAdapter = $container->get(InvitationAdapterInterface::class);
        $this->tastingRepository = $container->get(TastingRepositoryInterface::class);
        $this->documentManager = $container->get(DocumentManager::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);

        $invitationReadModel = new Invitation(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            '4ad98deb-4295-455d-99e2-66e148c162af',
            'Château de Fonsalette',
            'hugues.gobet@gmail.com',
            'Pedro',
            'root@gmail.com',
            'Pedro',
            GetInvitationLink::getLink()->value(),
            new \DateTimeImmutable(),
        );

        $this->invitationAdapter->add($invitationReadModel);

        $tasting = Tasting::create(
            TastingId::fromString('4ad98deb-4295-455d-99e2-66e148c162af'),
            BottleName::fromString('Château de Fonsalette'),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $this->tastingRepository->add($tasting);

        $tasting->invite(
            InvitationId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            InvitationTarget::fromString('root@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $this->tastingRepository->update($tasting);

        $tasting->sendInvitation($tasting->invitations()->values()[0]);

        $tasting::eraseRecordedEvents();

        $this->tastingRepository->update($tasting);

        $tasting->acceptInvitation($tasting->invitations()->values()[0]);

        $tasting::eraseRecordedEvents();

        $this->tastingRepository->update($tasting);

        $event = new InvitationRemoved(
            '4ad98deb-4295-455d-99e2-66e148c162af',
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
        );

        $projection($event);

        $invitation = $this->invitationAdapter->ofId('b9857453-1891-4fe8-80a9-1b873f15f0ec');
        $this->assertNull($invitation);

        $tastingEntity = $this->entityManager->getRepository(TastingDoctrine::class)->find(
            '4ad98deb-4295-455d-99e2-66e148c162af',
        );

        $this->entityManager->remove($tastingEntity);
        $this->entityManager->flush();
    }
}
