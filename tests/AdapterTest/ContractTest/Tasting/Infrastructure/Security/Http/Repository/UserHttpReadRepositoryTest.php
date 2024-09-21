<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\ContractTest\Tasting\Infrastructure\Security\Http\Repository;

use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\User;
use App\Tasting\Domain\ValueObject\UserEmail;
use App\Tasting\Infrastructure\Security\Http\Repository\UserHttpRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class UserHttpReadRepositoryTest extends KernelTestCase
{
    private UserHttpRepository $httpUserRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();

        $this->httpUserRepository = $container->get(UserHttpRepository::class);
    }

    public function testOfEmail(): void
    {
        $this->assertEquals(
            User::create(
                UserEmail::fromString('hugues.gobet@gmail.com'),
                true,
            ),
            $this->httpUserRepository->ofEmail(
                ParticipantEmail::fromString('hugues.gobet@gmail.com'),
            ),
        );
    }

    public function testOfEmailNotCurrent(): void
    {
        $this->assertEquals(
            User::create(
                UserEmail::fromString('root@gmail.com'),
                false,
            ),
            $this->httpUserRepository->ofEmail(
                ParticipantEmail::fromString('root@gmail.com'),
            ),
        );
    }

    public function testOfEmailNull(): void
    {
        $this->expectException(\LogicException::class);

        $this->assertNull(
            $this->httpUserRepository->ofEmail(
                ParticipantEmail::fromString('pedro@gmail.com'),
            ),
        );
    }
}
