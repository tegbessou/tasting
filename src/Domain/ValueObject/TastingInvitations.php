<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\ValueObject;

use EmpireDesAmis\Tasting\Domain\Entity\Invitation;
use EmpireDesAmis\Tasting\Domain\Exception\InvitationDoesntExistException;
use TegCorp\SharedKernelBundle\Infrastructure\Webmozart\Assert;

final readonly class TastingInvitations
{
    /** @param Invitation[] $invitations */
    private array $invitations;

    public function __construct(
        array $invitations = [],
    ) {
        Assert::allIsInstanceOf($invitations, Invitation::class);

        $this->invitations = $invitations;
    }

    public function add(Invitation $invitation): self
    {
        return new self(
            array_merge($this->invitations, [$invitation]),
        );
    }

    public function delete(Invitation $invitation): self
    {
        $index = $this->indexOf($invitation);

        if ($index === false) {
            throw new InvitationDoesntExistException($invitation->id()->value());
        }

        $oldInvitations = $this->values();
        unset($oldInvitations[$index]);

        return TastingInvitations::fromArray(
            array_values($oldInvitations),
        );
    }

    public static function empty(): self
    {
        return new self();
    }

    /** @param Invitation[] $invitations */
    public static function fromArray(array $invitations): self
    {
        return new self($invitations);
    }

    public function indexOf(Invitation $searched): int|bool
    {
        $index = false;

        /** @var Invitation $invitation */
        foreach ($this->invitations as $key => $invitation) {
            if ($invitation->id()->value() !== $searched->id()->value()) {
                continue;
            }

            $index = $key;
        }

        if (is_string($index)) {
            throw new \LogicException('TastingInvitations index must be integer.');
        }

        return $index;
    }

    public function find(InvitationId $id): ?Invitation
    {
        $invitationFind = null;

        /** @var Invitation $invitation */
        foreach ($this->invitations as $invitation) {
            if ($invitation->id()->value() !== $id->value()) {
                continue;
            }

            $invitationFind = $invitation;
        }

        return $invitationFind;
    }

    public function isAlreadyInvited(ParticipantId $participantId): bool
    {
        $isAlreadyInvited = false;

        /** @var Invitation $invitation */
        foreach ($this->invitations as $invitation) {
            if ($invitation->target()->value() !== $participantId->value()) {
                continue;
            }

            $isAlreadyInvited = true;
        }

        return $isAlreadyInvited;
    }

    public function values(): array
    {
        return $this->invitations;
    }
}
