<?php

declare(strict_types=1);

namespace App\Tasting\Domain\ValueObject;

use App\Tasting\Domain\Entity\Eye;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

final readonly class TastingEyes
{
    private array $eyes;

    public function __construct(array $eyes)
    {
        Assert::allIsInstanceOf($eyes, Eye::class);

        $this->eyes = $eyes;
    }

    public function add(Eye $eye): self
    {
        return new self(
            array_merge($this->eyes, [$eye]),
        );
    }

    public static function empty(): self
    {
        return new self([]);
    }

    public static function fromArray(array $eyes): self
    {
        return new self($eyes);
    }

    public function find(EyeId $id): ?Eye
    {
        $eyeFind = null;

        /** @var Eye $eye */
        foreach ($this->eyes as $eye) {
            if ($eye->id()->value() !== $id->value()) {
                continue;
            }

            $eyeFind = $eye;
        }

        return $eyeFind;
    }

    public function contains(EyeParticipant $participant): bool
    {
        $contains = false;

        /** @var Eye $eye */
        foreach ($this->eyes as $eye) {
            if ($eye->participant()->value() !== $participant->value()) {
                continue;
            }

            $contains = true;
        }

        return $contains;
    }

    public function values(): array
    {
        return $this->eyes;
    }
}
