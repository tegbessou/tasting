<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\BottleInventory\Infrastructure\ApiPlatform\State\Processor;

use App\BottleInventory\Domain\Entity\Bottle;
use App\Tests\Shared\ApiTestCase;
use Doctrine\ORM\EntityManagerInterface;
use PHPUnit\Framework\Attributes\DataProvider;

final class CreateBottleProcessorTest extends ApiTestCase
{
    private EntityManagerInterface $entityManager;

    #[\Override]
    public function setUp(): void
    {
        static::bootKernel();

        $container = static::getContainer();
        $this->entityManager = $container->get(EntityManagerInterface::class);

        parent::setUp();
    }

    public function testCreateBottle(): void
    {
        $this->post('/api/bottles', [
            'name' => 'Pavillon Rouge du Château Margaux',
            'estateName' => 'Château Margaux',
            'year' => 1995,
            'grapeVarieties' => ['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
            'wineType' => 'red',
            'rate' => 'xs',
            'owner' => '/api/owners/be6d32dc-2313-4dbf-8c66-6807d1335bbc',
            'country' => 'France',
        ]);

        $this->assertResponseStatusCodeSame(204);

        $bottle = $this->entityManager->getRepository(Bottle::class)->findOneBy([
            'name.value' => 'Pavillon Rouge du Château Margaux',
        ]);
        $this->entityManager->remove($bottle);
        $this->entityManager->flush();
    }

    #[DataProvider('provideInvalidData')]
    public function testCreateBottleWithInvalidData(
        array $payload,
        int $statusCode,
        array $violations,
    ): void {
        $this->post('/api/bottles', $payload);
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
            'payload' => [],
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
                    'propertyPath' => 'wineType',
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
                    'propertyPath' => 'owner',
                    'message' => 'This value should not be blank.',
                    'code' => 'c1051bb4-d103-4f74-8988-acbcafc7fdc3',
                ],
            ],
        ];

        yield 'Bad wine type value' => [
            'payload' => [
                'name' => 'Pavillon Rouge du Château Margaux',
                'estateName' => 'Château Margaux',
                'year' => 1995,
                'grapeVarieties' => ['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
                'wineType' => 'yellow',
                'rate' => 'xs',
                'owner' => '/api/owners/be6d32dc-2313-4dbf-8c66-6807d1335bbc',
                'country' => 'France',
            ],
            'statusCode' => 400,
            'violations' => [],
        ];

        yield 'Bad rate value' => [
            'payload' => [
                'name' => 'Pavillon Rouge du Château Margaux',
                'estateName' => 'Château Margaux',
                'year' => 1995,
                'grapeVarieties' => ['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
                'wineType' => 'red',
                'rate' => 'top',
                'owner' => '/api/owners/be6d32dc-2313-4dbf-8c66-6807d1335bbc',
                'country' => 'France',
            ],
            'statusCode' => 400,
            'violations' => [],
        ];

        yield 'Owner doesn\'t exists' => [
            'payload' => [
                'name' => 'Pavillon Rouge du Château Margaux',
                'estateName' => 'Château Margaux',
                'year' => 1995,
                'grapeVarieties' => ['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
                'wineType' => 'red',
                'rate' => 'xs',
                'owner' => '/api/owners/d46b4522-b265-4e35-8f33-c95db871b7b8',
                'country' => 'France',
            ],
            'statusCode' => 404,
            'violations' => [],
        ];

        yield 'One grape varieties doesn\'t exist' => [
            'payload' => [
                'name' => 'Pavillon Rouge du Château Margaux',
                'estateName' => 'Château Margaux',
                'year' => 1995,
                'grapeVarieties' => ['Riesling', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
                'wineType' => 'red',
                'rate' => 'xs',
                'owner' => '/api/owners/be6d32dc-2313-4dbf-8c66-6807d1335bbc',
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
            'payload' => [
                'name' => 'Pavillon Rouge du Château Margaux',
                'estateName' => 'Château Margaux',
                'year' => 1995,
                'grapeVarieties' => ['Riesling', 'Négrette', 'Cabernet Franc', 'Petit Verdot'],
                'wineType' => 'red',
                'rate' => 'xs',
                'owner' => '/api/owners/be6d32dc-2313-4dbf-8c66-6807d1335bbc',
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
            'payload' => [
                'name' => 'Pavillon Rouge du Château Margaux',
                'estateName' => 'Château Margaux',
                'year' => 1995,
                'grapeVarieties' => ['Cabernet Sauvignon', 'Merlot', 'Cabernet Franc', 'Petit Verdot'],
                'wineType' => 'red',
                'rate' => 'xs',
                'owner' => '/api/owners/be6d32dc-2313-4dbf-8c66-6807d1335bbc',
                'country' => 'Italy',
            ],
            'statusCode' => 422,
            'violations' => [],
        ];
    }
}
