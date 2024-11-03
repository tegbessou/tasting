<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Post;
use App\BottleInventory\Infrastructure\ApiPlatform\State\Processor\TasteBottleProcessor;
use Symfony\Component\HttpFoundation\Response;

#[ApiResource(
    shortName: 'Bottle',
)]
#[Post(
    uriTemplate: '/bottles/{id}/taste',
    status: Response::HTTP_NO_CONTENT,
    output: false,
    read: false,
    processor: TasteBottleProcessor::class,
)]
final readonly class TasteBottleResource
{
}
