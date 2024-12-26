<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Tasting\Domain\Enum\Brillance;
use App\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionBrillanceResource;

final readonly class GetBrillanceCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $brillances = [];

        foreach (Brillance::values() as $brillance) {
            $brillances[] = new GetCollectionBrillanceResource(
                $brillance,
            );
        }

        return $brillances;
    }
}
