<?php

declare(strict_types=1);

namespace App\BottleInventory\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Validator\Exception\ValidationException;
use App\BottleInventory\Application\Command\UpdateBottleCommand;
use App\BottleInventory\Application\Query\GetBottleQuery;
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
use App\Shared\Application\Query\QueryBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use Monolog\Attribute\WithMonologChannel;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @implements ProcessorInterface<BottleResource, void>
 */
#[WithMonologChannel('bottle_inventory')]
final readonly class PatchBottleProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private BuildCountryDoesntExistConstraintViolation $buildCountryDoesntExistConstraintViolation,
        private BuildGrapeVarietiesDoesntExistConstraintViolation $buildGrapeVarietiesDoesntExistConstraintViolation,
        private LoggerInterface $logger, private QueryBusInterface $queryBus,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): BottleResource
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
        } catch (UpdateBottleDoesntExistException $exception) {
            $this->logger->error(
                'Patch bottle: Bottle doesn\'t exist found',
                [
                    'bottleId' => $exception->bottleId,
                ],
            );

            throw new NotFoundHttpException();
        } catch (UpdateBottleNotAuthorizeForThisUserException) {
            $this->logger->error(
                'Patch bottle: User not authorized to update this bottle',
            );

            throw new AccessDeniedHttpException();
        } catch (BottleCountryDoesntExistException $exception) {
            $this->logger->error(
                'Patch bottle: Country doesn\'t exist',
                [
                    'bottleId' => $exception->country,
                ],
            );

            throw new ValidationException($this->buildCountryDoesntExistConstraintViolation->build($exception->country));
        } catch (BottleGrapeVarietiesDoesntExistException $exception) {
            $this->logger->error(
                'Patch bottle: Grape varieties doesn\'t exist',
                [
                    'bottleId' => $exception->grapeVarieties,
                ],
            );

            throw new ValidationException($this->buildGrapeVarietiesDoesntExistConstraintViolation->build($exception->grapeVarieties));
        }

        $bottle = $this->queryBus->ask(
            new GetBottleQuery($data->id->__toString())
        );

        if ($bottle === null) {
            throw new \LogicException();
        }

        return BottleResource::fromModel($bottle);
    }
}
