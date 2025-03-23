<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Provider;

use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;

final class GetAcideCollectionProviderTest extends ApiTestCase
{
    public function testGetAcides(): void
    {
        $this->get('/api/acides');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Acide',
            '@id' => '/api/acides',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Acide',
                    'value' => 'nerveuse',
                ],
                [
                    '@type' => 'Acide',
                    'value' => 'peintre',
                ],
                [
                    '@type' => 'Acide',
                    'value' => 'vite',
                ],
                [
                    '@type' => 'Acide',
                    'value' => 'fraîche',
                ],
                [
                    '@type' => 'Acide',
                    'value' => 'molle',
                ],
            ],
            'totalItems' => 5,
        ]);
    }
}
