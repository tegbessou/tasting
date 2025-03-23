<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Provider;

use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;

final class GetTaninCollectionProviderTest extends ApiTestCase
{
    public function testGetTanins(): void
    {
        $this->get('/api/tanins');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Tanin',
            '@id' => '/api/tanins',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Tanin',
                    'value' => 'âpre',
                ],
                [
                    '@type' => 'Tanin',
                    'value' => 'chargé',
                ],
                [
                    '@type' => 'Tanin',
                    'value' => 'charpenté',
                ],
                [
                    '@type' => 'Tanin',
                    'value' => 'fade',
                ],
                [
                    '@type' => 'Tanin',
                    'value' => 'lisse',
                ],
            ],
            'totalItems' => 5,
        ]);
    }
}
