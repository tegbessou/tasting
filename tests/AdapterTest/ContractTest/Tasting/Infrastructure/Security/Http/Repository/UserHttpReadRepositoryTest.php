<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Tasting\Infrastructure\Security\Http\Repository;

use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\User;
use App\Tasting\Domain\ValueObject\UserEmail;
use App\Tasting\Domain\ValueObject\UserFullName;
use App\Tasting\Infrastructure\Security\Adapter\UserAdapter;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class UserHttpReadRepositoryTest extends KernelTestCase
{
    private UserAdapter $httpUserRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->httpUserRepository = $container->get(UserAdapter::class);
    }

    public function testOfEmail(): void
    {
        $this->assertEquals(
            User::create(
                UserEmail::fromString('hugues.gobet@gmail.com'),
                UserFullName::fromString('Pedro'),
            ),
            $this->httpUserRepository->ofEmail(
                ParticipantId::fromString('hugues.gobet@gmail.com'),
            ),
        );
    }

    public function testOfEmailNull(): void
    {
        $this->assertNull(
            $this->httpUserRepository->ofEmail(
                ParticipantId::fromString('pedro@gmail.com'),
            ),
        );
    }
}
