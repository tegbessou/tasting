<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Symfony\Messenger\Serializer;

use App\Tasting\Infrastructure\Symfony\Messenger\ExternalMessage\BottleTastedMessage;
use Symfony\Component\Messenger\Envelope;
use Symfony\Component\Messenger\Transport\Serialization\SerializerInterface;

final class ExternalMessageSerializer implements SerializerInterface
{
    private const BOTTLE_TASTED_MESSAGE = 'BottleTastedMessage';

    #[\Override]
    public function decode(array $encodedEnvelope): Envelope
    {
        $body = $encodedEnvelope['body'];
        $headers = $encodedEnvelope['headers'];
        $data = json_decode((string) $body, true);

        if (str_contains((string) $headers['type'], self::BOTTLE_TASTED_MESSAGE)) {
            return new Envelope(new BottleTastedMessage(
                $data['bottleId'],
                $data['ownerEmail'],
            ));
        }

        throw new \LogicException('Message type not supported');
    }

    #[\Override]
    public function encode(Envelope $envelope): array
    {
        throw new \LogicException('Transport & serializer not meant for sending messages');
    }
}
