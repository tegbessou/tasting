<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Delete;
use App\Tasting\Infrastructure\ApiPlatform\State\Processor\DeleteTastingProcessor;

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
