<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Validator\Exception\ValidationException;
use App\Tasting\Application\Command\AddMouthCommand;
use App\Tasting\Application\Exception\SheetDoesntExistException;
use App\Tasting\Domain\Exception\MouthAlreadyAddedException;
use App\Tasting\Domain\Exception\MouthSucreShouldBeIfWineIsSweetException;
use App\Tasting\Domain\Exception\MouthSucreShouldntBeIfWineIsNotSweetException;
use App\Tasting\Domain\Exception\MouthTaninShouldBeIfWineTypeIsRedException;
use App\Tasting\Domain\Exception\MouthTaninShouldntBeIfWineTypeIsNotRedException;
use App\Tasting\Infrastructure\ApiPlatform\Resource\PostSheetMouthResource;
use App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildMouthAlreadyAddedConstraintViolation;
use App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildMouthSucreShouldBeNullIfWineIsNotSweetConstraintViolation;
use App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildMouthSucreShouldntBeNullIfWineIsSweetConstraintViolation;
use App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildMouthTaninShouldBeNullIfWineIsNotRedConstraintViolation;
use App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildMouthTaninShouldntBeNullIfWineIsRedConstraintViolation;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

/**
 * @implements ProcessorInterface<PostSheetMouthResource, void>
 */
final readonly class AddMouthProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private LoggerInterface $logger,
        private BuildMouthTaninShouldntBeNullIfWineIsRedConstraintViolation $buildMouthTaninShouldntBeNullIfWineIsRedConstraintViolation,
        private BuildMouthTaninShouldBeNullIfWineIsNotRedConstraintViolation $buildMouthTaninShouldBeNullIfWineIsNotRedConstraintViolation,
        private BuildMouthSucreShouldntBeNullIfWineIsSweetConstraintViolation $buildMouthSucreShouldntBeNullIfWineIsSweetConstraintViolation,
        private BuildMouthSucreShouldBeNullIfWineIsNotSweetConstraintViolation $buildMouthSucreShouldBeNullIfWineIsNotSweetConstraintViolation,
        private BuildMouthAlreadyAddedConstraintViolation $buildMouthAlreadyAddedConstraintViolation,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::string($uriVariables['id']);
        Assert::string($data->alcool);
        Assert::string($data->acide);
        Assert::string($data->matiere);
        Assert::string($data->finale);
        Assert::string($data->observation);

        try {
            $this->commandBus->dispatch(
                new AddMouthCommand(
                    $uriVariables['id'],
                    $data->alcool,
                    $data->acide,
                    $data->matiere,
                    $data->finale,
                    $data->observation,
                    $data->tanin,
                    $data->sucre,
                ),
            );
        } catch (SheetDoesntExistException $exception) {
            $this->logger->error(
                'Add mouth: Sheet doesn\'t exist',
                [
                    'sheetId' => $exception->sheetId,
                ],
            );

            throw new NotFoundHttpException();
        } catch (MouthTaninShouldBeIfWineTypeIsRedException) {
            $this->logger->error(
                'Add mouth: Tanin shouldn\'t be null if the wine is red',
            );

            throw new ValidationException($this->buildMouthTaninShouldntBeNullIfWineIsRedConstraintViolation->build());
        } catch (MouthTaninShouldntBeIfWineTypeIsNotRedException) {
            $this->logger->error(
                'Add mouth: Tanin should be null if the wine is not red',
            );

            throw new ValidationException($this->buildMouthTaninShouldBeNullIfWineIsNotRedConstraintViolation->build());
        } catch (MouthSucreShouldBeIfWineIsSweetException) {
            $this->logger->error(
                'Add mouth: Sucre shouldn\'t be null if the wine is sweet',
            );

            throw new ValidationException($this->buildMouthSucreShouldntBeNullIfWineIsSweetConstraintViolation->build());
        } catch (MouthSucreShouldntBeIfWineIsNotSweetException) {
            $this->logger->error(
                'Add mouth: Sucre should be null if the wine is not sweet',
            );

            throw new ValidationException($this->buildMouthSucreShouldBeNullIfWineIsNotSweetConstraintViolation->build());
        } catch (MouthAlreadyAddedException) {
            $this->logger->error(
                'Add mouth: Mouth already added',
            );

            throw new ValidationException($this->buildMouthAlreadyAddedConstraintViolation->build());
        }
    }
}
