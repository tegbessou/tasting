<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Delete;
use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\GetCollection;
use ApiPlatform\Metadata\Patch;
use ApiPlatform\Metadata\Post;
use App\BottleInventory\Domain\Entity\Bottle;
use App\BottleInventory\Domain\Enum\Rate;
use App\BottleInventory\Domain\Enum\WineType;
use App\BottleInventory\Infrastructure\ApiPlatform\OpenApi\BottleFilter;
use App\BottleInventory\Infrastructure\ApiPlatform\State\Processor\CreateBottleProcessor;
use App\BottleInventory\Infrastructure\ApiPlatform\State\Processor\DeleteBottleProcessor;
use App\BottleInventory\Infrastructure\ApiPlatform\State\Processor\PatchBottleProcessor;
use App\BottleInventory\Infrastructure\ApiPlatform\State\Processor\TasteBottleProcessor;
use App\BottleInventory\Infrastructure\ApiPlatform\State\Provider\GetCollectionProvider;
use App\BottleInventory\Infrastructure\ApiPlatform\State\Provider\GetProvider;
use App\BottleInventory\Infrastructure\Symfony\Controller\ReplaceBottlePictureController;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\Attribute\Groups;
use Symfony\Component\Uid\AbstractUid;
use Symfony\Component\Uid\Uuid;
use Symfony\Component\Validator\Constraints as Assert;
use Vich\UploaderBundle\Mapping\Annotation as Vich;

#[Vich\Uploadable]
#[ApiResource(
    shortName: 'Bottle',
    operations: [
        new Post(
            uriTemplate: '/bottles',
            output: false,
            processor: CreateBottleProcessor::class,
        ),
        new Post(
            uriTemplate: '/bottles/{id}/pictures',
            inputFormats: ['multipart' => ['multipart/form-data']],
            status: Response::HTTP_NO_CONTENT,
            controller: ReplaceBottlePictureController::class,
            denormalizationContext: ['groups' => ['write_bottle_picture']],
            validationContext: ['groups' => ['write_bottle_picture']],
            output: false,
            deserialize: false,
        ),
        new Get(
            uriTemplate: '/bottles/{id}',
            provider: GetProvider::class,
        ),
        new GetCollection(
            uriTemplate: '/bottles',
            normalizationContext: ['groups' => ['read_bottle_collection']],
            filters: [BottleFilter::class],
            provider: GetCollectionProvider::class,
        ),
        new Delete(
            uriTemplate: '/bottles/{id}',
            provider: GetProvider::class,
            processor: DeleteBottleProcessor::class,
        ),
        new Patch(
            uriTemplate: '/bottles/{id}',
            output: false,
            provider: GetProvider::class,
            processor: PatchBottleProcessor::class,
        ),
        new Post(
            uriTemplate: '/bottles/{id}/taste',
            status: Response::HTTP_NO_CONTENT,
            output: false,
            provider: GetProvider::class,
            processor: TasteBottleProcessor::class,
        ),
    ]
)]
final class BottleResource
{
    public function __construct(
        #[ApiProperty(identifier: true)]
        #[Groups(['read_bottle_collection'])]
        public ?AbstractUid $id = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Groups(['read_bottle_collection'])]
        public ?string $name = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Groups(['read_bottle_collection'])]
        public ?string $estateName = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Type(type: WineType::class)]
        public ?WineType $wineType = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\LessThanOrEqual(2100)]
        #[Assert\GreaterThanOrEqual(1800)]
        #[Groups(['read_bottle_collection'])]
        public ?int $year = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        public ?array $grapeVarieties = null,
        #[ApiProperty]
        #[Assert\NotBlank]
        #[Assert\Type(type: Rate::class)]
        #[Groups(['read_bottle_collection'])]
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
        #[Groups(['read_bottle_collection'])]
        public ?string $picturePath = null,
        #[ApiProperty]
        #[Groups(['read_bottle_collection'])]
        public ?\DateTime $saveAt = null,
        #[ApiProperty]
        public ?\DateTime $tastedAt = null,
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
            picturePath: $bottle->picture()?->path() ?? null,
            saveAt: $bottle->savedAt() !== null ? new \DateTime($bottle->savedAt()->dateUs()) : null,
        );
    }
}
