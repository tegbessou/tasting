<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Security\Http\Repository;

use App\Tasting\Domain\Repository\UserRepositoryInterface;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\User;
use App\Tasting\Infrastructure\Security\Http\Client\UserHttpClientInterface;
use App\Tasting\Infrastructure\Security\Translator\UserTranslator;

final readonly class UserHttpRepository implements UserRepositoryInterface
{
    public function __construct(
        private UserHttpClientInterface $userHttpClient,
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
