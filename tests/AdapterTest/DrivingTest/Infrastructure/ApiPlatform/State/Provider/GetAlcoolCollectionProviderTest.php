<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Provider;

use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;

final class GetAlcoolCollectionProviderTest extends ApiTestCase
{
    public function testGetAlcools(): void
    {
        $this->get('/api/alcools');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Alcool',
            '@id' => '/api/alcools',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Alcool',
                    'value' => 'alcooleux',
                ],
                [
                    '@type' => 'Alcool',
                    'value' => 'capiteux',
                ],
                [
                    '@type' => 'Alcool',
                    'value' => 'faible',
                ],
                [
                    '@type' => 'Alcool',
                    'value' => 'généreux',
                ],
                [
                    '@type' => 'Alcool',
                    'value' => 'gras',
                ],
            ],
            'totalItems' => 5,
        ]);
    }
}
