<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Post;
use EmpireDesAmis\Tasting\Domain\Enum\Acide;
use EmpireDesAmis\Tasting\Domain\Enum\Alcool;
use EmpireDesAmis\Tasting\Domain\Enum\Finale;
use EmpireDesAmis\Tasting\Domain\Enum\Matiere;
use EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\State\Processor\AddMouthProcessor;
use Symfony\Component\Validator\Constraints as Assert;

#[ApiResource(
    shortName: 'Sheet',
)]
#[Post(
    uriTemplate: '/sheets/{id}/mouths',
    output: false,
    processor: AddMouthProcessor::class,
)]
final readonly class PostSheetMouthResource
{
    public function __construct(
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Choice(callback: [Alcool::class, 'values'])]
        public ?string $alcool = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Choice(callback: [Acide::class, 'values'])]
        public ?string $acide = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Choice(callback: [Matiere::class, 'values'])]
        public ?string $matiere = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Choice(callback: [Finale::class, 'values'])]
        public ?string $finale = null,
        #[ApiProperty]
        public ?string $tanin = null,
        #[ApiProperty]
        public ?string $sucre = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        public ?string $observation = null,
    ) {
    }
}
