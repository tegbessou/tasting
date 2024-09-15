<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\Tasting\Domain\ValueObject;

use App\Tasting\Domain\ValueObject\InvitationStatus;
use PHPUnit\Framework\TestCase;

final class InvitationStatusTest extends TestCase
{
    public function testIsAccepted(): void
    {
        $status = InvitationStatus::fromString('accepted');

        $this->assertTrue($status->isAccepted());
    }

    public function testIsPending(): void
    {
        $status = InvitationStatus::fromString('pending');

        $this->assertTrue($status->isPending());
    }
}
