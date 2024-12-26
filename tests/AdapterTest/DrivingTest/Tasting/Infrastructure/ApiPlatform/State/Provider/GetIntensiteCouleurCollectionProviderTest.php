<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Provider;

use PHPUnit\Framework\Attributes\Group;
use Shared\ApiTestCase;

#[Group('tasting')]
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
