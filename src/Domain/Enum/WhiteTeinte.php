<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Domain\Enum;

enum WhiteTeinte: string
{
    case VERT = 'vert';
    case BLANC = 'blanc';
    case DORE = 'doré';
    case PAILLE = 'paille';
    case ROUX = 'roux';
}
