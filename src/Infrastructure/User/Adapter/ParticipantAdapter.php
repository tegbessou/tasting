<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\User\Adapter;

use EmpireDesAmis\Tasting\Domain\Adapter\ParticipantAdapterInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\ParticipantId;
use EmpireDesAmis\Tasting\Domain\ValueObject\User;
use EmpireDesAmis\Tasting\Infrastructure\User\Exception\ParticipantDoesntExistYetException;
use EmpireDesAmis\Tasting\Infrastructure\User\Repository\ParticipantRepositoryInterface;
use EmpireDesAmis\Tasting\Infrastructure\User\Translator\ParticipantTranslator;

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
