<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Application\Adapter\InvitationAdapterInterface;
use App\Tasting\Application\ReadModel\Invitation;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\Service\InviteParticipant;
use App\Tasting\Domain\ValueObject\BottleName;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Domain\ValueObject\TastingOwnerId;
use App\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\UserCreatedMessage;
use Doctrine\ODM\MongoDB\DocumentManager;
use Doctrine\ORM\EntityManagerInterface;
use Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use TegCorp\SharedKernelBundle\Domain\Service\DomainEventDispatcherInterface;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class UpdateInvitationTargetFullNameMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;
    use RefreshDatabase;

    private TastingRepositoryInterface $doctrineTastingRepository;
    private EntityManagerInterface $entityManager;
    private DocumentManager $documentManager;
    private InviteParticipant $inviteParticipant;
    private InvitationAdapterInterface $invitationAdapter;
    private DomainEventDispatcherInterface $dispatcher;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineTastingRepository = $container->get(TastingRepositoryInterface::class);
        $this->inviteParticipant = $container->get(InviteParticipant::class);
        $this->invitationAdapter = $container->get(InvitationAdapterInterface::class);
        $this->dispatcher = $container->get(DomainEventDispatcherInterface::class);
    }

    public function testUpdateInvitationTargetFullName(): void
    {
        $owner = 'hugues.gobet@gmail.com';

        $participant = 'nexistepas@gmail.com';

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            BottleName::fromString('Sassicaia 2012'),
            TastingOwnerId::fromString($owner),
        );

        $this->doctrineTastingRepository->add($tasting);

        $this->inviteParticipant->inviteParticipants(
            $tasting,
            [
                $participant,
            ],
        );

        $this->doctrineTastingRepository->update($tasting);

        $this->dispatcher->dispatch($tasting);

        $this->bus('event.bus')->dispatch(new UserCreatedMessage(
            'nexistepas@gmail.com',
            'Hugues Gobet',
        ));

        $this->transport('tasting_from_external')->queue()->assertContains(UserCreatedMessage::class, 1);
        $this->transport('tasting_from_external')->process(1);
        $this->transport('tasting_from_external')->queue()->assertContains(UserCreatedMessage::class, 0);

        $invitations = $this->invitationAdapter->withTarget('nexistepas@gmail.com');

        /** @var Invitation $invitation */
        $invitation = $invitations->getIterator()->current();

        $this->assertEquals('Hugues Gobet', $invitation->targetFullName);
    }
}
