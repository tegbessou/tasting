<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use EmpireDesAmis\Tasting\Domain\Enum\Intensite;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionIntensiteResource;

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
