<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\Country\Infrastructure\ApiPlatform\State\Provider;

use ApiPlatform\Symfony\Bundle\Test\ApiTestCase;

final class GetCollectionProviderTest extends ApiTestCase
{
    public function testGetCollection(): void
    {
        $client = static::createClient();

        $client->request('GET', '/api/countries', [
            'headers' => [
                'Content-Type' => 'application/ld+json',
                'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
                'RequestHeaderIdentityProvider' => 'apple.com',
            ],
        ]);

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
        $client = static::createClient();

        $client->request('GET', '/api/countries?name=France', [
            'headers' => [
                'Content-Type' => 'application/ld+json',
                'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
                'RequestHeaderIdentityProvider' => 'apple.com',
            ],
        ]);

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
