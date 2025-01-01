<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Entity;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class Sheet
{
    public function __construct(
        #[ORM\Id]
        #[ORM\Column(name: 'id', type: 'uuid', unique: true)]
        public string $id,
        #[ORM\Column(name: 'tasting_id', type: 'uuid')]
        public string $tastingId,
        #[ORM\Column(name: 'participant', type: 'string')]
        public string $participant,
        #[ORM\OneToOne(targetEntity: Eye::class, mappedBy: 'sheet', cascade: ['persist', 'remove'], fetch: 'EAGER')]
        public ?Eye $eye = null,
        #[ORM\OneToOne(targetEntity: Nose::class, mappedBy: 'sheet', cascade: ['persist', 'remove'], fetch: 'EAGER')]
        public ?Nose $nose = null,
    ) {
    }
}
