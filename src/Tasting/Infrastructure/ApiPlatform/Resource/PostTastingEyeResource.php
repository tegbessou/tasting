<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Post;
use App\Tasting\Domain\Enum\Brillance;
use App\Tasting\Domain\Enum\IntensiteCouleur;
use App\Tasting\Domain\Enum\Larme;
use App\Tasting\Domain\Enum\Limpidite;
use App\Tasting\Infrastructure\ApiPlatform\State\Processor\AddEyeProcessor;
use Symfony\Component\Validator\Constraints as Assert;

#[ApiResource(
    shortName: 'Tasting',
)]
#[Post(
    uriTemplate: '/tastings/{id}/eyes',
    output: false,
    processor: AddEyeProcessor::class,
)]
final readonly class PostTastingEyeResource
{
    public function __construct(
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Email]
        public ?string $participant = null,
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
