<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Entity;

use App\Tasting\Domain\Enum\Acide;
use App\Tasting\Domain\Enum\Alcool;
use App\Tasting\Domain\Enum\Finale;
use App\Tasting\Domain\Enum\Matiere;
use App\Tasting\Domain\Enum\Sucre;
use App\Tasting\Domain\Enum\Tanin;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class Mouth
{
    public function __construct(
        #[ORM\Id]
        #[ORM\Column(name: 'id', type: 'uuid', unique: true)]
        public string $id,
        #[ORM\OneToOne(targetEntity: Sheet::class, inversedBy: 'mouth')]
        #[ORM\JoinColumn(name: 'sheet_id', referencedColumnName: 'id', nullable: false)]
        public Sheet $sheet,
        #[ORM\Column(name: 'alcool', type: 'string', enumType: Alcool::class)]
        public Alcool $alcool,
        #[ORM\Column(name: 'acide', type: 'string', enumType: Acide::class)]
        public Acide $acide,
        #[ORM\Column(name: 'matiere', type: 'string', enumType: Matiere::class)]
        public Matiere $matiere,
        #[ORM\Column(name: 'finale', type: 'string', enumType: Finale::class)]
        public Finale $finale,
        #[ORM\Column(name: 'observation', type: 'text')]
        public string $observation,
        #[ORM\Column(name: 'tanin', type: 'string', nullable: true, enumType: Tanin::class)]
        public ?Tanin $tanin = null,
        #[ORM\Column(name: 'sucre', type: 'string', nullable: true, enumType: Sucre::class)]
        public ?Sucre $sucre = null,
    ) {
    }
}
