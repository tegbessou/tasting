<?php

declare(strict_types=1);

namespace App\Bottle\Infrastructure\ApiPlatform\State\Processor;

use ApiPlatform\Metadata\Operation;
use ApiPlatform\State\ProcessorInterface;
use ApiPlatform\Symfony\Validator\Exception\ValidationException;
use App\Bottle\Application\Command\CreateBottleCommand;
use App\Bottle\Domain\Enum\Rate;
use App\Bottle\Domain\Enum\WineType;
use App\Bottle\Domain\Exception\BottleCreationCountryDoesntExistException;
use App\Bottle\Domain\Exception\BottleCreationGrapeVarietiesDoesntExistException;
use App\Bottle\Domain\Exception\BottleOwnerDoesntExistException;
use App\Bottle\Infrastructure\ApiPlatform\Resource\BottleResource;
use App\Shared\Application\Command\CommandBusInterface;
use App\Shared\Infrastructure\Webmozart\Assert;
use Symfony\Component\Validator\ConstraintViolation;
use Symfony\Component\Validator\ConstraintViolationList;
use Symfony\Contracts\Translation\TranslatorInterface;

/**
 * @implements ProcessorInterface<BottleResource, void>
 */
final readonly class CreateBottleProcessor implements ProcessorInterface
{
    public function __construct(
        private CommandBusInterface $commandBus,
        private TranslatorInterface $translator,
    ) {
    }

    #[\Override]
    public function process(mixed $data, Operation $operation, array $uriVariables = [], array $context = []): void
    {
        Assert::isInstanceOf($data, BottleResource::class);
        Assert::notNull($data->name);
        Assert::notNull($data->estateName);
        Assert::notNull($data->type);
        Assert::isInstanceOf($data->type, WineType::class);
        Assert::notNull($data->year);
        Assert::year($data->year);
        Assert::notNull($data->grapeVarieties);
        Assert::notNull($data->rate);
        Assert::isInstanceOf($data->rate, Rate::class);
        Assert::notNull($data->picture);
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
                    $data->type->value,
                    $data->year,
                    $data->grapeVarieties,
                    $data->rate->value,
                    $data->picture,
                    $data->ownerId,
                    $data->country,
                    $data->price,
                ),
            );
        } catch (BottleOwnerDoesntExistException $exception) {
            throw new ValidationException($this->buildOwnerDoesntExistViolation($exception->ownerId));
        } catch (BottleCreationCountryDoesntExistException $exception) {
            throw new ValidationException($this->buildCountryDoesntExistViolation($exception->country));
        } catch (BottleCreationGrapeVarietiesDoesntExistException $exception) {
            throw new ValidationException($this->buildGrapeVarietiesDoesntExistViolations($exception->grapeVarieties));
        }
    }

    private function buildOwnerDoesntExistViolation(
        string $ownerId,
    ): ConstraintViolationList {
        $violations = new ConstraintViolationList();
        $violations->add(new ConstraintViolation(
            $this->translator->trans(
                'bottle.owner.doesnt_exist',
                ['id' => $ownerId],
                'validators'
            ),
            null,
            [],
            $ownerId,
            'ownerId',
            $ownerId
        ));

        return $violations;
    }

    private function buildCountryDoesntExistViolation(
        string $country = null,
    ): ConstraintViolationList {
        $violations = new ConstraintViolationList();
        $violations->add(new ConstraintViolation(
            $this->translator->trans(
                'bottle.country.doesnt_exist',
                ['country' => $country],
                'validators'
            ),
            null,
            [],
            $country,
            'country',
            $country
        ));

        return $violations;
    }

    private function buildGrapeVarietiesDoesntExistViolations(
        array $grapeVarieties,
    ): ConstraintViolationList {
        $grapeVarietiesString = implode(', ', $grapeVarieties);

        $violations = new ConstraintViolationList();
        $violations->add(new ConstraintViolation(
            $this->translator->trans(
                'bottle.grape_varieties.doesnt_exist',
                ['grapeVarieties' => count($grapeVarieties), 'grapeVarietiesString' => $grapeVarietiesString],
                'validators',
            ),
            null,
            [],
            $grapeVarietiesString,
            'grapeVarieties',
            $grapeVarietiesString
        ));

        return $violations;
    }
}
