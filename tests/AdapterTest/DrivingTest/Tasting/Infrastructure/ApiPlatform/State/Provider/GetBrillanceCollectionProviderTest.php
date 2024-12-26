<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Provider;

use Shared\ApiTestCase;

final class GetBrillanceCollectionProviderTest extends ApiTestCase
{
    public function testGetBrillances(): void
    {
        $this->get('/api/brillances');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Brillance',
            '@id' => '/api/brillances',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Brillance',
                    'value' => 'étincelante',
                ],
                [
                    '@type' => 'Brillance',
                    'value' => 'éclatante',
                ],
                [
                    '@type' => 'Brillance',
                    'value' => 'brillante',
                ],
                [
                    '@type' => 'Brillance',
                    'value' => 'lumineuse',
                ],
                [
                    '@type' => 'Brillance',
                    'value' => 'terne',
                ],
            ],
            'totalItems' => 5,
        ]);
    }
}
