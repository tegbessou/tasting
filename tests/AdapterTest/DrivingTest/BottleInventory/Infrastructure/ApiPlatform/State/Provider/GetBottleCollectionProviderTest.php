<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\BottleInventory\Infrastructure\ApiPlatform\State\Provider;

use App\Tests\Shared\ApiTestCase;

final class GetBottleCollectionProviderTest extends ApiTestCase
{
    public function testGetCollectionProvider(): void
    {
        $this->get('/api/bottles');

        $this->assertResponseIsSuccessful();
        $this->assertJsonContains([
            '@context' => '/api/contexts/BottleInventory',
            '@id' => '/api/bottles',
            '@type' => 'hydra:Collection',
            'hydra:member' => [
                [
                    '@type' => 'BottleInventory',
                    'name' => 'Caymus Vineyards Special Selection Cabernet Sauvignon',
                    'estateName' => 'Caymus Vineyards',
                    'year' => 2013,
                    'rate' => '++',
                    'picturePath' => 'caymus.jpg',
                ],
                [
                    '@type' => 'BottleInventory',
                    'name' => 'Château Latour',
                    'estateName' => 'Château Latour',
                    'year' => 2010,
                    'rate' => '++',
                    'picturePath' => 'chateau-latour.jpg',
                ],
            ],
            'hydra:totalItems' => 13,
        ]);
        $this->assertAttributeExistInEachElement('saveAt');
    }

    /**
     * @dataProvider provideCollectionFilter
     */
    public function testGetCollectionProviderFilter(
        string $uri,
        int $totalItems,
    ): void {
        $this->get($uri);

        $this->assertResponseIsSuccessful();
        $this->assertJsonContains([
            '@context' => '/api/contexts/BottleInventory',
            '@id' => '/api/bottles',
            '@type' => 'hydra:Collection',
            'hydra:totalItems' => $totalItems,
        ]);
    }

    public static function provideCollectionFilter(): \Generator
    {
        yield 'Filter by name' => [
            'uri' => '/api/bottles?name=Château',
            'totalItems' => 2,
        ];
        yield 'Filter by estate name' => [
            'uri' => '/api/bottles?estateName=Domaine de la',
            'totalItems' => 1,
        ];
        yield 'Filter by year' => [
            'uri' => '/api/bottles?year=2010',
            'totalItems' => 2,
        ];
        yield 'Filter by type' => [
            'uri' => '/api/bottles?type=red',
            'totalItems' => 11,
        ];
        yield 'Filter by rate' => [
            'uri' => '/api/bottles?rate=%2B%2B',
            'totalItems' => 5,
        ];
        yield 'Filter by saveAt' => [
            'uri' => '/api/bottles?savedAt=2021-03-19',
            'totalItems' => 0,
        ];
    }
}
