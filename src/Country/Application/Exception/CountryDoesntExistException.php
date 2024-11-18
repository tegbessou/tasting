<?php

declare(strict_types=1);

namespace App\Country\Application\Exception;

final class CountryDoesntExistException extends \Exception
{
    public function __construct(string $countryName)
    {
        parent::__construct(sprintf('Country with name %s doesnt exist', $countryName));
    }
}
