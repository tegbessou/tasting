<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Provider;

use Shared\ApiTestCase;

final class GetImpressionCollectionProviderTest extends ApiTestCase
{
    public function testGetImpressions(): void
    {
        $this->get('/api/impressions');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Impression',
            '@id' => '/api/impressions',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Impression',
                    'value' => 'complexe',
                ],
                [
                    '@type' => 'Impression',
                    'value' => 'franc',
                ],
                [
                    '@type' => 'Impression',
                    'value' => 'simple',
                ],
                [
                    '@type' => 'Impression',
                    'value' => 'douteux',
                ],
                [
                    '@type' => 'Impression',
                    'value' => 'défauts',
                ],
            ],
            'totalItems' => 5,
        ]);
    }
}
