<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use EmpireDesAmis\Tasting\Domain\Enum\Alcool;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionAlcoolResource;

/**
 * @implements ProviderInterface<GetCollectionAlcoolResource>
 */
final readonly class GetAlcoolCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $alcools = [];

        foreach (Alcool::values() as $alcool) {
            $alcools[] = new GetCollectionAlcoolResource(
                $alcool,
            );
        }

        return $alcools;
    }
}
