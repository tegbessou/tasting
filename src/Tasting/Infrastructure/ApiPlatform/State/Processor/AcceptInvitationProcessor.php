<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use App\Tasting\Application\Command\AcceptInvitationCommand;
use App\Tasting\Infrastructure\ApiPlatform\Resource\InvitationResource;

/**
 * @implements ProcessorInterface<InvitationResource, void>
 */
final readonly class AcceptInvitationProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::notNull($data->id);
        Assert::isInstanceOf($data, InvitationResource::class);

        $this->commandBus->dispatch(
            new AcceptInvitationCommand(
                $data->id->__toString(),
            ),
        );
    }
}
