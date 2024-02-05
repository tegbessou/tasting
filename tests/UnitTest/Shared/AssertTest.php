<?php

declare(strict_types=1);

namespace App\Tests\UnitTest\Shared;

use App\Shared\Infrastructure\Webmozart\Assert;
use PHPUnit\Framework\TestCase;

class AssertTest extends TestCase
{
    public function testYearFailedToHigh(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Assert::year(2101);
    }

    public function testYearFailedToLow(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Assert::year(1899);
    }

    public function testFloatFailedToLow(): void
    {
        $this->expectException(\InvalidArgumentException::class);

        Assert::positiveFloat(-12.00);
    }
}