<?php

declare(strict_types=1);

namespace App\Tasting\Application\ReadModel;

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
    ) {}
}