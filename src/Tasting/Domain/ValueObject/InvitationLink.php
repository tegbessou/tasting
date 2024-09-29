<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use Doctrine\ORM\Mapping as ORM;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

#[ORM\Embeddable]
final readonly class InvitationLink
{
    #[ORM\Column(name: 'link', type: 'text', nullable: false)]
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
