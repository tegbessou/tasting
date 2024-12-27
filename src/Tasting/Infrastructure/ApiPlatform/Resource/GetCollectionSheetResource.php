<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\Resource;

use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\GetCollection;
use App\Tasting\Application\ReadModel\Sheet;
use App\Tasting\Infrastructure\ApiPlatform\OpenApi\SheetFilter;
use App\Tasting\Infrastructure\ApiPlatform\State\Provider\GetSheetCollectionProvider;
use Symfony\Component\Uid\Uuid;

#[ApiResource(
    shortName: 'Sheet',
)]
#[GetCollection(
    uriTemplate: '/sheets',
    filters: [SheetFilter::class],
    provider: GetSheetCollectionProvider::class,
)]
final readonly class GetCollectionSheetResource
{
    public function __construct(
        #[ApiProperty(identifier: true)]
        public ?Uuid $id,
        public string $tastingId,
        public string $participantId,
        public string $participantFullName,
    ) {
    }

    public static function fromDomain(Sheet $sheet): self
    {
        return new self(
            new Uuid($sheet->id),
            $sheet->tastingId,
            $sheet->participantId,
            $sheet->participantFullName,
        );
    }
}
