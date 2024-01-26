<?php

declare(strict_types=1);

namespace App\User\Application\Command;

use App\Shared\Application\Command\CommandInterface;
use App\User\Domain\Service\AuthenticateUserInterface;
use App\User\Domain\ValueObject\UserAuthenticated;
use Webmozart\Assert\Assert;

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
        Assert::inArray($providerId, [AuthenticateUserInterface::IDENTITY_PROVIDER_APPLE, AuthenticateUserInterface::IDENTITY_PROVIDER_GOOGLE]);

        $this->providerId = $providerId;
    }
}
