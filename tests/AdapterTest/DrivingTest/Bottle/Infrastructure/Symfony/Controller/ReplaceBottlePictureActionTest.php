<?php

declare(strict_types=1);

namespace App\Tests\AdapterTest\DrivingTest\Bottle\Infrastructure\Symfony\Controller;

use App\Tests\Shared\ApiTestCase;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Query\ResultSetMapping;
use PHPUnit\Framework\ExpectationFailedException;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Finder\Finder;
use Symfony\Component\HttpFoundation\File\UploadedFile;

final class ReplaceBottlePictureActionTest extends ApiTestCase
{
    private EntityManagerInterface $entityManager;

    #[\Override]
    public function setUp(): void
    {
        static::bootKernel();

        $container = static::getContainer();
        $this->entityManager = $container->get(EntityManagerInterface::class);

        parent::setUp();
    }

    #[\Override]
    protected function tearDown(): void
    {
        $this->revertUploadFile('cote-rotie*.png');

        parent::tearDown();
    }

    public function testUpdateBottlePicture(): void
    {
        $uploadedFile = new UploadedFile(
            __DIR__.'/../../../../../../../fixtures/images/bottle/cote-rotie.png',
            'cote-rotie.png',
        );

        $this->postFile('/api/bottles/635e809c-aaaf-40df-8483-83cfbe2c5504/pictures', [
            'picture' => $uploadedFile,
        ]);

        $this->assertResponseIsSuccessful();
        $this->assertResponseStatusCodeSame(204);
        $this->assertFileExistsWithPartialName('cote-rotie*.png');

        $query = $this->entityManager->createNativeQuery('UPDATE bottle SET picture = null WHERE id = :id', new ResultSetMapping());
        $query->setParameter('id', '635e809c-aaaf-40df-8483-83cfbe2c5504');
        $query->execute();
    }

    public function testUpdateBottlePictureBottleNotFound(): void
    {
        $uploadedFile = new UploadedFile(
            __DIR__.'/../../../../../../../fixtures/images/bottle/cote-rotie.png',
            'cote-rotie.png',
        );

        $this->postFile('/api/bottles/1db0e325-0498-4f0b-963a-ddc2f6303622/pictures', [
            'picture' => $uploadedFile,
        ]);

        $this->assertResponseStatusCodeSame(404);
    }

    public function testUpdateBottlePictureBottleNotAuthorizeBecauseBottleIsOwnByOtherUser(): void
    {
        $uploadedFile = new UploadedFile(
            __DIR__.'/../../../../../../../fixtures/images/bottle/cote-rotie.png',
            'cote-rotie.png',
        );

        $this->postFile('/api/bottles/97102d4c-da46-4105-8c34-53f5a2e1e9fa/pictures', [
            'picture' => $uploadedFile,
        ]);

        $this->assertResponseStatusCodeSame(403);
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
