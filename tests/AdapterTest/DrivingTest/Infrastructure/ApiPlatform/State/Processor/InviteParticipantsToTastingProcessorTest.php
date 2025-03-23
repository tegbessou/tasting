<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Processor;

use EmpireDesAmis\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationCreatedMessage;
use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use PHPUnit\Framework\Attributes\DataProvider;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class InviteParticipantsToTastingProcessorTest extends ApiTestCase
{
    use InteractsWithMessenger;
    use RefreshDatabase;

    public function testInviteParticipantsToTasting(): void
    {
        $this->post('/api/tastings/964a3cb8-5fbd-4678-a5cd-e371c09ea722/invite', [
            'participants' => [
                'root@gmail.com',
            ],
        ]);

        $this->assertResponseStatusCodeSame(204);

        $this->transport('tasting')->queue()->assertContains(InvitationCreatedMessage::class, 1);
    }

    #[DataProvider('provideInvalidData')]
    public function testInviteParticipantToTastingWithInvalidData(
        string $uri,
        array $payload,
        int $statusCode,
        array $violations,
    ): void {
        $this->post($uri, $payload);
        $this->assertResponseStatusCodeSame($statusCode);

        if ($statusCode === 422) {
            $this->assertJsonContains([
                '@type' => 'ConstraintViolationList',
                'title' => 'An error occurred',
                'violations' => $violations,
            ]);
        }
    }

    public static function provideInvalidData(): \Generator
    {
        yield 'Not found tasting' => [
            'uri' => '/api/tastings/14403f0a-f593-4122-8786-80153f130039/invite',
            'payload' => [
                'participants' => [
                    'root@gmail.com',
                ],
            ],
            'statusCode' => 404,
            'violations' => [],
        ];

        yield 'Owner cannot be invited' => [
            'uri' => '/api/tastings/964a3cb8-5fbd-4678-a5cd-e371c09ea722/invite',
            'payload' => [
                'participants' => [
                    'hugues.gobet@gmail.com',
                ],
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'participants',
                    'message' => 'Le propriétaire ne peut pas être invité.',
                ],
            ],
        ];

        yield 'No participants' => [
            'uri' => '/api/tastings/964a3cb8-5fbd-4678-a5cd-e371c09ea722/invite',
            'payload' => [],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'participants',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
            ],
        ];
    }

    public function testInviteParticipantToTastingWithParticipantAlreadyInvited(): void
    {
        $this->post('/api/tastings/964a3cb8-5fbd-4678-a5cd-e371c09ea722/invite', [
            'participants' => [
                'root@gmail.com',
            ],
        ]);

        $this->assertResponseStatusCodeSame(204);

        $this->post('/api/tastings/964a3cb8-5fbd-4678-a5cd-e371c09ea722/invite', [
            'participants' => [
                'root@gmail.com',
            ],
        ]);

        $this->assertResponseStatusCodeSame(422);

        $this->assertJsonContains([
            '@type' => 'ConstraintViolationList',
            'title' => 'An error occurred',
            'violations' => [
                [
                    'propertyPath' => 'participants',
                    'message' => 'Le participant root@gmail.com est déjà invité.',
                ],
            ],
        ]);
    }
}
