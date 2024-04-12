<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\Doctrine\Repository;

use App\Security\Domain\Entity\User;
use App\Security\Domain\Repository\UserReadRepositoryInterface;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Domain\ValueObject\UserId;
use Doctrine\ORM\EntityManagerInterface;

final readonly class UserDoctrineReadRepository implements UserReadRepositoryInterface
{
    private const ENTITY_CLASS = User::class;

    public function __construct(private EntityManagerInterface $entityManager)
    {
    }

    #[\Override]
    public function ofEmail(UserEmail $email): ?User
    {
        return $this->entityManager->getRepository(self::ENTITY_CLASS)->createQueryBuilder('u')
            ->where('u.email.value = :email')
            ->setParameter('email', $email->value())
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }

    #[\Override]
    public function ofId(UserId $id): ?User
    {
        return $this->entityManager->find(self::ENTITY_CLASS, $id->value());
    }

    #[\Override]
    public function existWithId(UserId $id): bool
    {
        return $this->ofId($id) !== null;
    }
}
