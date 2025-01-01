<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Tasting\Domain\Enum\Intensite;
use App\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionIntensiteResource;

/**
 * @implements ProviderInterface<GetCollectionIntensiteResource>
 */
final readonly class GetIntensiteCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $intensites = [];

        foreach (Intensite::values() as $intensite) {
            $intensites[] = new GetCollectionIntensiteResource(
                $intensite,
            );
        }

        return $intensites;
    }
}
