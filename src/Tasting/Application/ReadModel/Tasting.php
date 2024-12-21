<?php

declare(strict_types=1);

namespace App\Tasting\Application\ReadModel;

use Doctrine\ODM\MongoDB\Mapping\Annotations as MongoDB;

#[MongoDB\Document]
class Tasting
{
    public function __construct(
        #[MongoDB\Id(strategy: 'UUID')]
        public string $id,
        #[MongoDB\Field(type: 'hash')]
        public array $participants,
        #[MongoDB\Field(type: 'string')]
        public string $bottleName,
        #[MongoDB\Field(type: 'string')]
        public string $bottleWineType,
        #[MongoDB\Field(type: 'string')]
        public string $ownerId,
        #[MongoDB\Field(type: 'string')]
        public string $ownerName,
    ) {}
}