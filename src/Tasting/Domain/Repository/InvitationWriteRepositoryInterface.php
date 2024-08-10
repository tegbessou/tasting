<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Repository;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\ValueObject\InvitationId;

interface InvitationWriteRepositoryInterface
{
    public function ofId(InvitationId $id): ?Invitation;

    public function add(Invitation $invitation): void;

    public function nextIdentity(): InvitationId;

    public function update(): void;

    public function delete(Invitation $invitation): void;
}
