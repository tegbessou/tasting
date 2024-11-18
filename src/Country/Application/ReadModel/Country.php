<?php

declare(strict_types=1);

namespace App\Country\Application\ReadModel;

use Doctrine\ODM\MongoDB\Mapping\Annotations as MongoDB;

#[MongoDB\Document]
#[MongoDB\Index(keys: [
    'name' => 'text',
])]
class Country
{
    public function __construct(
        #[MongoDB\Id(strategy: 'UUID')]
        public string $id,
        #[MongoDB\Field(type: 'string')]
        public string $name,
    ) {
    }
}
