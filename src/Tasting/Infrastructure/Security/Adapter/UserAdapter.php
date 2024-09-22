<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Security\Adapter;

use App\Tasting\Domain\Adapter\UserAdapterInterface;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\User;
use App\Tasting\Infrastructure\Security\Repository\UserRepositoryInterface;
use App\Tasting\Infrastructure\Security\Translator\UserTranslator;

final readonly class UserAdapter implements UserAdapterInterface
{
    public function __construct(
        private UserRepositoryInterface $userHttpClient,
    ) {
    }

    #[\Override]
    public function ofEmail(ParticipantEmail $email): ?User
    {
        return UserTranslator::toUser(
            $this->userHttpClient->ofEmail($email->value()),
        );
    }
}
