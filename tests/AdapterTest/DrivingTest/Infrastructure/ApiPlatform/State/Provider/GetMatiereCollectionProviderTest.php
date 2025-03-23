<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Provider;

use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;

final class GetMatiereCollectionProviderTest extends ApiTestCase
{
    public function testGetMatieres(): void
    {
        $this->get('/api/matieres');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Matiere',
            '@id' => '/api/matieres',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Matiere',
                    'value' => 'massive',
                ],
                [
                    '@type' => 'Matiere',
                    'value' => 'corpulante',
                ],
                [
                    '@type' => 'Matiere',
                    'value' => 'étoffée',
                ],
                [
                    '@type' => 'Matiere',
                    'value' => 'légère',
                ],
                [
                    '@type' => 'Matiere',
                    'value' => 'fluette',
                ],
            ],
            'totalItems' => 5,
        ]);
    }
}
