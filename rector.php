<?php

declare(strict_types=1);

use Rector\Config\RectorConfig;
use Rector\Php81\Rector\Property\ReadOnlyPropertyRector;
use Rector\Php83\Rector\ClassConst\AddTypeToConstRector;
use Rector\TypeDeclaration\Rector\ClassMethod\AddVoidReturnTypeWhereNoReturnRector;

return RectorConfig::configure()
    ->withPaths([
        __DIR__.'/config',
        __DIR__.'/fixtures',
        __DIR__.'/public',
        __DIR__.'/src',
        __DIR__.'/tests',
    ])
    ->withPhpSets(true)
    ->withRules([
        AddVoidReturnTypeWhereNoReturnRector::class,
    ])
    ->withSkip([
        // I add this because deptrac bug if we type constant
        AddTypeToConstRector::class,
        // I add this because reflection need to update Owner Id so I can't make it readonly
        ReadOnlyPropertyRector::class => [
            __DIR__.'/src/BottleInventory/Domain/ValueObject/OwnerId.php',
            __DIR__.'/src/Tasting/Domain/ValueObject/ParticipantId.php',
            __DIR__.'/src/Tasting/Domain/ValueObject/TastingId.php',
        ],
    ]);
