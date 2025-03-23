<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Infrastructure\ApiPlatform\OpenApi;

use ApiPlatform\Metadata\FilterInterface;
use Symfony\Component\PropertyInfo\Type;

final readonly class InvitationFilter implements FilterInterface
{
    #[\Override]
    public function getDescription(string $resourceClass): array
    {
        return [
            'target.id' => [
                'property' => 'target.id',
                'type' => Type::BUILTIN_TYPE_STRING,
                'required' => false,
            ],
        ];
    }
}
