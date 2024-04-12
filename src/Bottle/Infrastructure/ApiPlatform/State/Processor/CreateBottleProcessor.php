<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Symfony\Validator\Exception\ValidationException;
use App\Bottle\Application\Command\CreateBottleCommand;
use App\Bottle\Domain\Enum\Rate;
use App\Bottle\Domain\Enum\WineType;
use App\Bottle\Domain\Exception\BottleCountryDoesntExistException;
use App\Bottle\Domain\Exception\BottleGrapeVarietiesDoesntExistException;
use App\Bottle\Domain\Exception\BottleOwnerDoesntExistException;
use App\Bottle\Infrastructure\ApiPlatform\Resource\BottleResource;
use App\Bottle\Infrastructure\Symfony\Validator\ConstraintViolation\BuildCountryDoesntExistConstraintViolation;
use App\Bottle\Infrastructure\Symfony\Validator\ConstraintViolation\BuildGrapeVarietiesDoesntExistConstraintViolation;
use App\Bottle\Infrastructure\Symfony\Validator\ConstraintViolation\BuildOwnerDoesntExistConstraintViolation;
use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;

/**
 * @implements ProcessorInterface<BottleResource, void>
 */
final readonly class CreateBottleProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private BuildOwnerDoesntExistConstraintViolation $buildOwnerDoesntExistConstraintViolation,
        private BuildCountryDoesntExistConstraintViolation $buildCountryDoesntExistConstraintViolation,
        private BuildGrapeVarietiesDoesntExistConstraintViolation $buildGrapeVarietiesDoesntExistConstraintViolation,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::isInstanceOf($data, BottleResource::class);
        Assert::notNull($data->name);
        Assert::notNull($data->estateName);
        Assert::notNull($data->wineType);
        Assert::isInstanceOf($data->wineType, WineType::class);
        Assert::notNull($data->year);
        Assert::year($data->year);
        Assert::notNull($data->grapeVarieties);
        Assert::notNull($data->rate);
        Assert::isInstanceOf($data->rate, Rate::class);
        Assert::notNull($data->ownerId);
        Assert::uuid($data->ownerId);

        if ($data->price !== null) {
            Assert::positiveFloat($data->price);
        }

        try {
            $this->commandBus->dispatch(
                new CreateBottleCommand(
                    $data->name,
                    $data->estateName,
                    $data->wineType->value,
                    $data->year,
                    $data->grapeVarieties,
                    $data->rate->value,
                    $data->ownerId,
                    $data->country,
                    $data->price,
                ),
            );
        } catch (BottleOwnerDoesntExistException $exception) {
            throw new ValidationException($this->buildOwnerDoesntExistConstraintViolation->build($exception->ownerId));
        } catch (BottleCountryDoesntExistException $exception) {
            throw new ValidationException($this->buildCountryDoesntExistConstraintViolation->build($exception->country));
        } catch (BottleGrapeVarietiesDoesntExistException $exception) {
            throw new ValidationException($this->buildGrapeVarietiesDoesntExistConstraintViolation->build($exception->grapeVarieties));
        }
    }
}
