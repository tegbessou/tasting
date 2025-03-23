<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Put;
use EmpireDesAmis\Tasting\Domain\Enum\Brillance;
use EmpireDesAmis\Tasting\Domain\Enum\IntensiteCouleur;
use EmpireDesAmis\Tasting\Domain\Enum\Larme;
use EmpireDesAmis\Tasting\Domain\Enum\Limpidite;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Processor\UpdateEyeProcessor;
use Symfony\Component\Validator\Constraints as Assert;

#[ApiResource(
    shortName: 'Sheet',
)]
#[Put(
    uriTemplate: '/sheets/{id}/eyes',
    output: false,
    read: false,
    processor: UpdateEyeProcessor::class,
)]
final readonly class PutSheetEyeResource
{
    public function __construct(
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Choice(callback: [Limpidite::class, 'values'])]
        public ?string $limpidite = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Choice(callback: [Brillance::class, 'values'])]
        public ?string $brillance = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Choice(callback: [IntensiteCouleur::class, 'values'])]
        public ?string $intensiteCouleur = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        public ?string $teinte = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Choice(callback: [Larme::class, 'values'])]
        public ?string $larme = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        public ?string $observation = null,
    ) {
    }
}
