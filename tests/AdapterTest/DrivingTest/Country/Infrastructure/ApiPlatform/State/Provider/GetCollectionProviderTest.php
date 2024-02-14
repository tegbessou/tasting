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

    public function testGetCollectionFilterByName(): void
    {
        $this->get('/api/countries?name=France');

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
            'hydra:totalItems' => 1,
        ]);
    }
}
