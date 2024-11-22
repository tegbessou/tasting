<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Validator\Exception\ValidationException;
use App\Tasting\Application\Command\InviteParticipantsCommand;
use App\Tasting\Domain\Exception\OwnerCannotBeInvitedToTastingException;
use App\Tasting\Domain\Exception\ParticipantsAlreadyInvitedException;
use App\Tasting\Domain\Exception\TastingDoesntExistException;
use App\Tasting\Infrastructure\ApiPlatform\Resource\PostTastingInviteResource;
use App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildOwnerCannotBeInvitedConstraintViolation;
use App\Tasting\Infrastructure\Symfony\Validator\ConstraintViolation\BuildParticipantsAlreadyInvitedConstraintViolation;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use TegCorp\SharedKernelBundle\Application\Command\CommandBusInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

/**
 * @implements ProcessorInterface<PostTastingInviteResource, void>
 */
#[WithMonologChannel('tasting')]
final readonly class InviteParticipantsToTastingProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private BuildOwnerCannotBeInvitedConstraintViolation $buildOwnerCannotBeInvitedConstraintViolation,
        private BuildParticipantsAlreadyInvitedConstraintViolation $buildParticipantsAlreadyInvitedConstraintViolation,
        private LoggerInterface $logger,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::uuid($uriVariables['id']);
        Assert::isInstanceOf($data, PostTastingInviteResource::class);
        Assert::allEmail($data->participants);

        try {
            $this->commandBus->dispatch(
                new InviteParticipantsCommand(
                    $uriVariables['id'],
                    $data->participants,
                ),
            );
        } catch (TastingDoesntExistException $exception) {
            $this->logger->error(
                'Invite participants: Tasting doesn\'t exist',
                [
                    'tastingId' => $exception->tastingId,
                ],
            );

            throw new NotFoundHttpException();
        } catch (OwnerCannotBeInvitedToTastingException) {
            $this->logger->error(
                'Invite participants: Owner cannot be invited to tasting',
            );

            throw new ValidationException($this->buildOwnerCannotBeInvitedConstraintViolation->build());
        } catch (ParticipantsAlreadyInvitedException $exception) {
            $this->logger->error(
                'Invite participants: Participants already invited',
                [
                    'participants' => $exception->participants,
                ],
            );

            throw new ValidationException($this->buildParticipantsAlreadyInvitedConstraintViolation->build($exception));
        }
    }
}
