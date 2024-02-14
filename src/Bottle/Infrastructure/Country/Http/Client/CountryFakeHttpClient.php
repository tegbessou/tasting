<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\Country\Http\Client;

final readonly class CountryFakeHttpClient implements CountryHttpClientInterface
{
    #[\Override]
    public function ofName(string $name): array
    {
        if ($name === 'France') {
            return [
                [
                    'id' => 'a3951bea-ba9b-46e3-a3a7-74f5186f1020',
                    'name' => 'France',
                ],
            ];
        }

        return [];
    }
}
