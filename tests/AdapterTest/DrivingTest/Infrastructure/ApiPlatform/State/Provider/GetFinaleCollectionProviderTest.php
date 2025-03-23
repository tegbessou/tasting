<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Provider;

use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;

final class GetFinaleCollectionProviderTest extends ApiTestCase
{
    public function testGetFinales(): void
    {
        $this->get('/api/finales');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Finale',
            '@id' => '/api/finales',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Finale',
                    'value' => 'rémanente',
                ],
                [
                    '@type' => 'Finale',
                    'value' => 'persistante',
                ],
                [
                    '@type' => 'Finale',
                    'value' => 'langue',
                ],
                [
                    '@type' => 'Finale',
                    'value' => 'développée',
                ],
                [
                    '@type' => 'Finale',
                    'value' => 'courte',
                ],
            ],
            'totalItems' => 5,
        ]);
    }
}
