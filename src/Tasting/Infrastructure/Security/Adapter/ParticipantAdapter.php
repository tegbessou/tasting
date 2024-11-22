<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Security\Adapter;

use App\Tasting\Domain\Adapter\ParticipantAdapterInterface;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\User;
use App\Tasting\Infrastructure\Security\Exception\ParticipantDoesntExistYetException;
use App\Tasting\Infrastructure\Security\Repository\ParticipantRepositoryInterface;
use App\Tasting\Infrastructure\Security\Translator\ParticipantTranslator;

final readonly class ParticipantAdapter implements ParticipantAdapterInterface
{
    public function __construct(
        private ParticipantRepositoryInterface $userHttpClient,
    ) {
    }

    #[\Override]
    public function ofId(ParticipantId $id): ?User
    {
        try {
            return ParticipantTranslator::toUser(
                $this->userHttpClient->ofId($id->value()),
            );
        } catch (ParticipantDoesntExistYetException) {
            return null;
        }
    }
}
