<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Tasting\Domain\Enum\Finale;
use App\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionFinaleResource;

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
