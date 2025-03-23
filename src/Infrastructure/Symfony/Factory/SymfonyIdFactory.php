<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Symfony\Factory;

use EmpireDesAmis\Tasting\Domain\Factory\IdFactory;
use Symfony\Component\Uid\Uuid;

final readonly class SymfonyIdFactory implements IdFactory
{
    public function create(): string
    {
        return
            Uuid::v4()->toRfc4122()
        ;
    }
}
