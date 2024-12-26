<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Provider;

use Shared\ApiTestCase;

final class GetLarmeCollectionProviderTest extends ApiTestCase
{
    public function testGetLarmes(): void
    {
        $this->get('/api/larmes');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Larme',
            '@id' => '/api/larmes',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Larme',
                    'value' => 'visqueuse',
                ],
                [
                    '@type' => 'Larme',
                    'value' => 'grasse',
                ],
                [
                    '@type' => 'Larme',
                    'value' => 'épaisse',
                ],
                [
                    '@type' => 'Larme',
                    'value' => 'roulante',
                ],
                [
                    '@type' => 'Larme',
                    'value' => 'fluide',
                ],
            ],
            'totalItems' => 5,
        ]);
    }
}
