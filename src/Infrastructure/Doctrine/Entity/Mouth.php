<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity;

use Doctrine\ORM\Mapping as ORM;
use EmpireDesAmis\Tasting\Domain\Enum\Acide;
use EmpireDesAmis\Tasting\Domain\Enum\Alcool;
use EmpireDesAmis\Tasting\Domain\Enum\Finale;
use EmpireDesAmis\Tasting\Domain\Enum\Matiere;
use EmpireDesAmis\Tasting\Domain\Enum\Sucre;
use EmpireDesAmis\Tasting\Domain\Enum\Tanin;

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
