<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\MessageHandler;

use App\Tasting\Application\Event\TargetSetFullNameEvent;
use App\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\UserCreatedMessage;
use Monolog\Attribute\WithMonologChannel;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use Symfony\Contracts\EventDispatcher\EventDispatcherInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

#[AsMessageHandler]
#[WithMonologChannel('tasting')]
final readonly class UpdateInvitationTargetFullNameMessageHandler
{
    public function __construct(
        private EventDispatcherInterface $dispatcher,
    ) {
    }

    public function __invoke(UserCreatedMessage $createdMessage): void
    {
        Assert::email($createdMessage->email);
        Assert::maxLength($createdMessage->email, 255);
        Assert::string($createdMessage->fullName);
        Assert::maxLength($createdMessage->fullName, 255);

        $this->dispatcher->dispatch(new TargetSetFullNameEvent(
            $createdMessage->email,
            $createdMessage->fullName,
        ));
    }
}
