<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Provider;

use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;

final class GetAromeCollectionProviderTest extends ApiTestCase
{
    public function testGetAromes(): void
    {
        $this->get('/api/aromes');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Arome',
            '@id' => '/api/aromes',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Arome',
                    'value' => 'fruité',
                ],
                [
                    '@type' => 'Arome',
                    'value' => 'florale',
                ],
                [
                    '@type' => 'Arome',
                    'value' => 'végétal',
                ],
                [
                    '@type' => 'Arome',
                    'value' => 'boisée',
                ],
                [
                    '@type' => 'Arome',
                    'value' => 'empyreumatique',
                ],
                [
                    '@type' => 'Arome',
                    'value' => 'animale',
                ],
                [
                    '@type' => 'Arome',
                    'value' => 'balsamique',
                ],
                [
                    '@type' => 'Arome',
                    'value' => 'minérales',
                ],
            ],
            'totalItems' => 8,
        ]);
    }
}
