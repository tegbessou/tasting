<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use App\Bottle\Application\Command\DeleteBottleCommand;
use App\Bottle\Domain\Exception\DeleteBottleNotAuthorizeForThisUserException;
use App\Bottle\Infrastructure\ApiPlatform\Resource\BottleResource;
use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;

/**
 * @implements ProcessorInterface<BottleResource, void>
 */
final readonly class DeleteBottleProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::isInstanceOf($data, BottleResource::class);
        Assert::notNull($data->id);

        try {
            $this->commandBus->dispatch(
                new DeleteBottleCommand($data->id->__toString())
            );
        } catch (DeleteBottleNotAuthorizeForThisUserException) {
            throw new AccessDeniedHttpException();
        }
    }
}
