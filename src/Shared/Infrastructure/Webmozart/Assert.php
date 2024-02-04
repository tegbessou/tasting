<?php

declare(strict_types=1);

namespace App\Shared\Infrastructure\Webmozart;

use Webmozart\Assert\Assert as BaseAssert;

final class Assert extends BaseAssert
{
    public static function year(int $value, string $message = ''): void
    {
        if ($value < 1900 || $value > 2100) {
            static::reportInvalidArgument(\sprintf(
                $message ?: 'Expected a year between 1900 and 2100. Got: %s',
                static::typeToString($value)
            ));
        }
    }

    public static function positiveFloat(float $value, string $message = ''): void
    {
        if ($value < 0.00) {
            static::reportInvalidArgument(\sprintf(
                $message ?: 'Expected a positive float. Got: %s',
                static::typeToString($value)
            ));
        }
    }
}
