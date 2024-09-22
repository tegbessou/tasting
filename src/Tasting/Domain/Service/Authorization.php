<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Service;

use App\Tasting\Domain\Adapter\UserAdapterInterface;
use App\Tasting\Domain\ValueObject\ParticipantEmail;

final readonly class Authorization
{
    public function __construct(
        private UserAdapterInterface $userRepository,
    ) {
    }

    public function isExistUser(
        ParticipantEmail $participantEmail,
    ): bool {
        return $this->userRepository->ofEmail($participantEmail) !== null;
    }
}
