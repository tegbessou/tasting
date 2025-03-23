<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\Get;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider\UpProvider;

#[Get('/up', provider: UpProvider::class)]
final readonly class UpResource
{
}
