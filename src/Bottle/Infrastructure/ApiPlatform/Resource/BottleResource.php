<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Post;
use App\Bottle\Domain\Entity\Bottle;
use App\Bottle\Domain\Enum\Rate;
use App\Bottle\Domain\Enum\WineType;
use App\Bottle\Infrastructure\ApiPlatform\State\Processor\CreateBottleProcessor;
use App\Bottle\Infrastructure\Symfony\Controller\PostBottlePictureAction;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\Attribute\Groups;
use Symfony\Component\Uid\AbstractUid;
use Symfony\Component\Uid\Uuid;
use Symfony\Component\Validator\Constraints as Assert;
use Vich\UploaderBundle\Mapping\Annotation as Vich;

#[Vich\Uploadable]
#[ApiResource(
    operations: [
        new Post(
            uriTemplate: '/bottles',
            shortName: 'Bottle',
            output: false,
            processor: CreateBottleProcessor::class,
        ),
        new Post(
            uriTemplate: '/bottles/{id}/pictures',
            inputFormats: ['multipart' => ['multipart/form-data']],
            status: Response::HTTP_NO_CONTENT,
            controller: PostBottlePictureAction::class,
            shortName: 'Bottle',
            denormalizationContext: ['groups' => ['write_bottle_picture']],
            validationContext: ['groups' => ['write_bottle_picture']],
            deserialize: false,
        ),
    ]
)]
final class BottleResource
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
        #[ApiProperty]
        #[Vich\UploadableField(mapping: 'bottles', fileNameProperty: 'picturePath')]
        #[Groups(['write_bottle_picture'])]
        public ?File $picture = null,
        public ?string $picturePath = null,
    ) {
    }

    public static function fromModel(Bottle $bottle): self
    {
        return new self(
            new Uuid($bottle->id()->value()),
            $bottle->name()->value(),
            $bottle->estateName()->value(),
            WineType::from($bottle->wineType()->value()),
            $bottle->year()->value(),
            $bottle->grapeVarieties()->values(),
            Rate::from($bottle->rate()->value()),
            $bottle->ownerId()->id(),
            $bottle->country()?->value() ?? null,
            $bottle->price()?->amount() ?? null,
        );
    }
}
