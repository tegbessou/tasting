<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Infrastructure\Doctrine\Repository\ParticipantReadDoctrineRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class ParticipantReadDoctrineRepositoryTest extends KernelTestCase
{
    private ParticipantReadDoctrineRepository $doctrineParticipantRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->doctrineParticipantRepository = $container->get(ParticipantReadDoctrineRepository::class);
    }

    public function testOfId(): void
    {
        $this->assertNotNull(
            $this->doctrineParticipantRepository->ofId(ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7')),
        );
    }

    public function testOfEmail(): void
    {
        $this->assertNotNull(
            $this->doctrineParticipantRepository->ofEmail(ParticipantEmail::fromString('hugues.gobet@gmail.com')
            ));
    }

    public function testExist(): void
    {
        $this->assertTrue($this->doctrineParticipantRepository->exist(ParticipantId::fromString('9964e539-05ff-4611-b39c-ffd6d108b8b7')));
    }
}
