<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\BottleInventory\Http\Repository;

use App\Tasting\Domain\Repository\BottleReadRepositoryInterface;
use App\Tasting\Domain\ValueObject\Bottle;
use App\Tasting\Domain\ValueObject\BottleId;
use App\Tasting\Infrastructure\BottleInventory\Http\Client\BottleInventoryHttpClient;
use App\Tasting\Infrastructure\BottleInventory\Translator\BottleTranslator;

final readonly class BottleReadHttpRepository implements BottleReadRepositoryInterface
{
    public function __construct(
        private BottleInventoryHttpClient $bottleInventoryHttpClient,
    ) {
    }

    #[\Override]
    public function ofId(BottleId $bottleId): ?Bottle
    {
        return BottleTranslator::toBottle(
            $this->bottleInventoryHttpClient->ofId($bottleId->id()),
        );
    }
}
