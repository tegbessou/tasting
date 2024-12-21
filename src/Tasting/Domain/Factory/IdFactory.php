<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Factory;

interface IdFactory
{
    public function create(): string;
}
