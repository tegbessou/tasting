<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use EmpireDesAmis\Tasting\Domain\Enum\Tanin;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionTaninResource;

/**
 * @implements ProviderInterface<GetCollectionTaninResource>
 */
final readonly class GetTaninCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $tanins = [];

        foreach (Tanin::values() as $tanin) {
            $tanins[] = new GetCollectionTaninResource(
                $tanin,
            );
        }

        return $tanins;
    }
}
