<?php

declare(strict_types=1);

namespace App\Tasting\Application\ReadModel;

use Doctrine\ODM\MongoDB\Mapping\Annotations as MongoDB;

#[MongoDB\Document]
class Invitation
{
    public function __construct(
        #[MongoDB\Id(strategy: 'UUID')]
        public string $id,
        #[MongoDB\Field(type: 'string')]
        public string $tastingId,
        #[MongoDB\Field(type: 'string')]
        public string $bottleName,
        #[MongoDB\Field(type: 'string')]
        public string $fromId,
        #[MongoDB\Field(type: 'string')]
        public string $fromName,
        #[MongoDB\Field(type: 'string')]
        public string $targetId,
        #[MongoDB\Field(type: 'string')]
        public string $link,
        #[MongoDB\Field(type: 'date_immutable')]
        public \DateTimeImmutable $createdAt,
        #[MongoDB\Field(type: 'string', nullable: true)]
        public ?string $targetName = null,
    ) {}
}