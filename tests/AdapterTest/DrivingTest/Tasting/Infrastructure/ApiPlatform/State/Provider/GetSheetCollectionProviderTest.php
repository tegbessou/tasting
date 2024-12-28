<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Provider;

use Shared\ApiTestCase;

final class GetSheetCollectionProviderTest extends ApiTestCase
{
    public function testGetSheetByTastingId(): void
    {
        $this->get('/api/sheets?tastingId=2ea56c35-8bb9-4c6e-9a49-bd79c5f11537');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Sheet',
            '@id' => '/api/sheets',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Sheet',
                    '@id' => '/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394',
                    'id' => '1a9ea2de-bb0b-4104-ab6a-8b57d2e65394',
                    'tastingId' => '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
                    'participantId' => 'hugues.gobet@gmail.com',
                    'participantFullName' => 'Pedor',
                ],
            ],
            'totalItems' => 1,
        ]);
    }

    public function testGetSheetByParticipant(): void
    {
        $this->get('/api/sheets?participant=hugues.gobet@gmail.com');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Sheet',
            '@id' => '/api/sheets',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Sheet',
                    '@id' => '/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394',
                    'id' => '1a9ea2de-bb0b-4104-ab6a-8b57d2e65394',
                    'tastingId' => '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
                    'participantId' => 'hugues.gobet@gmail.com',
                    'participantFullName' => 'Pedor',
                ],
                [
                    '@type' => 'Sheet',
                    '@id' => '/api/sheets/53fdb99f-b379-4d28-a1c8-541df07a7c34',
                    'id' => '53fdb99f-b379-4d28-a1c8-541df07a7c34',
                    'tastingId' => '964a3cb8-5fbd-4678-a5cd-e371c09ea722',
                    'participantId' => 'hugues.gobet@gmail.com',
                    'participantFullName' => 'Pedor',
                ],
            ],
            'totalItems' => 2,
        ]);
    }

    public function testGetSheetByTastingAndByParticipant(): void
    {
        $this->get('/api/sheets?tastingId=964a3cb8-5fbd-4678-a5cd-e371c09ea722&participant=hugues.gobet@gmail.com');

        $this->assertResponseStatusCodeSame(200);
        $this->assertJsonContains([
            '@context' => '/api/contexts/Sheet',
            '@id' => '/api/sheets',
            '@type' => 'Collection',
            'member' => [
                [
                    '@type' => 'Sheet',
                    '@id' => '/api/sheets/53fdb99f-b379-4d28-a1c8-541df07a7c34',
                    'id' => '53fdb99f-b379-4d28-a1c8-541df07a7c34',
                    'tastingId' => '964a3cb8-5fbd-4678-a5cd-e371c09ea722',
                    'participantId' => 'hugues.gobet@gmail.com',
                    'participantFullName' => 'Pedor',
                    'eyeLimpidite' => 'opalescente',
                    'eyeBrillance' => 'lumineuse',
                    'eyeIntensiteCouleur' => 'intense',
                    'eyeTeinte' => 'ambre',
                    'eyeLarme' => 'fluide',
                    'eyeObservation' => 'Observation',
                ],
            ],
            'totalItems' => 1,
        ]);
    }
}
