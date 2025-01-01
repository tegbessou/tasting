<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Put;
use App\Tasting\Domain\Enum\Arome;
use App\Tasting\Domain\Enum\Impression;
use App\Tasting\Domain\Enum\Intensite;
use App\Tasting\Infrastructure\ApiPlatform\State\Processor\UpdateNoseProcessor;
use Symfony\Component\Validator\Constraints as Assert;

#[ApiResource(
    shortName: 'Sheet',
)]
#[Put(
    uriTemplate: '/sheets/{id}/noses',
    output: false,
    read: false,
    processor: UpdateNoseProcessor::class,
)]
final readonly class PutSheetNoseResource
{
    public function __construct(
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Choice(callback: [Impression::class, 'values'])]
        public ?string $impression = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Choice(callback: [Intensite::class, 'values'])]
        public ?string $intensite = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Choice(callback: [Arome::class, 'values'])]
        public ?string $arome = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        public ?string $observation = null,
    ) {
    }
}
