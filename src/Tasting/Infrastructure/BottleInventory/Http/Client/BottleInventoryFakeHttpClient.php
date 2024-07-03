<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\BottleInventory\Http\Client;

final class BottleInventoryFakeHttpClient implements BottleInventoryHttpClientInterface
{
    #[\Override]
    public function ofId(string $id): array
    {
        if ($id === '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d') {
            return [
                'id' => '7bd55df3-e53c-410b-83a4-8e5ed9bcd50d',
                'name' => 'Château Margaux',
            ];
        }

        if ($id === '3a28deee-f221-4aa1-800b-6b5b27137bfc') {
            return [
                'id' => '3a28deee-f221-4aa1-800b-6b5b27137bfc',
                'name' => 'Domaine de la Romanée-Conti',
            ];
        }

        return [];
    }
}
