<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use App\BottleInventory\Application\Command\TasteBottleCommand;
use App\BottleInventory\Domain\Exception\TasteBottleNotAuthorizeForThisUserException;
use App\BottleInventory\Infrastructure\ApiPlatform\Resource\BottleResource;
use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;

/**
 * @implements ProcessorInterface<BottleResource, void>
 */
final readonly class TasteBottleProcessor implements ProcessorInterface
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
                new TasteBottleCommand($data->id->__toString())
            );
        } catch (TasteBottleNotAuthorizeForThisUserException) {
            throw new AccessDeniedHttpException();
        }
    }
}
