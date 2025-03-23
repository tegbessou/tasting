<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Validator\Exception\ValidationException;
use EmpireDesAmis\Tasting\Application\Command\UpdateNoseCommand;
use EmpireDesAmis\Tasting\Application\Exception\SheetDoesntExistException;
use EmpireDesAmis\Tasting\Domain\Exception\NoseShouldBeAddedException;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\PutSheetNoseResource;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildNoseNotAlreadyAddedConstraintViolation;
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
        private BuildNoseNotAlreadyAddedConstraintViolation $buildNoseNotAlreadyAddedConstraintViolation,
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
        } catch (NoseShouldBeAddedException) {
            $this->logger->error(
                'Update nose: Nose not already added',
            );

            throw new ValidationException($this->buildNoseNotAlreadyAddedConstraintViolation->build());
        }
    }
}
