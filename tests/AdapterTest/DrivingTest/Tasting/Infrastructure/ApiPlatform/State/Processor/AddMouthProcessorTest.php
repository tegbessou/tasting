<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Processor;

use App\Tasting\Domain\Repository\SheetRepositoryInterface;
use App\Tasting\Domain\ValueObject\SheetId;
use PHPUnit\Framework\Attributes\DataProvider;
use Shared\ApiTestCase;
use Shared\RefreshDatabase;

final class AddMouthProcessorTest extends ApiTestCase
{
    use RefreshDatabase;

    private SheetRepositoryInterface $sheetDoctrineRepository;

    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->sheetDoctrineRepository = $container->get(SheetRepositoryInterface::class);
    }

    public function testAddMouthWithRedWine(): void
    {
        $this->post('/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/mouths', [
            'alcool' => 'alcooleux',
            'acide' => 'nerveuse',
            'matiere' => 'massive',
            'finale' => 'courte',
            'tanin' => 'fade',
            'observation' => 'Observation',
        ]);

        $this->assertResponseStatusCodeSame(204);

        $sheet = $this->sheetDoctrineRepository->ofId(
            SheetId::fromString('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394'),
        );

        $this->assertNotNull($sheet->mouth());
    }

    public function testAddMouthWithWhiteWine(): void
    {
        $this->post('/api/sheets/7d4adf54-7ab5-4385-a4c6-c2c82b669a9f/mouths', [
            'alcool' => 'alcooleux',
            'acide' => 'nerveuse',
            'matiere' => 'massive',
            'finale' => 'courte',
            'sucre' => 'liquoreux',
            'observation' => 'Observation',
        ]);

        $this->assertResponseStatusCodeSame(204);

        $sheet = $this->sheetDoctrineRepository->ofId(
            SheetId::fromString('7d4adf54-7ab5-4385-a4c6-c2c82b669a9f'),
        );

        $this->assertNotNull($sheet->mouth());
    }

    #[DataProvider('provideInvalidData')]
    public function testAddMouthToTastingWithInvalidData(
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
        yield 'Not found sheet' => [
            'uri' => '/api/tastings/14403f0a-f593-4122-8786-80153f130039/mouths',
            'payload' => [
                'alcool' => 'alcooleux',
                'acide' => 'nerveuse',
                'matiere' => 'massive',
                'finale' => 'courte',
                'tanin' => 'fade',
                'observation' => 'Observation',
            ],
            'statusCode' => 404,
            'violations' => [],
        ];

        yield 'Empty data' => [
            'uri' => '/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/mouths',
            'payload' => [],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'alcool',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
                [
                    'propertyPath' => 'acide',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
                [
                    'propertyPath' => 'matiere',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
                [
                    'propertyPath' => 'finale',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
                [
                    'propertyPath' => 'observation',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
            ],
        ];

        yield 'Bad data for alcool, acide, matiere, finale' => [
            'uri' => '/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/mouths',
            'payload' => [
                'alcool' => 'pedro',
                'acide' => 'pedro',
                'matiere' => 'pedro',
                'finale' => 'pedro',
                'tanin' => 'fade',
                'observation' => 'Observation',
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'alcool',
                    'message' => 'Cette valeur doit être l\'un des choix proposés.',
                ],
                [
                    'propertyPath' => 'acide',
                    'message' => 'Cette valeur doit être l\'un des choix proposés.',
                ],
                [
                    'propertyPath' => 'matiere',
                    'message' => 'Cette valeur doit être l\'un des choix proposés.',
                ],
                [
                    'propertyPath' => 'finale',
                    'message' => 'Cette valeur doit être l\'un des choix proposés.',
                ],
            ],
        ];

        yield 'Bad data red wine without tanin' => [
            'uri' => '/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/mouths',
            'payload' => [
                'alcool' => 'alcooleux',
                'acide' => 'nerveuse',
                'matiere' => 'massive',
                'finale' => 'courte',
                'observation' => 'Observation',
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'tanin',
                    'message' => 'Le tanin doit être spécifié pour un vin rouge.',
                ],
            ],
        ];

        yield 'Bad data not red wine with tanin' => [
            'uri' => '/api/sheets/7d4adf54-7ab5-4385-a4c6-c2c82b669a9f/mouths',
            'payload' => [
                'alcool' => 'alcooleux',
                'acide' => 'nerveuse',
                'matiere' => 'massive',
                'finale' => 'courte',
                'observation' => 'Observation',
                'sucre' => 'liquoreux',
                'tanin' => 'fade',
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'tanin',
                    'message' => 'Le tanin ne doit pas être spécifié pour un vin qui n\'est pas rouge.',
                ],
            ],
        ];

        yield 'Bad data sucre not specify for sweet wine' => [
            'uri' => '/api/sheets/7d4adf54-7ab5-4385-a4c6-c2c82b669a9f/mouths',
            'payload' => [
                'alcool' => 'alcooleux',
                'acide' => 'nerveuse',
                'matiere' => 'massive',
                'finale' => 'courte',
                'observation' => 'Observation',
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'sucre',
                    'message' => 'Le sucre doit être spécifié pour un vin moelleux.',
                ],
            ],
        ];

        yield 'Bad data not sweet wine with sucre' => [
            'uri' => '/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/mouths',
            'payload' => [
                'alcool' => 'alcooleux',
                'acide' => 'nerveuse',
                'matiere' => 'massive',
                'finale' => 'courte',
                'observation' => 'Observation',
                'sucre' => 'liquoreux',
                'tanin' => 'fade',
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'sucre',
                    'message' => 'Le sucre ne doit pas être spécifié pour un vin qui n\'est pas moelleux.',
                ],
            ],
        ];
    }
}
