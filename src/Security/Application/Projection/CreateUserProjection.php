<?php

declare(strict_types=1);

namespace App\Security\Application\Projection;

use App\Security\Application\Exception\UserDoesntExistException;
use App\Security\Application\Projection\Projector\CreateUserProjector;
use App\Security\Domain\Event\UserCreated;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;

#[WithMonologChannel('security')]
final readonly class CreateUserProjection
{
    public function __construct(
        private CreateUserProjector $createUserProjector,
        private LoggerInterface $logger,
    ) {
    }

    public function __invoke(UserCreated $event): void
    {
        try {
            $this->createUserProjector->project(
                $event->id,
                $event->email,
            );
        } catch (UserDoesntExistException $exception) {
            $this->logger->error(
                'Create user projection: User projection creation failed',
                [
                    'exception' => $exception->getMessage(),
                ],
            );

            throw $exception;
        }
    }
}
