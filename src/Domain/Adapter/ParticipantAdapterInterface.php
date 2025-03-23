<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Adapter;

use EmpireDesAmis\Tasting\Domain\ValueObject\ParticipantId;
use EmpireDesAmis\Tasting\Domain\ValueObject\User;

interface ParticipantAdapterInterface
{
    public function ofId(ParticipantId $id): ?User;
}
