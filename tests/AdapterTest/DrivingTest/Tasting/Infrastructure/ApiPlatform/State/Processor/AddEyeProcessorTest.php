<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Processor;

use App\Tasting\Domain\Repository\TastingRepositoryInterface;
use App\Tasting\Domain\ValueObject\TastingId;
use PHPUnit\Framework\Attributes\DataProvider;
use Shared\ApiTestCase;
use Shared\RefreshDatabase;

final class AddEyeProcessorTest extends ApiTestCase
{
    use RefreshDatabase;

    private TastingRepositoryInterface $tastingDoctrineRepository;

    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->tastingDoctrineRepository = $container->get(TastingRepositoryInterface::class);
    }

    public function testAddEye(): void
    {
        $this->post('/api/tastings/2ea56c35-8bb9-4c6e-9a49-bd79c5f11537/eyes', [
            'participant' => 'hugues.gobet@gmail.com',
            'limpidite' => 'floue',
            'brillance' => 'étincelante',
            'intensiteCouleur' => 'soutenue',
            'teinte' => 'pourpre',
            'larme' => 'épaisse',
            'observation' => 'Observation',
        ]);

        $this->assertResponseStatusCodeSame(204);

        $tasting = $this->tastingDoctrineRepository->ofId(
            TastingId::fromString('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537'),
        );

        $this->assertCount(1, $tasting->eyes()->values());
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
        yield 'Not found tasting' => [
            'uri' => '/api/tastings/14403f0a-f593-4122-8786-80153f130039/eyes',
            'payload' => [
                'participant' => 'hugues.gobet@gmail.com',
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
            'uri' => '/api/tastings/964a3cb8-5fbd-4678-a5cd-e371c09ea722/eyes',
            'payload' => [],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'participant',
                    'message' => 'Cette valeur ne doit pas être vide.',
                ],
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

        yield 'Bad data from participant, limpidite, brillance, intensiteCouleur, larme' => [
            'uri' => '/api/tastings/964a3cb8-5fbd-4678-a5cd-e371c09ea722/eyes',
            'payload' => [
                'participant' => 'not_valid',
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
                    'propertyPath' => 'participant',
                    'message' => 'Cette valeur n\'est pas une adresse email valide.',
                ],
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

        yield 'Bad data participant not invited' => [
            'uri' => '/api/tastings/964a3cb8-5fbd-4678-a5cd-e371c09ea722/eyes',
            'payload' => [
                'participant' => 'not_invited@gmail.com',
                'limpidite' => 'floue',
                'brillance' => 'étincelante',
                'intensiteCouleur' => 'soutenue',
                'teinte' => 'pourpre',
                'larme' => 'épaisse',
                'observation' => 'Observation',
            ],
            'statusCode' => 422,
            'violations' => [
                [
                    'propertyPath' => 'participant',
                    'message' => 'Le participant not_invited@gmail.com n\'est pas invité.',
                ],
            ],
        ];

        yield 'Bad data for teinte, linked to bad wine type' => [
            'uri' => '/api/tastings/964a3cb8-5fbd-4678-a5cd-e371c09ea722/eyes',
            'payload' => [
                'participant' => 'hugues.gobet@gmail.com',
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

    // tester en dehors le déjà ajouté
    public function testAddEyeAlreadyInvited(): void
    {
        $this->post('/api/tastings/2ea56c35-8bb9-4c6e-9a49-bd79c5f11537/eyes', [
            'participant' => 'hugues.gobet@gmail.com',
            'limpidite' => 'floue',
            'brillance' => 'étincelante',
            'intensiteCouleur' => 'soutenue',
            'teinte' => 'pourpre',
            'larme' => 'épaisse',
            'observation' => 'Observation',
        ]);

        $this->assertResponseStatusCodeSame(204);

        $this->post('/api/tastings/2ea56c35-8bb9-4c6e-9a49-bd79c5f11537/eyes', [
            'participant' => 'hugues.gobet@gmail.com',
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
                    'propertyPath' => 'participant',
                    'message' => 'Le participant hugues.gobet@gmail.com a déjà ajouté son oeil à la dégustation 2ea56c35-8bb9-4c6e-9a49-bd79c5f11537.',
                ],
            ],
        ]);
    }
}
