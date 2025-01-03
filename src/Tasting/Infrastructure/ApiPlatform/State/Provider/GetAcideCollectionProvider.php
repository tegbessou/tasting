<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use App\Tasting\Domain\Enum\Acide;
use App\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionAcideResource;

/**
 * @implements ProviderInterface<GetCollectionAcideResource>
 */
final readonly class GetAcideCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $acides = [];

        foreach (Acide::values() as $acide) {
            $acides[] = new GetCollectionAcideResource(
                $acide,
            );
        }

        return $acides;
    }
}
