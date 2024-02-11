<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\Bottle\Infrastructure\Symfony\Controller;

use ApiPlatform\Symfony\Bundle\Test\ApiTestCase;
use PHPUnit\Framework\ExpectationFailedException;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Finder\Finder;
use Symfony\Component\HttpFoundation\File\UploadedFile;

final class PostBottlePictureActionTest extends ApiTestCase
{
    public function testUpdateBottlePicture(): void
    {
        $uploadedFile = new UploadedFile(
            __DIR__.'/../../../../../../../fixtures/images/bottle/cote-rotie.png',
            'cote-rotie.png',
        );

        $client = self::createClient();
        $client->request('POST', '/api/bottles/635e809c-aaaf-40df-8483-83cfbe2c5504/pictures', [
            'headers' => [
                'Content-Type' => 'multipart/form-data',
                'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
                'RequestHeaderIdentityProvider' => 'apple.com',
            ],
            'extra' => [
                'files' => [
                    'picture' => $uploadedFile,
                ],
            ],
        ]);

        $this->assertResponseIsSuccessful();
        $this->assertResponseStatusCodeSame(204);
        $this->assertFileExistsWithPartialName('cote-rotie*.png');
        $this->revertUploadFile('cote-rotie*.png');
    }

    public function testUpdateBottlePictureBottleNotFound(): void
    {
        $uploadedFile = new UploadedFile(
            __DIR__.'/../../../../../../../fixtures/images/bottle/cote-rotie.png',
            'cote-rotie.png',
        );

        $client = self::createClient();
        $client->request('POST', '/api/bottles/1db0e325-0498-4f0b-963a-ddc2f6303622/pictures', [
            'headers' => [
                'Content-Type' => 'multipart/form-data',
                'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
                'RequestHeaderIdentityProvider' => 'apple.com',
            ],
            'extra' => [
                'files' => [
                    'picture' => $uploadedFile,
                ],
            ],
        ]);

        $this->assertResponseStatusCodeSame(404);
        $this->revertUploadFile('cote-rotie*.png');
    }

    public function testUpdateBottlePictureBottleNotAuthorizeBecauseBottleIsOwnByOtherUser(): void
    {
        $uploadedFile = new UploadedFile(
            __DIR__.'/../../../../../../../fixtures/images/bottle/cote-rotie.png',
            'cote-rotie.png',
        );

        $client = self::createClient();
        $client->request('POST', '/api/bottles/97102d4c-da46-4105-8c34-53f5a2e1e9fa/pictures', [
            'headers' => [
                'Content-Type' => 'multipart/form-data',
                'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
                'RequestHeaderIdentityProvider' => 'apple.com',
            ],
            'extra' => [
                'files' => [
                    'picture' => $uploadedFile,
                ],
            ],
        ]);

        $this->assertResponseStatusCodeSame(403);
        $this->revertUploadFile('cote-rotie*.png');
    }

    private function revertUploadFile(
        string $name,
    ): void {
        $filesystem = new Filesystem();
        $finder = new Finder();

        $finder->files()->in('public/images/bottle/')->name($name);

        if (!$finder->hasResults()) {
            return;
        }

        foreach ($finder as $file) {
            $absoluteFilePath = $file->getRealPath();

            $filesystem->copy($absoluteFilePath, __DIR__.'/../../../../../../../fixtures/images/bottle/cote-rotie.png');
            $filesystem->remove($absoluteFilePath);
        }
    }

    private function assertFileExistsWithPartialName(
        string $name,
    ): void {
        $finder = new Finder();

        $finder->files()->in('public/images/bottle/')->name($name);

        if ($finder->hasResults()) {
            return;
        }

        throw new ExpectationFailedException(sprintf('Failed asserting that file with partial name "%s" exists.', $name));
    }
}
