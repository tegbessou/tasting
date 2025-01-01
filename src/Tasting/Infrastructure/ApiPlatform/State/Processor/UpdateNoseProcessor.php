<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use App\Tasting\Application\Command\UpdateNoseCommand;
use App\Tasting\Application\Exception\SheetDoesntExistException;
use App\Tasting\Infrastructure\ApiPlatform\Resource\PutSheetNoseResource;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

/**
 * @implements ProcessorInterface<PutSheetNoseResource, void>
 */
final readonly class UpdateNoseProcessor implements ProcessorInterface
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
        Assert::string($data->impression);
        Assert::string($data->intensite);
        Assert::string($data->arome);
        Assert::string($data->observation);

        try {
            $this->commandBus->dispatch(
                new UpdateNoseCommand(
                    $uriVariables['id'],
                    $data->impression,
                    $data->intensite,
                    $data->arome,
                    $data->observation,
                ),
            );
        } catch (SheetDoesntExistException $exception) {
            $this->logger->error(
                'Update nose: Sheet doesn\'t exist',
                [
                    'sheetId' => $exception->sheetId,
                ],
            );

            throw new NotFoundHttpException();
        }
    }
}
