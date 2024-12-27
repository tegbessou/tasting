<?php

declare(strict_types=1);

namespace App\Tasting\Application\ReadModel;

use Doctrine\ODM\MongoDB\Mapping\Annotations as MongoDB;

#[MongoDB\Document]
class Sheet
{
    public function __construct(
        #[MongoDB\Id(strategy: 'UUID')]
        public string $id,
        #[MongoDB\Field(type: 'string')]
        public string $tastingId,
        #[MongoDB\Field(type: 'string')]
        public string $participantId,
        #[MongoDB\Field(type: 'string')]
        public string $participantFullName,
    ) {}
}