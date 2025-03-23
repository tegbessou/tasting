<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Provider;

use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;

final class GetSucreCollectionProviderTest extends ApiTestCase
{
    public function testGetSucres(): void
    {
        $this->get('/api/sucres');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Sucre',
            '@id' => '/api/sucres',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Sucre',
                    'value' => 'sirupeux',
                ],
                [
                    '@type' => 'Sucre',
                    'value' => 'liquoreux',
                ],
                [
                    '@type' => 'Sucre',
                    'value' => 'moelleux',
                ],
                [
                    '@type' => 'Sucre',
                    'value' => 'doux',
                ],
                [
                    '@type' => 'Sucre',
                    'value' => 'sec',
                ],
            ],
            'totalItems' => 5,
        ]);
    }
}
