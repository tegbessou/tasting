<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\ReadModel;

use Doctrine\ODM\MongoDB\Mapping\Annotations as MongoDB;

#[MongoDB\Document]
class Sheet
{
    public function __construct(
        #[MongoDB\Id(strategy: 'UUID')]
        public string $id,
        #[MongoDB\Field(type: 'string')]
        public string $tastingId,
        #[MongoDB\Field(type: 'string')]
        public string $participantId,
        #[MongoDB\Field(type: 'string')]
        public string $participantFullName,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $eyeLimpidite = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $eyeBrillance = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $eyeIntensiteCouleur = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $eyeTeinte = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $eyeLarme = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $eyeObservation = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $noseImpression = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $noseIntensite = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $noseArome = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $noseObservation = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $mouthAlcool = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $mouthAcide = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $mouthMatiere = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $mouthFinale = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $mouthObservation = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $mouthTanin = null,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $mouthSucre = null,
    ) {
    }
}
