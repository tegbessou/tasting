<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\Bottle\Infrastructure\ApiPlatform\State\Processor;

use App\Bottle\Domain\ValueObject\BottleCountry;
use App\Bottle\Domain\ValueObject\BottleEstateName;
use App\Bottle\Domain\ValueObject\BottleGrapeVarieties;
use App\Bottle\Domain\ValueObject\BottleId;
use App\Bottle\Domain\ValueObject\BottleName;
use App\Bottle\Domain\ValueObject\BottlePrice;
use App\Bottle\Domain\ValueObject\BottleRate;
use App\Bottle\Domain\ValueObject\BottleWineType;
use App\Bottle\Domain\ValueObject\BottleYear;
use App\Bottle\Infrastructure\Doctrine\Repository\BottleWriteDoctrineRepository;
use App\Tests\Shared\ApiTestCase;

final class PatchBottleProcessorTest extends ApiTestCase
{
    private BottleWriteDoctrineRepository $doctrineWriteBottleRepository;

    #[\Override]
    public function setUp(): void
    {
        static::bootKernel();

        $container = static::getContainer();
        $this->doctrineWriteBottleRepository = $container->get(BottleWriteDoctrineRepository::class);

        parent::setUp();
    }

    public function testUpdateBottle(): void
    {
        $this->patch('/api/bottles/7bd55df3-e53c-410b-83a4-8e5ed9bcd50d', [
            'name' => 'Grange',
            'estateName' => 'Penfolds',
            'year' => 2018,
            'grapeVarieties' => ['Syrah'],
            'type' => 'red',
            'rate' => 'xs',
            'country' => 'France',
            'price' => 620.00,
        ]);

        $this->assertResponseStatusCodeSame(204);

        $bottle = $this->doctrineWriteBottleRepository->ofId(
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
        );

        $bottle->update(
            BottleName::fromString('Château Margaux'),
            BottleEstateName::fromString('Château Margaux'),
            BottleWineType::fromString('red'),
            BottleYear::fromInt(2015),
            BottleGrapeVarieties::fromArray(['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot']),
            BottleRate::fromString('++'),
            BottleCountry::fromString('France'),
            BottlePrice::fromFloat(1099.99),
        );
        $this->doctrineWriteBottleRepository->update($bottle);
    }

    public function testUpdateOwnerIdWithoutEffect(): void
    {
        $this->patch('/api/bottles/7bd55df3-e53c-410b-83a4-8e5ed9bcd50d', [
            'ownerId' => '05e8984e-45cd-44d4-8d42-f5c4e6bd6192',
        ]);

        $this->assertResponseStatusCodeSame(204);

        $bottle = $this->doctrineWriteBottleRepository->ofId(
            BottleId::fromString('7bd55df3-e53c-410b-83a4-8e5ed9bcd50d'),
        );

        $this->assertEquals(
            'ee036f3b-d488-43be-b10c-fdbdcb0a6c0b',
            $bottle->ownerId()->id(),
        );
    }

    /**
     * @dataProvider provideInvalidData
     */
    public function testUpdateBottleWithInvalidData(
        string $id,
        array $payload,
        int $statusCode,
        array $violations,
    ): void {
        $this->patch(
            sprintf('/api/bottles/%s', $id),
            $payload,
        );

        $this->assertResponseStatusCodeSame($statusCode);

        if ($statusCode === 422) {
            $this->assertJsonContains([
                'violations' => $violations,
            ]);
        }
    }

    public static function provideInvalidData(): \Generator
    {
        yield 'Not found bottle' => [
            'id' => '430e1ce0-f5a6-4503-bb44-3b3bcc6a9e1c',
            'payload' => [
                'name' => 'Grange',
                'estateName' => 'Penfolds',
                'year' => 2018,
                'grapeVarieties' => ['Syrah'],
                'type' => 'red',
                'rate' => 'xs',
                'country' => 'France',
                'price' => 620.00,
            ],
            'statusCode' => 404,
            'violations' => [],
        ];

        yield 'Bottle not owned by user which try to update it' => [
            'id' => '97102d4c-da46-4105-8c34-53f5a2e1e9fa',
            'payload' => [
                'name' => 'Grange',
                'estateName' => 'Penfolds',
                'year' => 2018,
                'grapeVarieties' => ['Syrah'],
                'type' => 'red',
                'rate' => 'xs',
                'country' => 'France',
                'price' => 620.00,
            ],
            'statusCode' => 403,
            'violations' => [],
        ];

        yield 'Bottle update without data' => [
            'id' => '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'payload' => [
                'name' => null,
                'estateName' => null,
                'type' => null,
                'year' => null,
                'grapeVarieties' => null,
                'rate' => null,
            ],
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
            ],
        ];

        yield 'Bad wine type value' => [
            'id' => '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'payload' => [
                'type' => 'yellow',
            ],
            'statusCode' => 400,
            'violations' => [],
        ];

        yield 'Bad rate value' => [
            'id' => '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'payload' => [
                'rate' => 'top',
            ],
            'statusCode' => 400,
            'violations' => [],
        ];

        yield 'One grape varieties doesn\'t exist' => [
            'id' => '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'payload' => [
                'grapeVarieties' => ['Riesling', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
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
            'id' => '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'payload' => [
                'grapeVarieties' => ['Riesling', 'Négrette', 'Cabernet Franc', 'Petit Verdot'],
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
            'id' => '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
            'payload' => [
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
