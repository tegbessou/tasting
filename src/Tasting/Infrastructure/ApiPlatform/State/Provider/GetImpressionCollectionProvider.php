<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Tasting\Domain\Enum\Impression;
use App\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionImpressionResource;

/**
 * @implements ProviderInterface<GetCollectionImpressionResource>
 */
final readonly class GetImpressionCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $impressions = [];

        foreach (Impression::values() as $impression) {
            $impressions[] = new GetCollectionImpressionResource(
                $impression,
            );
        }

        return $impressions;
    }
}
