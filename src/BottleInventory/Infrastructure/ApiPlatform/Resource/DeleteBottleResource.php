<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Delete;
use App\BottleInventory\Infrastructure\ApiPlatform\State\Processor\DeleteBottleProcessor;

#[ApiResource(
    shortName: 'Bottle',
)]
#[Delete(
    uriTemplate: '/bottles/{id}',
    output: false,
    read: false,
    processor: DeleteBottleProcessor::class,
)]
final class DeleteBottleResource
{
}
