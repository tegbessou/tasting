<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Validator\Exception\ValidationException;
use App\Tasting\Application\Command\AddEyeCommand;
use App\Tasting\Domain\Exception\EyeParticipantAlreadyAddEyeException;
use App\Tasting\Domain\Exception\EyeParticipantNotInvitedException;
use App\Tasting\Domain\Exception\EyeTeinteIsNotForThisWineTypeException;
use App\Tasting\Domain\Exception\TastingDoesntExistException;
use App\Tasting\Infrastructure\ApiPlatform\Resource\PostTastingEyeResource;
use App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildEyeParticipantAlreadyAddEyeConstraintViolation;
use App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildEyeParticipantNotInvitedConstraintViolation;
use App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildEyeTeinteIsNotForThisWineTypeConstraintViolation;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

/**
 * @implements ProcessorInterface<PostTastingEyeResource, void>
 */
final readonly class AddEyeProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private LoggerInterface $logger,
        private BuildEyeParticipantNotInvitedConstraintViolation $buildEyeParticipantNotInvitedConstraintViolation,
        private BuildEyeTeinteIsNotForThisWineTypeConstraintViolation $buildEyeTeinteIsNotForThisWineTypeConstraintViolation,
        private BuildEyeParticipantAlreadyAddEyeConstraintViolation $buildEyeParticipantAlreadyAddEyeConstraintViolation,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::string($uriVariables['id']);
        Assert::string($data->participant);
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
                    $data->participant,
                    $data->limpidite,
                    $data->brillance,
                    $data->intensiteCouleur,
                    $data->teinte,
                    $data->larme,
                    $data->observation,
                ),
            );
        } catch (TastingDoesntExistException $exception) {
            $this->logger->error(
                'Add eye: Tasting doesn\'t exist',
                [
                    'tastingId' => $exception->tastingId,
                ],
            );

            throw new NotFoundHttpException();
        } catch (EyeParticipantNotInvitedException $exception) {
            $this->logger->error(
                'Add eye: Participant not invited',
                [
                    'participantId' => $exception->participant,
                    'tastingId' => $exception->tastingId,
                ],
            );

            throw new ValidationException($this->buildEyeParticipantNotInvitedConstraintViolation->build($exception));
        } catch (EyeTeinteIsNotForThisWineTypeException $exception) {
            $this->logger->error(
                'Add eye: Teinte is bad for wine type',
                [
                    'teinte' => $exception->teinte,
                    'wineType' => $exception->wineType,
                ],
            );

            throw new ValidationException($this->buildEyeTeinteIsNotForThisWineTypeConstraintViolation->build($exception));
        } catch (EyeParticipantAlreadyAddEyeException $exception) {
            $this->logger->error(
                'Add eye: Participant already add eye',
                [
                    'participantId' => $exception->participant,
                    'tastingId' => $exception->tastingId,
                ],
            );

            throw new ValidationException($this->buildEyeParticipantAlreadyAddEyeConstraintViolation->build($exception));
        }
    }
}
