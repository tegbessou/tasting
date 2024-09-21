<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Service;

use App\BottleInventory\Domain\Event\BottleTasted;

interface MessageBrokerInterface
{
    public function dispatchBottleTastedMessage(BottleTasted $event): void;
}
