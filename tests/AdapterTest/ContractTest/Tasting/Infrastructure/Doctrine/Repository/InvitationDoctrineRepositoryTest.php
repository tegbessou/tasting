<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\ValueObject\InvitationId;
use App\Tasting\Infrastructure\Doctrine\Repository\InvitationDoctrineRepository;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

final class InvitationDoctrineRepositoryTest extends WebTestCase
{
    private InvitationDoctrineRepository $doctrineInvitationRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->doctrineInvitationRepository = $container->get(InvitationDoctrineRepository::class);
    }

    public function testNextId(): void
    {
        $this->assertInstanceOf(
            InvitationId::class,
            $this->doctrineInvitationRepository->nextIdentity(),
        );
    }
}
