<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Provider;

use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;

final class GetIntensiteCouleurCollectionProviderTest extends ApiTestCase
{
    public function testGetIntensiteCouleurs(): void
    {
        $this->get('/api/intensite_couleurs');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/IntensiteCouleur',
            '@id' => '/api/intensite_couleurs',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'IntensiteCouleur',
                    'value' => 'pâle',
                ],
                [
                    '@type' => 'IntensiteCouleur',
                    'value' => 'claire',
                ],
                [
                    '@type' => 'IntensiteCouleur',
                    'value' => 'soutenue',
                ],
                [
                    '@type' => 'IntensiteCouleur',
                    'value' => 'intense',
                ],
            ],
            'totalItems' => 4,
        ]);
    }
}
