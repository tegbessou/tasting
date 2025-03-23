<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Application\Projection;

use EmpireDesAmis\Tasting\Application\Adapter\InvitationAdapterInterface;
use EmpireDesAmis\Tasting\Application\Projection\CreateInvitationProjection;
use EmpireDesAmis\Tasting\Domain\Entity\Tasting;
use EmpireDesAmis\Tasting\Domain\Event\TastingParticipantInvited;
use EmpireDesAmis\Tasting\Domain\Repository\TastingRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\Bottle;
use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationId;
use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationTarget;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingId;
use EmpireDesAmis\Tasting\Domain\ValueObject\TastingOwnerId;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CreateInvitationProjectionTest extends KernelTestCase
{
    use RefreshDatabase;

    private readonly CreateInvitationProjection $createInvitationProjection;
    private readonly InvitationAdapterInterface $invitationAdapter;
    private readonly TastingRepositoryInterface $tastingRepository;

    public function testInvitationProjection(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $projection = $this->createInvitationProjection = $container->get(CreateInvitationProjection::class);
        $this->invitationAdapter = $container->get(InvitationAdapterInterface::class);
        $this->tastingRepository = $container->get(TastingRepositoryInterface::class);

        $tasting = Tasting::create(
            TastingId::fromString('4ad98deb-4295-455d-99e2-66e148c162af'),
            Bottle::create(
                '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
                'Château Margaux 2015',
                'red',
            ),
            TastingOwnerId::fromString('hugues.gobet@gmail.com'),
        );

        $tasting->invite(
            InvitationId::fromString('b9857453-1891-4fe8-80a9-1b873f15f0ec'),
            InvitationTarget::fromString('root@gmail.com'),
        );

        $tasting::eraseRecordedEvents();

        $this->tastingRepository->add($tasting);

        $event = new TastingParticipantInvited(
            'b9857453-1891-4fe8-80a9-1b873f15f0ec',
            '4ad98deb-4295-455d-99e2-66e148c162af',
            'Château Margaux 2015',
            'hugues.gobet@gmail.com',
            'root@gmail.com',
            'https://apps.apple.com/app/6468406309',
            new \DateTimeImmutable(),
        );

        $projection($event);

        $invitation = $this->invitationAdapter->ofId('b9857453-1891-4fe8-80a9-1b873f15f0ec');
        $this->assertNotNull($invitation);
    }
}
