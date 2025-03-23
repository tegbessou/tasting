<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\Symfony\Messenger;

use Doctrine\ODM\MongoDB\DocumentManager;
use Doctrine\ORM\EntityManagerInterface;
use EmpireDesAmis\Tasting\Application\Adapter\InvitationAdapterInterface;
use EmpireDesAmis\Tasting\Application\ReadModel\Invitation;
use EmpireDesAmis\Tasting\Domain\Entity\Tasting;
use EmpireDesAmis\Tasting\Domain\Repository\TastingRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\Bottle;
use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationId;
use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationTarget;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingId;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingOwnerId;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\UserCreatedMessage;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
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
    private InvitationAdapterInterface $invitationAdapter;
    private DomainEventDispatcherInterface $dispatcher;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineTastingRepository = $container->get(TastingRepositoryInterface::class);
        $this->invitationAdapter = $container->get(InvitationAdapterInterface::class);
        $this->dispatcher = $container->get(DomainEventDispatcherInterface::class);
    }

    public function testUpdateInvitationTargetFullName(): void
    {
        $owner = 'hugues.gobet@gmail.com';

        $participant = 'nexistepas@gmail.com';

        $tasting = Tasting::create(
            TastingId::fromString('c7a497ed-d885-4401-930c-768dc1a85159'),
            Bottle::create(
                '4eb449d9-7d23-4984-a68d-77aa19fccc60',
                'Sassicaia 2012',
                'red',
            ),
            TastingOwnerId::fromString($owner),
        );

        $this->doctrineTastingRepository->add($tasting);

        $tasting->invite(
            InvitationId::fromString('aaa29ab4-e46f-4243-8b7c-20988f2fa25b'),
            InvitationTarget::fromString($participant),
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
