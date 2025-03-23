<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use EmpireDesAmis\Tasting\Domain\Enum\Larme;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionIntensiteCouleurResource;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionLarmeResource;

/**
 * @implements ProviderInterface<GetCollectionIntensiteCouleurResource>
 */
final readonly class GetLarmeCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $larmes = [];

        foreach (Larme::values() as $larme) {
            $larmes[] = new GetCollectionLarmeResource(
                $larme,
            );
        }

        return $larmes;
    }
}
