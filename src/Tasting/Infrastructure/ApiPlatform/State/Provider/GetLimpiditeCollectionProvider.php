<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Tasting\Domain\Enum\Limpidite;
use App\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionLimpiditeResource;

final readonly class GetLimpiditeCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $limpidites = [];

        foreach (Limpidite::values() as $limpidite) {
            $limpidites[] = new GetCollectionLimpiditeResource(
                $limpidite,
            );
        }

        return $limpidites;
    }
}
