<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Validator\Exception\ValidationException;
use EmpireDesAmis\Tasting\Application\Command\UpdateEyeCommand;
use EmpireDesAmis\Tasting\Application\Exception\SheetDoesntExistException;
use EmpireDesAmis\Tasting\Domain\Exception\EyeShouldBeAddedException;
use EmpireDesAmis\Tasting\Domain\Exception\EyeTeinteIsNotForThisWineTypeException;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource\PutSheetEyeResource;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildEyeNotAlreadyAddedConstraintViolation;
use EmpireDesAmis\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildEyeTeinteIsNotForThisWineTypeConstraintViolation;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

/**
 * @implements ProcessorInterface<PutSheetEyeResource, void>
 */
final readonly class UpdateEyeProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private LoggerInterface $logger,
        private BuildEyeTeinteIsNotForThisWineTypeConstraintViolation $buildEyeTeinteIsNotForThisWineTypeConstraintViolation,
        private BuildEyeNotAlreadyAddedConstraintViolation $buildEyeNotAlreadyAddedConstraintViolation,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::uuid($uriVariables['id']);
        Assert::string($data->limpidite);
        Assert::string($data->brillance);
        Assert::string($data->intensiteCouleur);
        Assert::string($data->teinte);
        Assert::string($data->larme);
        Assert::string($data->observation);

        try {
            $this->commandBus->dispatch(
                new UpdateEyeCommand(
                    $uriVariables['id'],
                    $data->limpidite,
                    $data->brillance,
                    $data->intensiteCouleur,
                    $data->teinte,
                    $data->larme,
                    $data->observation,
                ),
            );
        } catch (SheetDoesntExistException $exception) {
            $this->logger->error(
                'Update eye: Sheet doesn\'t exist',
                [
                    'sheetId' => $exception->sheetId,
                ],
            );

            throw new NotFoundHttpException();
        } catch (EyeTeinteIsNotForThisWineTypeException $exception) {
            $this->logger->error(
                'Update eye: Teinte is bad for wine type',
                [
                    'teinte' => $exception->teinte,
                    'wineType' => $exception->wineType,
                ],
            );

            throw new ValidationException($this->buildEyeTeinteIsNotForThisWineTypeConstraintViolation->build($exception));
        } catch (EyeShouldBeAddedException) {
            $this->logger->error(
                'Update eye: Eye not already added',
            );

            throw new ValidationException($this->buildEyeNotAlreadyAddedConstraintViolation->build());
        }
    }
}
