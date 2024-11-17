<?php

declare(strict_types=1);

namespace App\Security\Application\Command;

use App\Security\Domain\Service\AuthenticateUserFromProviderInterface;
use App\Security\Domain\ValueObject\UserAuthenticated;
use TegCorp\SharedKernelBundle\Application\Command\CommandInterface;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

/**
 * @implements CommandInterface<UserAuthenticated>
 */
final readonly class AuthenticateUserCommand implements CommandInterface
{
    public string $providerId;

    public function __construct(
        public string $token,
        string $providerId,
    ) {
        Assert::inArray(
            $providerId,
            [
                AuthenticateUserFromProviderInterface::IDENTITY_PROVIDER_APPLE,
                AuthenticateUserFromProviderInterface::IDENTITY_PROVIDER_GOOGLE,
                AuthenticateUserFromProviderInterface::IDENTITY_PROVIDER_FIREBASE,
            ],
        );

        $this->providerId = $providerId;
    }
}
