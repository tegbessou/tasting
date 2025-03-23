<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use EmpireDesAmis\Tasting\Domain\Enum\IntensiteCouleur;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionIntensiteCouleurResource;

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
