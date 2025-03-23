<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Projection\Projector;

use EmpireDesAmis\Tasting\Application\Adapter\TastingAdapterInterface;
use EmpireDesAmis\Tasting\Application\Exception\TastingDoesntExistException;

final readonly class DeleteTastingProjector
{
    public function __construct(
        private TastingAdapterInterface $tastingAdapter,
    ) {
    }

    public function project(string $tastingId): void
    {
        $tasting = $this->tastingAdapter->ofId($tastingId);

        if ($tasting === null) {
            throw new TastingDoesntExistException($tastingId);
        }

        $this->tastingAdapter->delete($tasting);
    }
}
