<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use EmpireDesAmis\Tasting\Domain\Enum\Finale;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionFinaleResource;

/**
 * @implements ProviderInterface<GetCollectionFinaleResource>
 */
final readonly class GetFinaleCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $finales = [];

        foreach (Finale::values() as $final) {
            $finales[] = new GetCollectionFinaleResource(
                $final,
            );
        }

        return $finales;
    }
}
