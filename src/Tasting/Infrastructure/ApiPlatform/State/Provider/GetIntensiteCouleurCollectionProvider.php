<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Tasting\Domain\Enum\IntensiteCouleur;
use App\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionIntensiteCouleurResource;

/**
 * @implements ProviderInterface<GetCollectionIntensiteCouleurResource>
 */
final readonly class GetIntensiteCouleurCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $intensiteCouleurs = [];

        foreach (IntensiteCouleur::values() as $intensiteCouleur) {
            $intensiteCouleurs[] = new GetCollectionIntensiteCouleurResource(
                $intensiteCouleur,
            );
        }

        return $intensiteCouleurs;
    }
}
