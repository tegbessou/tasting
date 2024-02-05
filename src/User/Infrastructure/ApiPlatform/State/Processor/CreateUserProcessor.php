<?php

declare(strict_types=1);

namespace App\User\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Symfony\Validator\Exception\ValidationException;
use App\Shared\Application\Command\CommandBusInterface;
use App\User\Application\Command\CreateUserCommand;
use App\User\Domain\Exception\UserAlreadyExistsException;
use App\User\Domain\ValueObject\UserEmail;
use App\User\Infrastructure\ApiPlatform\Resource\UserResource;
use Symfony\Component\Validator\ConstraintViolation;
use Symfony\Component\Validator\ConstraintViolationList;
use Symfony\Contracts\Translation\TranslatorInterface;
use Webmozart\Assert\Assert;

/**
 * @implements ProcessorInterface<UserResource, void>
 */
final readonly class CreateUserProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private TranslatorInterface $translator,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::isInstanceOf($data, UserResource::class);
        Assert::notNull($data->email);

        try {
            $this->commandBus->dispatch(
                new CreateUserCommand(
                    UserEmail::fromString($data->email)
                ),
            );
        } catch (UserAlreadyExistsException) {
            throw new ValidationException($this->buildAlreadyExistViolations($data->email));
        }
    }

    private function buildAlreadyExistViolations(
        string $email,
    ): ConstraintViolationList {
        $violations = new ConstraintViolationList();
        $violations->add(new ConstraintViolation(
            $this->translator->trans(
                'user.email.already_exists',
                ['%email%' => $email],
                'validators'
            ),
            null,
            [],
            $email,
            'email',
            $email
        ));

        return $violations;
    }
}
