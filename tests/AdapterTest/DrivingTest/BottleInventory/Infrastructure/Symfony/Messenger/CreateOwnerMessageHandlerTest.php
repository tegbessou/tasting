<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\BottleInventory\Infrastructure\Symfony\Messenger;

use App\BottleInventory\Domain\Entity\Owner;
use App\BottleInventory\Domain\Repository\OwnerRepositoryInterface;
use App\BottleInventory\Domain\ValueObject\OwnerEmail;
use App\BottleInventory\Infrastructure\Symfony\Messenger\ExternalMessage\UserCreatedMessage;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Zenstruck\Messenger\Test\InteractsWithMessenger;

final class CreateOwnerMessageHandlerTest extends KernelTestCase
{
    use InteractsWithMessenger;

    private OwnerRepositoryInterface $ownerRepository;

    #[\Override]
    public function setUp(): void
    {
        static::bootKernel();

        $container = static::getContainer();
        $this->ownerRepository = $container->get(OwnerRepositoryInterface::class);

        parent::setUp();
    }

    public function testCreateOwner(): void
    {
        $this->bus('event.bus')->dispatch(new UserCreatedMessage(
            'new@gmail.com',
            'Hugues Gobet',
        ));

        $this->transport('bottle_inventory')->queue()->assertContains(UserCreatedMessage::class, 1);
        $this->transport('bottle_inventory')->process(1);
        $this->transport('bottle_inventory')->queue()->assertContains(UserCreatedMessage::class, 0);

        /** @var Owner $owner */
        $owner = $this->ownerRepository->ofEmail(
            OwnerEmail::fromString('new@gmail.com'),
        );

        $this->assertNotNull($owner);
        $this->assertEquals('new@gmail.com', $owner->email()->value());
        $this->assertEquals('Hugues Gobet', $owner->fullName()->value());
    }

    public function testCreateOwnerDoesntExistInSecurity(): void
    {
        $this->bus('event.bus')->dispatch(new UserCreatedMessage(
            'non_exist@gmail.com',
            'Hugues Gobet',
        ));

        $this->transport('bottle_inventory')->queue()->assertContains(UserCreatedMessage::class, 1);
        $this->transport('bottle_inventory')->process(1);
        $this->transport('bottle_inventory')->queue()->assertContains(UserCreatedMessage::class, 0);

        /** @var Owner $owner */
        $owner = $this->ownerRepository->ofEmail(
            OwnerEmail::fromString('non_exist@gmail.com'),
        );

        $this->assertNull($owner);
    }

    public function testCreateOwnerAlreadyExist(): void
    {
        $this->bus('event.bus')->dispatch(new UserCreatedMessage(
            'hugues.gobet@gmail.com',
            'Hugues Gobet',
        ));

        $this->transport('bottle_inventory')->queue()->assertContains(UserCreatedMessage::class, 1);
        $this->transport('bottle_inventory')->process(1);
        $this->transport('bottle_inventory')->queue()->assertContains(UserCreatedMessage::class, 0);
    }
}
