<?php

declare(strict_types=1);

namespace App\BottleInventory\Application\Service;

use App\BottleInventory\Domain\Event\BottleTastedEvent;

interface MessageBrokerServiceInterface
{
    public function dispatchBottleTastedMessage(BottleTastedEvent $event): void;
}
