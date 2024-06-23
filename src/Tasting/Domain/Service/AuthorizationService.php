<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Service;

use App\Tasting\Domain\Repository\UserReadRepositoryInterface;
use App\Tasting\Domain\ValueObject\ParticipantEmail;

final readonly class AuthorizationService
{
    public function __construct(
        private UserReadRepositoryInterface $userReadRepository,
    ) {
    }

    public function isExistUser(
        ParticipantEmail $participantEmail
    ): bool {
        return $this->userReadRepository->ofEmail($participantEmail) !== null;
    }
}
