<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\Doctrine\Repository;

use App\Security\Domain\Entity\User;
use App\Security\Domain\Repository\UserRepositoryInterface;
use App\Security\Domain\ValueObject\UserEmail;
use App\Security\Domain\ValueObject\UserId;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Uid\Uuid;

final readonly class UserDoctrineRepository implements UserRepositoryInterface
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
