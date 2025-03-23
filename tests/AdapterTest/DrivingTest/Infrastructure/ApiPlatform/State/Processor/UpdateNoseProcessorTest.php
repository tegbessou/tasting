<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\AdapterTest\DrivingTest\Infrastructure\ApiPlatform\State\Processor;

use EmpireDesAmis\Tasting\Domain\Repository\SheetRepositoryInterface;
use EmpireDesAmis\Tasting\Domain\ValueObject\SheetId;
use EmpireDesAmis\Tasting\Tests\Shared\ApiTestCase;
use EmpireDesAmis\Tasting\Tests\Shared\RefreshDatabase;
use PHPUnit\Framework\Attributes\DataProvider;

final class UpdateNoseProcessorTest extends ApiTestCase
{
    use RefreshDatabase;

    private SheetRepositoryInterface $sheetDoctrineRepository;

    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->sheetDoctrineRepository = $container->get(SheetRepositoryInterface::class);
    }

    public function testUpdateNose(): void
    {
        $this->post('/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/noses', [
            'impression' => 'douteux',
            'intensite' => 'ouvert',
            'arome' => 'minérales',
            'observation' => 'Observation',
        ]);

        $this->assertResponseStatusCodeSame(204);

        $this->put(
            '/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/noses',
            [
                'impression' => 'complexe',
                'intensite' => 'intime',
                'arome' => 'végétal',
                'observation' => 'Observation (modifié)',
            ],
        );

        $this->assertResponseStatusCodeSame(204);

        $sheet = $this->sheetDoctrineRepository->ofId(
            SheetId::fromString('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394'),
        );

        $this->assertNotNull($sheet->nose());
        $sheet = $this->sheetDoctrineRepository->ofId(
            SheetId::fromString('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394'),
        );

        $this->assertEquals('complexe', $sheet->nose()->impression()->value());
        $this->assertEquals('intime', $sheet->nose()->intensite()->value());
        $this->assertEquals('végétal', $sheet->nose()->arome()->value());
        $this->assertEquals('Observation (modifié)', $sheet->nose()->observation()->value());
    }

    #[DataProvider('provideInvalidData')]
    public function testUpdateNoseToSheetWithInvalidData(
        string $uri,
        array $payload,
        int $statusCode,
        array $violations,
    ): void {
        $this->post('/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/noses', [
            'impression' => 'douteux',
            'intensite' => 'ouvert',
            'arome' => 'minérales',
            'observation' => 'Observation',
        ]);

        $this->assertResponseStatusCodeSame(204);

        $this->sheetDoctrineRepository->ofId(
            SheetId::fromString('1a9ea2de-bb0b-4104-ab6a-8b57d2e65394'),
        );

        $this->put(
            $uri,
            $payload,
        );
        $this->assertResponseStatusCodeSame($statusCode);

        if ($statusCode === 422) {
            $this->assertJsonContains([
                '@type' => 'ConstraintViolation',
                'title' => 'An error occurred',
                'violations' => $violations,
            ]);
        }
    }

    public static function provideInvalidData(): \Generator
    {
        yield 'Not found sheet' => [
            'uri' => '/api/sheets/14403f0a-f593-4122-8786-80153f130039/noses',
            'payload' => [
                'impression' => 'douteux',
                'intensite' => 'ouvert',
                'arome' => 'minérales',
                'observation' => 'Observation',
            ],
            'statusCode' => 404,
            'violations' => [],
        ];

        yield 'Empty data' => [
            'uri' => '/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/noses',
            'payload' => [],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'impression',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
                [
                    'propertyPath' => 'intensite',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
                [
                    'propertyPath' => 'arome',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
                [
                    'propertyPath' => 'observation',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
            ],
        ];

        yield 'Bad data from participant, limpidite, brillance, intensiteCouleur, larme' => [
            'uri' => '/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/noses',
            'payload' => [
                'impression' => 'pedro',
                'intensite' => 'pedro',
                'arome' => 'pedro',
                'observation' => 'Observation',
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'impression',
                    'message' => 'Cette valeur doit être l\'un des choix proposés.',
                ],
                [
                    'propertyPath' => 'intensite',
                    'message' => 'Cette valeur doit être l\'un des choix proposés.',
                ],
                [
                    'propertyPath' => 'arome',
                    'message' => 'Cette valeur doit être l\'un des choix proposés.',
                ],
            ],
        ];
    }

    public function testUpdateNoseOnSheetWithoutAMouth(): void
    {
        $this->put(
            '/api/sheets/1a9ea2de-bb0b-4104-ab6a-8b57d2e65394/noses',
            [
                'impression' => 'complexe',
                'intensite' => 'intime',
                'arome' => 'végétal',
                'observation' => 'Observation (modifié)',
            ],
        );

        $this->assertResponseStatusCodeSame(422);
        $this->assertJsonContains([
            '@type' => 'ConstraintViolation',
            'title' => 'An error occurred',
            'violations' => [
                [
                    'message' => 'Un nez n\'a pas encore été ajouté pour cette fiche de dégustation.',
                ],
            ],
        ]);
    }
}
