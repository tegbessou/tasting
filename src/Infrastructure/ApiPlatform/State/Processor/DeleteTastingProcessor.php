<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use EmpireDesAmis\Tasting\Application\Command\DeleteTastingCommand;
use EmpireDesAmis\Tasting\Domain\Exception\TastingDoesntExistException;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\DeleteTastingResource;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

/**
 * @implements ProcessorInterface<DeleteTastingResource, void>
 */
final readonly class DeleteTastingProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private LoggerInterface $logger,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::uuid($uriVariables['id']);

        try {
            $this->commandBus->dispatch(
                new DeleteTastingCommand(
                    $uriVariables['id'],
                ),
            );
        } catch (TastingDoesntExistException) {
            $this->logger->error(
                'Delete tasting: Tasting doesn\'t exist.',
            );

            throw new NotFoundHttpException();
        }
    }
}
