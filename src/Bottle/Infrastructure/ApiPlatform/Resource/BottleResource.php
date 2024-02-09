<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Post;
use App\Bottle\Domain\Enum\Rate;
use App\Bottle\Domain\Enum\WineType;
use App\Bottle\Infrastructure\ApiPlatform\State\Processor\CreateBottleProcessor;
use Symfony\Component\Uid\AbstractUid;
use Symfony\Component\Validator\Constraints as Assert;

#[ApiResource(
    operations: [
        new Post(
            uriTemplate: '/bottles',
            shortName: 'Bottle',
            processor: CreateBottleProcessor::class,
        ),
    ]
)]
final readonly class BottleResource
{
    public function __construct(
        #[ApiProperty(identifier: true)]
        public ?AbstractUid $id = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        public ?string $name = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        public ?string $estateName = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Type(type: WineType::class)]
        public ?WineType $type = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\LessThanOrEqual(2100)]
        #[Assert\GreaterThanOrEqual(1800)]
        public ?int $year = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        public ?array $grapeVarieties = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Type(type: Rate::class)]
        public ?Rate $rate = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        public ?string $ownerId = null,
        #[ApiProperty]
        public ?string $country = null,
        #[ApiProperty]
        #[Assert\GreaterThanOrEqual(0.0)]
        public ?float $price = null,
    ) {
    }
}
