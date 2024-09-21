<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Tasting\Infrastructure\Symfony\Messenger;

use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\ValueObject\ParticipantEmail;
use App\Tasting\Infrastructure\Doctrine\Repository\ParticipantDoctrineRepository;
use App\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\UserCreatedMessage;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class CreateParticipantMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;

    private ParticipantDoctrineRepository $participantRepository;

    #[\Override]
    public function setUp(): void
    {
        static::bootKernel();

        $container = static::getContainer();
        $this->participantRepository = $container->get(ParticipantDoctrineRepository::class);

        parent::setUp();
    }

    public function testCreateParticipant(): void
    {
        $this->bus('event.bus')->dispatch(new UserCreatedMessage(
            'new@gmail.com',
            'Hugues Gobet',
        ));

        $this->transport('tasting_from_external')->queue()->assertContains(UserCreatedMessage::class, 1);
        $this->transport('tasting_from_external')->process(1);
        $this->transport('tasting_from_external')->queue()->assertContains(UserCreatedMessage::class, 0);

        /** @var Participant $participant */
        $participant = $this->participantRepository->ofEmail(
            ParticipantEmail::fromString('new@gmail.com'),
        );

        $this->assertNotNull($participant);
        $this->assertEquals('Hugues Gobet', $participant->fullName()->value());
    }

    public function testCreateOwnerDoesntExistInSecurity(): void
    {
        $this->bus('event.bus')->dispatch(new UserCreatedMessage(
            'non_exist@gmail.com',
            'Hugues Gobet',
        ));

        $this->transport('tasting_from_external')->queue()->assertContains(UserCreatedMessage::class, 1);
        $this->transport('tasting_from_external')->process(1);
        $this->transport('tasting_from_external')->queue()->assertContains(UserCreatedMessage::class, 0);

        /** @var Participant $participant */
        $participant = $this->participantRepository->ofEmail(
            ParticipantEmail::fromString('non_exist@gmail.com'),
        );

        $this->assertNull($participant);
    }

    public function testCreateOwnerAlreadyExist(): void
    {
        $this->bus('event.bus')->dispatch(new UserCreatedMessage(
            'hugues.gobet@gmail.com',
            'Hugues Gobet',
        ));

        $this->transport('tasting_from_external')->queue()->assertContains(UserCreatedMessage::class, 1);
        $this->transport('tasting_from_external')->process(1);
        $this->transport('tasting_from_external')->queue()->assertContains(UserCreatedMessage::class, 0);
    }
}
