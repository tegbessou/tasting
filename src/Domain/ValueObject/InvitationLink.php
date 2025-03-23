<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\ValueObject;

use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

final readonly class InvitationLink
{
    private string $link;

    public function __construct(
        string $link,
    ) {
        Assert::stringNotEmpty($link);
        Assert::url($link);

        $this->link = $link;
    }

    public static function fromString(
        string $link,
    ): self {
        return new self(
            $link,
        );
    }

    public function value(): string
    {
        return $this->link;
    }
}
