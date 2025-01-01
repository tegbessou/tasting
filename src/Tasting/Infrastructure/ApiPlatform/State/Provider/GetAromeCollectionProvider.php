<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Tasting\Domain\Enum\Arome;
use App\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionAromeResource;

/**
 * @implements ProviderInterface<GetCollectionAromeResource>
 */
final readonly class GetAromeCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $aromes = [];

        foreach (Arome::values() as $arome) {
            $aromes[] = new GetCollectionAromeResource(
                $arome,
            );
        }

        return $aromes;
    }
}
