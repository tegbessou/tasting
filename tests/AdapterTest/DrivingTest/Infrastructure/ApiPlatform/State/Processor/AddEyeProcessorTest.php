<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Processor;

use EmpireDesAmis\Tasting\Domain\Repository\SheetRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use PHPUnit\Framework\Attributes\DataProvider;

final class AddEyeProcessorTest extends ApiTestCase
{
    use RefreshDatabase;

    private SheetRepositoryInterface $sheetDoctrineRepository;

    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->sheetDoctrineRepository = $container->get(SheetRepositoryInterface::class);
    }

    public function testAddEye(): void
    {
        $this->post('/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/eyes', [
            'limpidite' => 'floue',
            'brillance' => 'étincelante',
            'intensiteCouleur' => 'soutenue',
            'teinte' => 'pourpre',
            'larme' => 'épaisse',
            'observation' => 'Observation',
        ]);

        $this->assertResponseStatusCodeSame(204);

        $sheet = $this->sheetDoctrineRepository->ofId(
            SheetId::fromString('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394'),
        );

        $this->assertNotNull($sheet->eye());
    }

    #[DataProvider('provideInvalidData')]
    public function testAddEyeToTastingWithInvalidData(
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
            'uri' => '/api/tastings/14403f0a-f593-4122-8786-80153f130039/eyes',
            'payload' => [
                'limpidite' => 'floue',
                'brillance' => 'étincelante',
                'intensiteCouleur' => 'soutenue',
                'teinte' => 'pourpre',
                'larme' => 'épaisse',
                'observation' => 'Observation',
            ],
            'statusCode' => 404,
            'violations' => [],
        ];

        yield 'Empty data' => [
            'uri' => '/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/eyes',
            'payload' => [],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'limpidite',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
                [
                    'propertyPath' => 'brillance',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
                [
                    'propertyPath' => 'intensiteCouleur',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
                [
                    'propertyPath' => 'teinte',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
                [
                    'propertyPath' => 'larme',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
                [
                    'propertyPath' => 'observation',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
            ],
        ];

        yield 'Bad data for limpidite, brillance, intensiteCouleur, larme' => [
            'uri' => '/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/eyes',
            'payload' => [
                'limpidite' => 'pedro',
                'brillance' => 'pedro',
                'intensiteCouleur' => 'pedro',
                'teinte' => 'pourpre',
                'larme' => 'pedro',
                'observation' => 'Observation',
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'limpidite',
                    'message' => 'Cette valeur doit être l\'un des choix proposés.',
                ],
                [
                    'propertyPath' => 'brillance',
                    'message' => 'Cette valeur doit être l\'un des choix proposés.',
                ],
                [
                    'propertyPath' => 'intensiteCouleur',
                    'message' => 'Cette valeur doit être l\'un des choix proposés.',
                ],
                [
                    'propertyPath' => 'larme',
                    'message' => 'Cette valeur doit être l\'un des choix proposés.',
                ],
            ],
        ];

        yield 'Bad data for teinte, linked to bad wine type' => [
            'uri' => '/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/eyes',
            'payload' => [
                'limpidite' => 'floue',
                'brillance' => 'étincelante',
                'intensiteCouleur' => 'soutenue',
                'teinte' => 'vert',
                'larme' => 'épaisse',
                'observation' => 'Observation',
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'teinte',
                    'message' => 'La teinte vert n\'est pas valide pour un vin red.',
                ],
            ],
        ];
    }

    public function testAddEyeOnSheetWithAlreadyAnEye(): void
    {
        $this->post('/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/eyes', [
            'limpidite' => 'floue',
            'brillance' => 'étincelante',
            'intensiteCouleur' => 'soutenue',
            'teinte' => 'pourpre',
            'larme' => 'épaisse',
            'observation' => 'Observation',
        ]);

        $this->assertResponseStatusCodeSame(204);

        $this->post('/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/eyes', [
            'limpidite' => 'floue',
            'brillance' => 'étincelante',
            'intensiteCouleur' => 'soutenue',
            'teinte' => 'pourpre',
            'larme' => 'épaisse',
            'observation' => 'Observation',
        ]);

        $this->assertResponseStatusCodeSame(422);
        $this->assertJsonContains([
            '@type' => 'ConstraintViolationList',
            'title' => 'An error occurred',
            'violations' => [
                [
                    'message' => 'Un oeil a déja été ajouté pour cette fiche de dégustation.',
                ],
            ],
        ]);
    }
}
