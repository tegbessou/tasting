<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\ApiPlatform\State\Processor;

use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Domain\ValueObject\ParticipantId;
use App\Tasting\Domain\ValueObject\TastingId;
use App\Tasting\Infrastructure\Doctrine\Repository\InvitationDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\ParticipantDoctrineRepository;
use App\Tasting\Infrastructure\Doctrine\Repository\TastingDoctrineRepository;
use App\Tasting\Infrastructure\Symfony\Messenger\Message\InvitationCreatedMessage;
use App\Tests\Shared\ApiTestCase;
use Doctrine\ORM\EntityManagerInterface;
use PHPUnit\Framework\Attributes\DataProvider;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class InviteParticipantsToTastingProcessorTest extends ApiTestCase
{
    use InteractsWithMessenger;

    private InvitationDoctrineRepository $invitationDoctrineRepository;
    private EntityManagerInterface $entityManager;
    private ParticipantDoctrineRepository $participantDoctrineRepository;
    private TastingDoctrineRepository $tastingDoctrineRepository;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();
        $container = self::getContainer();
        $this->invitationDoctrineRepository = $container->get(InvitationDoctrineRepository::class);
        $this->entityManager = $container->get(EntityManagerInterface::class);
        $this->participantDoctrineRepository = $container->get(ParticipantDoctrineRepository::class);
        $this->tastingDoctrineRepository = $container->get(TastingDoctrineRepository::class);
    }

    public function testInviteParticipantsToTasting(): void
    {
        $this->post('/api/tastings/964a3cb8-5fbd-4678-a5cd-e371c09ea722/invite', [
            'participants' => [
                'root@gmail.com',
            ],
        ]);

        $this->assertResponseStatusCodeSame(204);

        $this->transport('tasting')->queue()->assertContains(InvitationCreatedMessage::class, 1);

        $invitations = $this->invitationDoctrineRepository->withParticipantAndTasting(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            TastingId::fromString('964a3cb8-5fbd-4678-a5cd-e371c09ea722'),
        )->getIterator();

        $this->assertNotNull($invitations->current());

        $this->assertEquals(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            $invitations->current()->target()->id(),
        );

        foreach ($invitations as $invitation) {
            $this->entityManager->remove($invitation);
        }

        $this->entityManager->flush();
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
                'hydra:title' => 'An error occurred',
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

    // Rajouter un cas pour un invité qui a déjà accepté l'invitation
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
            'hydra:title' => 'An error occurred',
            'violations' => [
                [
                    'propertyPath' => 'participants',
                    'message' => 'Les participants Root sont déjà invités.',
                ],
            ],
        ]);

        $invitations = $this->invitationDoctrineRepository->withParticipantAndTasting(
            ParticipantId::fromString('c9350812-3f30-4fa4-8580-295ca65a4451'),
            TastingId::fromString('964a3cb8-5fbd-4678-a5cd-e371c09ea722'),
        )->getIterator();

        foreach ($invitations as $invitation) {
            $this->entityManager->remove($invitation);
        }

        $this->entityManager->flush();
    }

    public function testInviteParticipantToTastingWithParticipantNotExistInDatabase(): void
    {
        $this->post('/api/tastings/964a3cb8-5fbd-4678-a5cd-e371c09ea722/invite', [
            'participants' => [
                'stephanie.saintmarcel@gmail.com',
            ],
        ]);

        $this->assertResponseStatusCodeSame(204);

        $participant = $this->participantDoctrineRepository->ofEmail(
            ParticipantEmail::fromString('stephanie.saintmarcel@gmail.com'),
        );

        $this->assertNotNull($participant);
        $this->assertNull($participant->fullName()->value());
    }
}
