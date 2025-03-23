<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity;

use Doctrine\ORM\Mapping as ORM;
use EmpireDesAmis\Tasting\Domain\Enum\Brillance;
use EmpireDesAmis\Tasting\Domain\Enum\IntensiteCouleur;
use EmpireDesAmis\Tasting\Domain\Enum\Larme;
use EmpireDesAmis\Tasting\Domain\Enum\Limpidite;

#[ORM\Entity]
class Eye
{
    public function __construct(
        #[ORM\Id]
        #[ORM\Column(name: 'id', type: 'uuid', unique: true)]
        public string $id,
        #[ORM\OneToOne(targetEntity: Sheet::class, inversedBy: 'eye')]
        #[ORM\JoinColumn(name: 'sheet_id', referencedColumnName: 'id', nullable: false)]
        public Sheet $sheet,
        #[ORM\Column(name: 'limpidite', type: 'string', enumType: Limpidite::class)]
        public Limpidite $limpidite,
        #[ORM\Column(name: 'brillance', type: 'string', enumType: Brillance::class)]
        public Brillance $brillance,
        #[ORM\Column(name: 'intensite_couleur', type: 'string', enumType: IntensiteCouleur::class)]
        public IntensiteCouleur $intensiteCouleur,
        #[ORM\Column(name: 'teinte', type: 'string')]
        public string $teinte,
        #[ORM\Column(name: 'larme', type: 'string', enumType: Larme::class)]
        public Larme $larme,
        #[ORM\Column(name: 'observation', type: 'text')]
        public string $observation,
    ) {
    }
}
