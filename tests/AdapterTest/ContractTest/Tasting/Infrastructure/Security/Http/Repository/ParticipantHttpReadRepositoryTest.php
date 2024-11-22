<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Security\Http\Repository;

use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\User;
use App\Tasting\Domain\ValueObject\UserEmail;
use App\Tasting\Domain\ValueObject\UserFullName;
use App\Tasting\Infrastructure\Security\Adapter\ParticipantAdapter;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class ParticipantHttpReadRepositoryTest extends KernelTestCase
{
    private ParticipantAdapter $httpUserRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->httpUserRepository = $container->get(ParticipantAdapter::class);
    }

    public function testOfEmail(): void
    {
        $this->assertEquals(
            User::create(
                UserEmail::fromString('hugues.gobet@gmail.com'),
                UserFullName::fromString('Pedro'),
            ),
            $this->httpUserRepository->ofId(
                ParticipantId::fromString('hugues.gobet@gmail.com'),
            ),
        );
    }

    public function testOfEmailNull(): void
    {
        $this->assertNull(
            $this->httpUserRepository->ofId(
                ParticipantId::fromString('pedro@gmail.com'),
            ),
        );
    }
}
