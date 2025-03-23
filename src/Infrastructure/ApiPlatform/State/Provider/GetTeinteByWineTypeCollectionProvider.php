<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProviderInterface;
use EmpireDesAmis\Tasting\Domain\Enum\WineType;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\GetCollectionTeinteByWineTypeResource;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @implements ProviderInterface<GetCollectionTeinteByWineTypeResource>
 */
final readonly class GetTeinteByWineTypeCollectionProvider implements ProviderInterface
{
    #[\Override]
    public function provide(Operation $operation, array $uriVariables = [], array $context = []): array
    {
        try {
            $wineType = WineType::from($uriVariables['wineType']);
        } catch (\ValueError) {
            throw new NotFoundHttpException();
        }

        $teintes = [];

        foreach ($wineType->getTeintes() as $teinte) {
            $teintes[] = new GetCollectionTeinteByWineTypeResource(
                $teinte,
            );
        }

        return $teintes;
    }
}
