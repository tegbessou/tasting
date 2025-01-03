<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Tasting\Domain\Enum\Sucre;
use App\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionSucreResource;

/**
 * @implements ProviderInterface<GetCollectionSucreResource>
 */
final readonly class GetSucreCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $sucres = [];

        foreach (Sucre::values() as $sucre) {
            $sucres[] = new GetCollectionSucreResource(
                $sucre,
            );
        }

        return $sucres;
    }
}
