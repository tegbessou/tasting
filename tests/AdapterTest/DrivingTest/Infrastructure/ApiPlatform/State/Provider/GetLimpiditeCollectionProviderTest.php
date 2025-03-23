<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Provider;

use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;

final class GetLimpiditeCollectionProviderTest extends ApiTestCase
{
    public function testGetLimpidites(): void
    {
        $this->get('/api/limpidites');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Limpidite',
            '@id' => '/api/limpidites',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Limpidite',
                    'value' => 'limpide',
                ],
                [
                    '@type' => 'Limpidite',
                    'value' => 'opalescente',
                ],
                [
                    '@type' => 'Limpidite',
                    'value' => 'voilée',
                ],
                [
                    '@type' => 'Limpidite',
                    'value' => 'floue',
                ],
                [
                    '@type' => 'Limpidite',
                    'value' => 'trouble',
                ],
            ],
            'totalItems' => 5,
        ]);
    }
}
