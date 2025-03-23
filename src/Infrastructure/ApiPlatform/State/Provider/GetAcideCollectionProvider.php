<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use EmpireDesAmis\Tasting\Domain\Enum\Acide;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionAcideResource;

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
