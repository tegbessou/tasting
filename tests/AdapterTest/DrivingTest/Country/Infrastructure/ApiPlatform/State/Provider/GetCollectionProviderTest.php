<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Country\Infrastructure\ApiPlatform\State\Provider;

use App\Tests\Shared\ApiTestCase;

final class GetCollectionProviderTest extends ApiTestCase
{
    public function testGetCollection(): void
    {
        $this->get('/api/countries');

        $this->assertResponseIsSuccessful();
        $this->assertJsonContains([
            '@context' => '/api/contexts/Country',
            '@id' => '/api/countries',
            '@type' => 'hydra:Collection',
            'hydra:member' => [
                [
                    '@type' => 'Country',
                    'name' => 'Afghanistan',
                ],
                [
                    '@type' => 'Country',
                    'name' => 'Afrique du Sud',
                ],
            ],
            'hydra:totalItems' => 241,
        ]);
    }

    /**
     * @dataProvider provideCollectionFilter
     */
    public function testGetCollectionFilterByName(
        string $uri,
        int $totalItems,
    ): void {
        $this->get($uri);

        $this->assertResponseIsSuccessful();
        $this->assertJsonContains([
            '@context' => '/api/contexts/Country',
            '@id' => '/api/countries',
            '@type' => 'hydra:Collection',
            'hydra:member' => [
                [
                    '@type' => 'Country',
                    'name' => 'France',
                ],
            ],
            'hydra:totalItems' => $totalItems,
        ]);
    }

    public static function provideCollectionFilter(): \Generator
    {
        yield 'Filter by name' => [
            'uri' => '/api/countries?name=France',
            'totalItems' => 1,
        ];
    }
}
