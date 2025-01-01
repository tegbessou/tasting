<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Validator\Exception\ValidationException;
use App\Tasting\Application\Command\AddEyeCommand;
use App\Tasting\Application\Exception\SheetDoesntExistException;
use App\Tasting\Domain\Exception\EyeTeinteIsNotForThisWineTypeException;
use App\Tasting\Infrastructure\ApiPlatform\Resource\PostSheetEyeResource;
use App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildEyeTeinteIsNotForThisWineTypeConstraintViolation;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

/**
 * @implements ProcessorInterface<PostSheetEyeResource, void>
 */
final readonly class AddEyeProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private LoggerInterface $logger,
        private BuildEyeTeinteIsNotForThisWineTypeConstraintViolation $buildEyeTeinteIsNotForThisWineTypeConstraintViolation,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::string($uriVariables['id']);
        Assert::string($data->limpidite);
        Assert::string($data->brillance);
        Assert::string($data->intensiteCouleur);
        Assert::string($data->teinte);
        Assert::string($data->larme);
        Assert::string($data->observation);

        try {
            $this->commandBus->dispatch(
                new AddEyeCommand(
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
                'Add eye: Sheet doesn\'t exist',
                [
                    'sheetId' => $exception->sheetId,
                ],
            );

            throw new NotFoundHttpException();
        } catch (EyeTeinteIsNotForThisWineTypeException $exception) {
            $this->logger->error(
                'Add eye: Teinte is bad for wine type',
                [
                    'teinte' => $exception->teinte,
                    'wineType' => $exception->wineType,
                ],
            );

            throw new ValidationException($this->buildEyeTeinteIsNotForThisWineTypeConstraintViolation->build($exception));
        }
    }
}
