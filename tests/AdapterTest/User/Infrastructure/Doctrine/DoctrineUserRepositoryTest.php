<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\User\Infrastructure\Doctrine;

use App\User\Domain\ValueObject\Email;
use App\User\Infrastructure\Doctrine\DoctrineUserRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

class DoctrineUserRepositoryTest extends KernelTestCase
{
    public function testFindByEmail(): void
    {
        self::bootKernel();

        $container = static::getContainer();
        $doctrineUserRepository = $container->get(DoctrineUserRepository::class);

        $user = $doctrineUserRepository->findByEmail(new Email('hugues.gobet@gmail.com'));

        $this->assertNotNull($user);
    }
}
