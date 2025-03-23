<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use EmpireDesAmis\Tasting\Domain\Enum\Matiere;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionMatiereResource;

/**
 * @implements ProviderInterface<GetCollectionMatiereResource>
 */
final readonly class GetMatiereCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        $matieres = [];

        foreach (Matiere::values() as $matiere) {
            $matieres[] = new GetCollectionMatiereResource(
                $matiere,
            );
        }

        return $matieres;
    }
}
