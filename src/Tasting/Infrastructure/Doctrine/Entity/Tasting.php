<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class Tasting
{
    public function __construct(
        #[ORM\Id]
        #[ORM\Column(name: 'id', type: 'uuid', unique: true)]
        public string $id,
        #[ORM\Column(name: 'bottle_name')]
        public string $bottleName,
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

    public function removeInvitation(Invitation $invitation): self
    {
        if ($this->invitations->removeElement($invitation)) {
            if ($invitation->subject === $this) {
                $invitation->subject = null;
            }
        }

        return $this;
    }
}
