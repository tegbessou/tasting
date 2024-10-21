<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Provider;

use Shared\ApiTestCase;

final class GetInvitationCollectionProviderTest extends ApiTestCase
{
    public function testGetInvitationsByTarget(): void
    {
        $this->get('/api/invitations?target.email=root@gmail.com');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Invitation',
            '@id' => '/api/invitations',
            '@type' => 'hydra:Collection',
            'hydra:member' => [
                [
                    '@type' => 'Invitation',
                    '@id' => '/api/invitations/abed2f69-9aae-4d92-a91c-edfa7c985674',
                    'subject' => [
                        '@id' => '/api/tastings/2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
                        'bottleName' => 'Domaine Leflaive Montrachet Grand Cru 2016',
                        'owner' => [
                            '@id' => '/api/owner_tastings/9964e539-05ff-4611-b39c-ffd6d108b8b7',
                            'fullName' => 'Hugues Gobet',
                        ],
                    ],
                    'target' => [
                        'fullName' => 'Root',
                    ],
                ],
            ],
            'hydra:totalItems' => 1,
        ]);
    }
}
