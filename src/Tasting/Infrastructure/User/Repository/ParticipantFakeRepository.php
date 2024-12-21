<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\User\Repository;

final readonly class ParticipantFakeRepository implements ParticipantRepositoryInterface
{
    #[\Override]
    public function ofId(string $email): array
    {
        if ($email === 'hugues.gobet@gmail.com') {
            return [
                'email' => 'hugues.gobet@gmail.com',
                'fullName' => 'Pedro',
            ];
        }

        if ($email === 'root@gmail.com') {
            return [
                'email' => 'root@gmail.com',
                'fullName' => 'Pedro',
            ];
        }

        if ($email === 'new@gmail.com') {
            return [
                'email' => 'new@gmail.com',
                'fullName' => null,
            ];
        }

        return [];
    }
}
