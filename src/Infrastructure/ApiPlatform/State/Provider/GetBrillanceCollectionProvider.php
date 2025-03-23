<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use EmpireDesAmis\Tasting\Domain\Enum\Brillance;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionBrillanceResource;

/**
 * @implements ProviderInterface<GetCollectionBrillanceResource>
 */
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
