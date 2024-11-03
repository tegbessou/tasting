<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Country\Infrastructure\ApiPlatform\State\Provider;

use PHPUnit\Framework\Attributes\DataProvider;
use Shared\ApiTestCase;

final class GetCountryCollectionProviderTest extends ApiTestCase
{
    public function testGetCollection(): void
    {
        $this->get('/api/countries');

        $this->assertResponseIsSuccessful();
        $this->assertJsonContains([
            '@context' => '/api/contexts/Country',
            '@id' => '/api/countries',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Country',
                    'name' => 'Afghanistan',
                ],
                [
                    '@type' => 'Country',
                    'name' => 'Afrique du Sud',
                ],
            ],
            'totalItems' => 241,
        ]);
    }

    #[DataProvider('provideCollectionFilter')]
    public function testGetCollectionFilterByName(
        string $uri,
        int $totalItems,
    ): void {
        $this->get($uri);

        $this->assertResponseIsSuccessful();
        $this->assertJsonContains([
            '@context' => '/api/contexts/Country',
            '@id' => '/api/countries',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Country',
                    'name' => 'France',
                ],
            ],
            'totalItems' => $totalItems,
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
