<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Validator\Exception\ValidationException;
use EmpireDesAmis\Tasting\Application\Command\AddNoseCommand;
use EmpireDesAmis\Tasting\Application\Exception\SheetDoesntExistException;
use EmpireDesAmis\Tasting\Domain\Exception\NoseAlreadyAddedException;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\PostSheetNoseResource;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildNoseAlreadyAddedConstraintViolation;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

/**
 * @implements ProcessorInterface<PostSheetNoseResource, void>
 */
final readonly class AddNoseProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private LoggerInterface $logger,
        private BuildNoseAlreadyAddedConstraintViolation $buildNoseAlreadyAddedConstraintViolation,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::string($uriVariables['id']);
        Assert::string($data->impression);
        Assert::string($data->intensite);
        Assert::string($data->arome);
        Assert::string($data->observation);

        try {
            $this->commandBus->dispatch(
                new AddNoseCommand(
                    $uriVariables['id'],
                    $data->impression,
                    $data->intensite,
                    $data->arome,
                    $data->observation,
                ),
            );
        } catch (SheetDoesntExistException $exception) {
            $this->logger->error(
                'Add nose: Sheet doesn\'t exist',
                [
                    'sheetId' => $exception->sheetId,
                ],
            );

            throw new NotFoundHttpException();
        } catch (NoseAlreadyAddedException) {
            $this->logger->error(
                'Add nose: Nose already added',
            );

            throw new ValidationException($this->buildNoseAlreadyAddedConstraintViolation->build());
        }
    }
}
