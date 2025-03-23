<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use EmpireDesAmis\Tasting\Domain\Enum\WineType;

#[ORM\Entity]
class Tasting
{
    public function __construct(
        #[ORM\Id]
        #[ORM\Column(name: 'id', type: 'uuid', unique: true)]
        public string $id,
        #[ORM\Column(name: 'bottle_id', type: 'uuid')]
        public string $bottleId,
        #[ORM\Column(name: 'bottle_name')]
        public string $bottleName,
        #[ORM\Column(name: 'bottle_wine_type', type: 'enum', enumType: WineType::class)]
        public WineType $bottleWineType,
        #[ORM\Column(name: 'participants', type: 'json')]
        public array $participants,
        #[ORM\Column(name: 'owner_id', type: 'string')]
        public string $ownerId,
        /** @var Collection<int|string, Invitation> $invitations */
        #[ORM\OneToMany(targetEntity: Invitation::class, mappedBy: 'subject', cascade: ['persist', 'remove'], orphanRemoval: true)]
        public Collection $invitations = new ArrayCollection(),
    ) {
    }

    public function addInvitation(Invitation $invitation): self
    {
        if (!$this->invitations->contains($invitation)) {
            $this->invitations[] = $invitation;
            $invitation->subject = $this;
        }

        return $this;
    }

    public function deleteInvitation(Invitation $invitation): self
    {
        if ($this->invitations->removeElement($invitation)) {
            if ($invitation->subject === $this) {
                $invitation->subject = null;
            }
        }

        return $this;
    }
}
