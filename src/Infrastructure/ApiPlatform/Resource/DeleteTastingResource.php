<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Delete;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Processor\DeleteTastingProcessor;

#[ApiResource(
    shortName: 'Tasting',
)]
#[Delete(
    uriTemplate: '/tastings/{id}',
    read: false,
    processor: DeleteTastingProcessor::class,
)]
final readonly class DeleteTastingResource
{
}
