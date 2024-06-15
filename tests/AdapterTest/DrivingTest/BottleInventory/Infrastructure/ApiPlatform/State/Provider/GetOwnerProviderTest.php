<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\BottleInventory\Infrastructure\ApiPlatform\State\Provider;

use App\Tests\Shared\ApiTestCase;

final class GetOwnerProviderTest extends ApiTestCase
{
    public function testGet(): void
    {
        $this->get('/api/owners/be6d32dc-2313-4dbf-8c66-6807d1335bbc');

        $this->assertResponseIsSuccessful();
        $this->assertJsonContains([
            '@context' => '/api/contexts/Owner',
        ]);
    }

    public function testGetNotFound(): void
    {
        $this->get('/api/owners/d7791659-8a66-421c-a87b-b562d863bdae');

        $this->assertResponseStatusCodeSame(404);
    }
}
