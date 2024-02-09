<?php

declare(strict_types=1);

namespace App\User\Infrastructure\Doctrine\Repository;

use App\User\Domain\Entity\User;
use App\User\Domain\Repository\UserRepositoryInterface;
use App\User\Domain\ValueObject\UserEmail;
use App\User\Domain\ValueObject\UserId;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Uid\Uuid;

final readonly class DoctrineUserRepository implements UserRepositoryInterface
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
    public function existWithEmail(UserEmail $email): bool
    {
        return $this->ofEmail($email) !== null;
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

    #[\Override]
    public function nextIdentity(): UserId
    {
        return UserId::fromString(
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
