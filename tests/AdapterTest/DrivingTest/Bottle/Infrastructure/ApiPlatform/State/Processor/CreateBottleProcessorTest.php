<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Bottle\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Symfony\Bundle\Test\ApiTestCase;

final class CreateBottleProcessorTest extends ApiTestCase
{
    public function testCreateBottle(): void
    {
        static::createClient()->request('POST', '/api/bottles', [
            'headers' => [
                'Content-Type' => 'application/ld+json',
                'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
                'RequestHeaderIdentityProvider' => 'apple.com',
            ],
            'json' => [
                'name' => 'Pavillon Rouge du Château Margaux',
                'estateName' => 'Château Margaux',
                'year' => 1995,
                'grapeVarieties' => ['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
                'type' => 'red',
                'rate' => 'xs',
                'ownerId' => 'ee036f3b-d488-43be-b10c-fdbdcb0a6c0b',
                'country' => 'France',
            ],
        ]);

        $this->assertResponseStatusCodeSame(201);
    }

    /**
     * @dataProvider provideInvalidData
     */
    public function testCreateBottleWithInvalidData(
        array $data,
        int $statusCode,
        array $violations,
    ): void {
        static::createClient()->request('POST', '/api/bottles', [
            'headers' => [
                'Content-Type' => 'application/ld+json',
                'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
                'RequestHeaderIdentityProvider' => 'apple.com',
            ],
            'json' => $data,
        ]);

        $this->assertResponseStatusCodeSame($statusCode);

        if ($statusCode === 422) {
            $this->assertJsonContains([
                '@type' => 'ConstraintViolationList',
                'hydra:title' => 'An error occurred',
                'violations' => $violations,
            ]);
        }
    }

    public static function provideInvalidData(): \Generator
    {
        yield 'No data passed' => [
            'json' => [],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'name',
                    'message' => 'This value should not be blank.',
                    'code' => 'c1051bb4-d103-4f74-8988-acbcafc7fdc3',
                ],
                [
                    'propertyPath' => 'estateName',
                    'message' => 'This value should not be blank.',
                    'code' => 'c1051bb4-d103-4f74-8988-acbcafc7fdc3',
                ],
                [
                    'propertyPath' => 'type',
                    'message' => 'This value should not be blank.',
                    'code' => 'c1051bb4-d103-4f74-8988-acbcafc7fdc3',
                ],
                [
                    'propertyPath' => 'year',
                    'message' => 'This value should not be blank.',
                    'code' => 'c1051bb4-d103-4f74-8988-acbcafc7fdc3',
                ],
                [
                    'propertyPath' => 'grapeVarieties',
                    'message' => 'This value should not be blank.',
                    'code' => 'c1051bb4-d103-4f74-8988-acbcafc7fdc3',
                ],
                [
                    'propertyPath' => 'rate',
                    'message' => 'This value should not be blank.',
                    'code' => 'c1051bb4-d103-4f74-8988-acbcafc7fdc3',
                ],
                [
                    'propertyPath' => 'ownerId',
                    'message' => 'This value should not be blank.',
                    'code' => 'c1051bb4-d103-4f74-8988-acbcafc7fdc3',
                ],
            ],
        ];

        yield 'Bad wine type value' => [
            'json' => [
                'name' => 'Pavillon Rouge du Château Margaux',
                'estateName' => 'Château Margaux',
                'year' => 1995,
                'grapeVarieties' => ['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
                'type' => 'yellow',
                'rate' => 'xs',
                'ownerId' => 'ee036f3b-d488-43be-b10c-fdbdcb0a6c0b',
                'country' => 'France',
            ],
            'statusCode' => 400,
            'violations' => [],
        ];

        yield 'Bad rate value' => [
            'json' => [
                'name' => 'Pavillon Rouge du Château Margaux',
                'estateName' => 'Château Margaux',
                'year' => 1995,
                'grapeVarieties' => ['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
                'type' => 'red',
                'rate' => 'top',
                'ownerId' => 'ee036f3b-d488-43be-b10c-fdbdcb0a6c0b',
                'country' => 'France',
            ],
            'statusCode' => 400,
            'violations' => [],
        ];

        yield 'Owner doesn\'t exists' => [
            'json' => [
                'name' => 'Pavillon Rouge du Château Margaux',
                'estateName' => 'Château Margaux',
                'year' => 1995,
                'grapeVarieties' => ['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
                'type' => 'red',
                'rate' => 'xs',
                'ownerId' => 'd46b4522-b265-4e35-8f33-c95db871b7b8',
                'country' => 'France',
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'ownerId',
                    'message' => "Owner with id d46b4522-b265-4e35-8f33-c95db871b7b8 doesn't exist.",
                ],
            ],
        ];

        yield 'One grape varieties doesn\'t exist' => [
            'json' => [
                'name' => 'Pavillon Rouge du Château Margaux',
                'estateName' => 'Château Margaux',
                'year' => 1995,
                'grapeVarieties' => ['Riesling', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
                'type' => 'red',
                'rate' => 'xs',
                'ownerId' => 'ee036f3b-d488-43be-b10c-fdbdcb0a6c0b',
                'country' => 'France',
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'grapeVarieties',
                    'message' => "Grape variety with name Riesling doesn't exist.",
                ],
            ],
        ];

        yield 'Many grape varieties doesn\'t exist' => [
            'json' => [
                'name' => 'Pavillon Rouge du Château Margaux',
                'estateName' => 'Château Margaux',
                'year' => 1995,
                'grapeVarieties' => ['Riesling', 'Négrette', 'Cabernet Franc', 'Petit Verdot'],
                'type' => 'red',
                'rate' => 'xs',
                'ownerId' => 'ee036f3b-d488-43be-b10c-fdbdcb0a6c0b',
                'country' => 'France',
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'grapeVarieties',
                    'message' => "Grape varieties with name Riesling, Négrette don't exist.",
                ],
            ],
        ];

        yield 'Country doesn\'t exist' => [
            'json' => [
                'name' => 'Pavillon Rouge du Château Margaux',
                'estateName' => 'Château Margaux',
                'year' => 1995,
                'grapeVarieties' => ['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
                'type' => 'red',
                'rate' => 'xs',
                'ownerId' => 'ee036f3b-d488-43be-b10c-fdbdcb0a6c0b',
                'country' => 'Italy',
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'country',
                    'message' => "Country with name Italy doesn't exist.",
                ],
            ],
        ];
    }
}
