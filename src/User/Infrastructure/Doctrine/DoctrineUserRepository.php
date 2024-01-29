<?php

declare(strict_types=1);

namespace App\User\Infrastructure\Doctrine;

use App\User\Domain\Entity\User;
use App\User\Domain\Repository\UserRepositoryInterface;
use App\User\Domain\ValueObject\Email;
use App\User\Domain\ValueObject\UserId;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Uid\Uuid;

class DoctrineUserRepository implements UserRepositoryInterface
{
    private const ENTITY_CLASS = User::class;

    public function __construct(private readonly EntityManagerInterface $entityManager)
    {
    }

    #[\Override]
    public function findByEmail(Email $email): ?User
    {
        return $this->entityManager->getRepository(self::ENTITY_CLASS)->createQueryBuilder('u')
            ->where('u.email.email = :email')
            ->setParameter('email', $email->email())
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }

    #[\Override]
    public function isAlreadyExist(Email $email): bool
    {
        return $this->findByEmail($email) !== null;
    }

    #[\Override]
    public function nextIdentity(): UserId
    {
        return new UserId(
            Uuid::v4()->toRfc4122()
        );
    }

    #[\Override]
    public function add(User $user): void
    {
        $this->entityManager->persist($user);
        $this->entityManager->flush();
    }
}
