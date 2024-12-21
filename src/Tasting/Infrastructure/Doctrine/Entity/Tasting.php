<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Entity;

use App\Tasting\Domain\Enum\WineType;
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
        #[ORM\Column(name: 'bottle_wine_type', type: 'enum', enumType: WineType::class)]
        public WineType $bottleWineType,
        #[ORM\Column(name: 'participants', type: 'json')]
        public array $participants,
        #[ORM\Column(name: 'owner_id', type: 'string')]
        public string $ownerId,
        /** @var Collection<int|string, Invitation> $invitations */
        #[ORM\OneToMany(targetEntity: Invitation::class, mappedBy: 'subject', cascade: ['persist', 'remove'], orphanRemoval: true)]
        public Collection $invitations = new ArrayCollection(),
        /** @var Collection<int|string, Eye> $eyes */
        #[ORM\OneToMany(targetEntity: Eye::class, mappedBy: 'tasting', cascade: ['persist', 'remove'], orphanRemoval: true)]
        public Collection $eyes = new ArrayCollection(),
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

    public function addEye(Eye $eye): self
    {
        if (!$this->eyes->contains($eye)) {
            $this->eyes[] = $eye;
            $eye->tasting = $this;
        }

        return $this;
    }

    public function deleteEye(Eye $eye): self
    {
        if ($this->eyes->removeElement($eye)) {
            if ($eye->tasting === $this) {
                $eye->tasting = null;
            }
        }

        return $this;
    }
}
