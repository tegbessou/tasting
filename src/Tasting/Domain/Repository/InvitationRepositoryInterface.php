<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Repository;

use App\Tasting\Domain\ValueObject\InvitationId;

interface InvitationRepositoryInterface
{
    public function nextIdentity(): InvitationId;
}
