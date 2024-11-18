<?php

declare(strict_types=1);

namespace AdapterTest\ContractTest\Country\Infrastructure\Doctrine\Adapter;

use App\Country\Application\Adapter\CountryAdapterInterface;
use Doctrine\ODM\MongoDB\DocumentManager;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

final class CountryDoctrineAdapterTest extends KernelTestCase
{
    private readonly CountryAdapterInterface $countryAdapter;

    private readonly DocumentManager $documentManager;

    #[\Override]
    protected function setUp(): void
    {
        self::bootKernel();

        $container = self::getContainer();
        $this->countryAdapter = $container->get(CountryAdapterInterface::class);
        $this->documentManager = $container->get(DocumentManager::class);
    }

    public function testOfName(): void
    {
        $this->assertNotNull(
            $this->countryAdapter->ofName('France'),
        );
    }

    public function testOfNameNull(): void
    {
        $this->assertNull(
            $this->countryAdapter->ofName('Taboulistan'),
        );
    }
}
