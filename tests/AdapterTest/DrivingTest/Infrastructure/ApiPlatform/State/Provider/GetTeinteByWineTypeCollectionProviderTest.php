<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Provider;

use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;

final class GetTeinteByWineTypeCollectionProviderTest extends ApiTestCase
{
    public function testGetIntensiteCouleursForRedWine(): void
    {
        $this->get('/api/teintes/red');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Teinte',
            '@id' => '/api/teintes/red',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Teinte',
                    'value' => 'ambre',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'cerise',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'grenat',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'pourpre',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'tuile',
                ],
            ],
            'totalItems' => 5,
        ]);
    }

    public function testGetIntensiteCouleursForWhiteWine(): void
    {
        $this->get('/api/teintes/white');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Teinte',
            '@id' => '/api/teintes/white',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Teinte',
                    'value' => 'paille',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'blanc',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'doré',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'roux',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'vert',
                ],
            ],
            'totalItems' => 5,
        ]);
    }

    public function testGetIntensiteCouleursForChampagneWine(): void
    {
        $this->get('/api/teintes/champagne');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Teinte',
            '@id' => '/api/teintes/champagne',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Teinte',
                    'value' => 'jaune pâle',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'doré',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'jaune intense',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'or rose',
                ],
            ],
            'totalItems' => 4,
        ]);
    }

    public function testGetIntensiteCouleursForOrangeWine(): void
    {
        $this->get('/api/teintes/orange');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Teinte',
            '@id' => '/api/teintes/orange',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Teinte',
                    'value' => 'ambre',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'cuivré',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'orange intense',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'jaune doré',
                ],
            ],
            'totalItems' => 4,
        ]);
    }

    public function testGetIntensiteCouleursForRoseWine(): void
    {
        $this->get('/api/teintes/rosé');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Teinte',
            '@id' => '/api/teintes/ros%C3%A9',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Teinte',
                    'value' => 'vieux rose',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'framboise',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'saumon',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'pivoine',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'pelure d\'oignon',
                ],
            ],
            'totalItems' => 5,
        ]);
    }

    public function testGetIntensiteCouleursForSparklingWine(): void
    {
        $this->get('/api/teintes/sparkling');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Teinte',
            '@id' => '/api/teintes/sparkling',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Teinte',
                    'value' => 'blanc brillant',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'rosé',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'jaune soutenu',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'doré',
                ],
                [
                    '@type' => 'Teinte',
                    'value' => 'jaune pâle',
                ],
            ],
            'totalItems' => 5,
        ]);
    }

    public function testGetIntensiteCouleursForNotFoundWineType(): void
    {
        $this->get('/api/teintes/pedro');

        $this->assertResponseStatusCodeSame(404);
    }
}
