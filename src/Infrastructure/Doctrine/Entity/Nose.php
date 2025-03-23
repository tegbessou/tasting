<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\Doctrine\Entity;

use Doctrine\ORM\Mapping as ORM;
use EmpireDesAmis\Tasting\Domain\Enum\Arome;
use EmpireDesAmis\Tasting\Domain\Enum\Impression;
use EmpireDesAmis\Tasting\Domain\Enum\Intensite;

#[ORM\Entity]
class Nose
{
    public function __construct(
        #[ORM\Id]
        #[ORM\Column(name: 'id', type: 'uuid', unique: true)]
        public string $id,
        #[ORM\OneToOne(targetEntity: Sheet::class, inversedBy: 'nose')]
        #[ORM\JoinColumn(name: 'sheet_id', referencedColumnName: 'id', nullable: false)]
        public Sheet $sheet,
        #[ORM\Column(name: 'impression', type: 'string', enumType: Impression::class)]
        public Impression $impression,
        #[ORM\Column(name: 'intensite', type: 'string', enumType: Intensite::class)]
        public Intensite $intensite,
        #[ORM\Column(name: 'arome', type: 'string', enumType: Arome::class)]
        public Arome $arome,
        #[ORM\Column(name: 'observation', type: 'text')]
        public string $observation,
    ) {
    }
}
