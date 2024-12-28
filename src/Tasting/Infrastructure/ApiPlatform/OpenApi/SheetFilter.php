<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\ApiPlatform\OpenApi;

use ApiPlatform\Metadata\FilterInterface;
use Symfony\Component\PropertyInfo\Type;

final readonly class SheetFilter implements FilterInterface
{
    #[\Override]
    public function getDescription(string $resourceClass): array
    {
        return [
            'tastingId' => [
                'property' => 'tastingId',
                'type' => Type::BUILTIN_TYPE_STRING,
                'required' => false,
            ],
            'participant' => [
                'property' => 'participant',
                'type' => Type::BUILTIN_TYPE_STRING,
                'required' => false,
            ],
        ];
    }
}
