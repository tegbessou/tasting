<?php

declare(strict_types=1);

namespace App\Security\Infrastructure\Doctrine\Adapter;

use App\Security\Application\Adapter\UserAdapterInterface;
use App\Security\Application\ReadModel\User;
use Doctrine\ODM\MongoDB\DocumentManager;

final readonly class UserDoctrineAdapter implements UserAdapterInterface
{
    public function __construct(
        private DocumentManager $documentManager,
    ) {
    }

    #[\Override]
    public function ofId(string $id): ?User
    {
        return $this->documentManager->getRepository(User::class)->findOneBy([
            'email' => $id,
        ]);
    }

    #[\Override]
    public function add(User $user): void
    {
        $this->documentManager->persist($user);
        $this->documentManager->flush();
    }
}
