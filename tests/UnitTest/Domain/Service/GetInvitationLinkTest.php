<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Tests\UnitTest\Domain\Service;

use EmpireDesAmis\Tasting\Domain\Service\GetInvitationLink;
use EmpireDesAmis\Tasting\Domain\ValueObject\InvitationLink;
use PHPUnit\Framework\TestCase;

final class GetInvitationLinkTest extends TestCase
{
    public function testGetLink(): void
    {
        $this->assertEquals(
            InvitationLink::fromString('https://apps.apple.com/app/6468406309'),
            GetInvitationLink::getLink()
        );
    }
}
