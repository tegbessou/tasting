<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Provider;

use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;

final class GetInvitationCollectionProviderTest extends ApiTestCase
{
    public function testGetInvitationsByTarget(): void
    {
        $this->get('/api/invitations?target.id=root@gmail.com');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Invitation',
            '@id' => '/api/invitations',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Invitation',
                    '@id' => '/api/invitations/abed2f69-9aae-4d92-a91c-edfa7c985674',
                    'id' => 'abed2f69-9aae-4d92-a91c-edfa7c985674',
                    'tastingId' => '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
                    'fromId' => 'hugues.gobet@gmail.com',
                    'fromFullName' => 'Pedor',
                    'targetId' => 'root@gmail.com',
                    'targetFullName' => 'Pedor',
                    'link' => 'https://apps.apple.com/app/6468406309',
                ],
            ],
            'totalItems' => 1,
        ]);
    }
}
