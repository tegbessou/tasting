<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\BottleInventory\Http\Client;

use Symfony\Contracts\HttpClient\HttpClientInterface;

final readonly class BottleInventoryHttpClient implements BottleInventoryHttpClientInterface
{
    public function __construct(
        private HttpClientInterface $bottleApi,
        private string $emailTastingUserService,
        private string $passwordTastingUserService,
    ) {
    }

    #[\Override]
    public function ofId(string $id): array
    {
        return json_decode($this->bottleApi->request('GET', sprintf('%s/%s', BottleInventoryHttpClientInterface::BOTTLE_URI, $id), [
            'headers' => [
                'Authorization' => sprintf('Bearer %s', $this->getAuthorizeToken()),
                'RequestHeaderIdentityProvider' => $this->getAuthorityProvider(),
            ],
        ])->getContent(), true);
    }

    private function getAuthorizeToken(): string
    {
        $response = json_decode($this->bottleApi->request('POST', BottleInventoryHttpClientInterface::USER_LOGIN_URI, [
            'json' => [
                'email' => $this->emailTastingUserService,
                'password' => $this->passwordTastingUserService,
            ],
        ])->getContent(), true);

        return $response['token'];
    }

    private function getAuthorityProvider(): string
    {
        return self::AUTHORITY_PROVIDER_FIREBASE;
    }
}
