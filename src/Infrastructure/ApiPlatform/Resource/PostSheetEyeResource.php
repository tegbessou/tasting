<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Post;
use EmpireDesAmis\Tasting\Domain\Enum\Brillance;
use EmpireDesAmis\Tasting\Domain\Enum\IntensiteCouleur;
use EmpireDesAmis\Tasting\Domain\Enum\Larme;
use EmpireDesAmis\Tasting\Domain\Enum\Limpidite;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Processor\AddEyeProcessor;
use Symfony\Component\Validator\Constraints as Assert;

#[ApiResource(
    shortName: 'Sheet',
)]
#[Post(
    uriTemplate: '/sheets/{id}/eyes',
    output: false,
    processor: AddEyeProcessor::class,
)]
final readonly class PostSheetEyeResource
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
