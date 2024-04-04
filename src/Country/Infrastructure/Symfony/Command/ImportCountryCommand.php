<?php

declare(strict_types=1);

namespace App\Country\Infrastructure\Symfony\Command;

use App\Country\Application\Command\CreateCountryCommand;
use App\Country\Domain\Exception\CountryAlreadyExistsException;
use App\Shared\Application\Command\CommandBusInterface;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;

#[AsCommand('country:import', description: 'Import countries from csv file')]
final class ImportCountryCommand extends Command
{
    private const PATH_FILE_TO_COUNTRY = '/assets/files/countries.csv';

    public function __construct(
        private readonly string $kernelProjectDirectory,
        private readonly CommandBusInterface $commandBus,
        ?string $name = null,
    ) {
        parent::__construct($name);
    }

    #[\Override]
    public function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);

        if (!file_exists($this->getFilePath())) {
            $io->error(
                sprintf('File at path %s not found', $this->getFilePath())
            );

            return Command::FAILURE;
        }

        try {
            $countryCreated = $this->handleFile();
        } catch (\RuntimeException $e) {
            $io->error(
                sprintf('Unable to open file: %s !', $e->getMessage())
            );

            return Command::FAILURE;
        } catch (CountryAlreadyExistsException) {
            $io->error('An error occurred du to country duplication in database !');

            return Command::FAILURE;
        }

        $io->success(
            sprintf('Countries created: %d !', $countryCreated)
        );

        return Command::SUCCESS;
    }

    private function getFilePath(): string
    {
        return sprintf('%s%s', $this->kernelProjectDirectory, self::PATH_FILE_TO_COUNTRY);
    }

    private function handleFile(): int
    {
        $countryCreated = 0;
        $handle = fopen($this->getFilePath(), 'r');

        if ($handle === false) {
            throw new \RuntimeException('Unable to open file');
        }

        while (($data = fgetcsv($handle, 1000)) !== false) {
            $this->commandBus->dispatch(new CreateCountryCommand($data[4]));
            ++$countryCreated;
        }
        fclose($handle);

        return $countryCreated;
    }
}
