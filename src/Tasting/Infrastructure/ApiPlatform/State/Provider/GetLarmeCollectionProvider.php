<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Tasting\Domain\Enum\Larme;
use App\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionIntensiteCouleurResource;
use App\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionLarmeResource;

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
