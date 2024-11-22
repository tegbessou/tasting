<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Repository;

use App\Tasting\Domain\Repository\InvitationRepositoryInterface;
use App\Tasting\Domain\ValueObject\InvitationId;
use Symfony\Component\Uid\Uuid;

final class InvitationDoctrineRepository implements InvitationRepositoryInterface
{
    #[\Override]
    public function nextIdentity(): InvitationId
    {
        return InvitationId::fromString(
            Uuid::v4()->toRfc4122()
        );
    }
}
