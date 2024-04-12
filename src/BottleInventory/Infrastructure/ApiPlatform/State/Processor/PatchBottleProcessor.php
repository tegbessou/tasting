<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Symfony\Validator\Exception\ValidationException;
use App\BottleInventory\Application\Command\UpdateBottleCommand;
use App\BottleInventory\Domain\Enum\Rate;
use App\BottleInventory\Domain\Enum\WineType;
use App\BottleInventory\Domain\Exception\BottleCountryDoesntExistException;
use App\BottleInventory\Domain\Exception\BottleGrapeVarietiesDoesntExistException;
use App\BottleInventory\Domain\Exception\UpdateBottleDoesntExistException;
use App\BottleInventory\Domain\Exception\UpdateBottleNotAuthorizeForThisUserException;
use App\BottleInventory\Infrastructure\ApiPlatform\Resource\BottleResource;
use App\BottleInventory\Infrastructure\Symfony\Validator\ConstraintViolation\BuildCountryDoesntExistConstraintViolation;
use App\BottleInventory\Infrastructure\Symfony\Validator\ConstraintViolation\BuildGrapeVarietiesDoesntExistConstraintViolation;
use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @implements ProcessorInterface<BottleResource, void>
 */
final readonly class PatchBottleProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private BuildCountryDoesntExistConstraintViolation $buildCountryDoesntExistConstraintViolation,
        private BuildGrapeVarietiesDoesntExistConstraintViolation $buildGrapeVarietiesDoesntExistConstraintViolation,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::isInstanceOf($data, BottleResource::class);
        Assert::notNull($data->id);
        Assert::notNull($data->name);
        Assert::notNull($data->estateName);
        Assert::notNull($data->wineType);
        Assert::isInstanceOf($data->wineType, WineType::class);
        Assert::notNull($data->year);
        Assert::year($data->year);
        Assert::notNull($data->grapeVarieties);
        Assert::notNull($data->rate);
        Assert::isInstanceOf($data->rate, Rate::class);

        try {
            $this->commandBus->dispatch(
                new UpdateBottleCommand(
                    $data->id->__toString(),
                    $data->name,
                    $data->estateName,
                    $data->wineType->value,
                    $data->year,
                    $data->grapeVarieties,
                    $data->rate->value,
                    $data->country,
                    $data->price
                ),
            );
        } catch (UpdateBottleDoesntExistException) {
            throw new NotFoundHttpException();
        } catch (UpdateBottleNotAuthorizeForThisUserException) {
            throw new AccessDeniedHttpException();
        } catch (BottleCountryDoesntExistException $exception) {
            throw new ValidationException($this->buildCountryDoesntExistConstraintViolation->build($exception->country));
        } catch (BottleGrapeVarietiesDoesntExistException $exception) {
            throw new ValidationException($this->buildGrapeVarietiesDoesntExistConstraintViolation->build($exception->grapeVarieties));
        }
    }
}
