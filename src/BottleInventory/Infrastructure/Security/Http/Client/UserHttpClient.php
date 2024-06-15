<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\Security\Http\Client;

use Lexik\Bundle\JWTAuthenticationBundle\TokenExtractor\TokenExtractorInterface;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Contracts\HttpClient\HttpClientInterface;

final readonly class UserHttpClient implements UserHttpClientInterface
{
    public function __construct(
        private HttpClientInterface $userApi,
        private TokenExtractorInterface $tokenExtractor,
        private RequestStack $requestStack,
    ) {
    }

    #[\Override]
    public function ofEmail(string $email): array
    {
        if ($this->requestStack->getCurrentRequest() === null) {
            throw new \LogicException('Request not found');
        }

        return json_decode($this->userApi->request('GET', sprintf('%s/%s', UserHttpClientInterface::USER_URI, $email), [
            'headers' => [
                'Authorization' => sprintf('Bearer %s', $this->getAuthorizeToken()),
                'RequestHeaderIdentityProvider' => $this->getAuthorityProvider(),
            ],
        ])->getContent(), true);
    }

    private function getAuthorizeToken(): string
    {
        if ($this->requestStack->getCurrentRequest() === null) {
            throw new \LogicException('Request not found');
        }

        $token = $this->tokenExtractor->extract(
            $this->requestStack->getCurrentRequest(),
        );

        if ($token === false) {
            throw new \LogicException('Token not found');
        }

        return $token;
    }

    private function getAuthorityProvider(): string
    {
        if ($this->requestStack->getCurrentRequest() === null) {
            throw new \LogicException('Request not found');
        }

        if ($this->requestStack->getCurrentRequest()->headers->has(UserHttpClientInterface::HEADER_IDENTITY_PROVIDER) === false) {
            throw new \LogicException('Identity provider not found');
        }

        $authorityProvider = $this->requestStack->getCurrentRequest()->headers->get(UserHttpClientInterface::HEADER_IDENTITY_PROVIDER);

        if ($authorityProvider === null) {
            throw new \LogicException('Identity provider is null');
        }

        return $authorityProvider;
    }
}
