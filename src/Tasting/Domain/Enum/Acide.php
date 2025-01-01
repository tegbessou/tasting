<?php

declare(strict_types=1);

namespace App\Tasting\Domain\Enum;

enum Acide: string
{
    case NERVEUSE = 'nerveuse';
    case PEINTRE = 'peintre';
    case VITE = 'vite';
    case FRAICHE = 'fraîche';
    case MOLLE = 'molle';
}
