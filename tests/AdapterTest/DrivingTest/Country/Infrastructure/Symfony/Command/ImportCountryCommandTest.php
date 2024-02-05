<?php

declare(strict_types=1);

namespace AdapterTest\DrivingTest\Country\Infrastructure\Symfony\Command;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Console\Application;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Symfony\Component\Console\Tester\CommandTester;

final class ImportCountryCommandTest extends KernelTestCase
{
    public function testExecute(): void
    {
        self::bootKernel();
        $entityManager = self::getContainer()->get(EntityManagerInterface::class);
        $entityManager->getConnection()->executeQuery('DELETE FROM country');

        $application = new Application(self::$kernel);

        $command = $application->find('country:import');
        $commandTester = new CommandTester($command);
        $commandTester->execute([]);

        $commandTester->assertCommandIsSuccessful();

        $output = $commandTester->getDisplay();
        $this->assertStringContainsString('[OK] Countries created: 241', $output);
    }

    public function testExecuteFailedBecauseCountryAlreadyExists(): void
    {
        self::bootKernel();
        $application = new Application(self::$kernel);

        $command = $application->find('country:import');
        $commandTester = new CommandTester($command);
        $commandTester->execute([]);

        $output = $commandTester->getDisplay();
        $this->assertStringContainsString('[ERROR] An error occurred du to country duplication in database', $output);
    }
}
