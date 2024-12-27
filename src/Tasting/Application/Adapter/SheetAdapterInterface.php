<?php

declare(strict_types=1);

namespace App\Tasting\Application\Adapter;

use App\Tasting\Application\ReadModel\Sheet;
use TegCorp\SharedKernelBundle\Domain\Repository\RepositoryInterface;

/**
 * @extends RepositoryInterface<Sheet>
 */
interface SheetAdapterInterface extends RepositoryInterface
{
    public function ofId(string $id): ?Sheet;

    public function add(Sheet $sheet): void;

    public function withTasting(string $tastingId): SheetAdapterInterface;

    public function withParticipant(string $participantId): SheetAdapterInterface;

    public function update(Sheet $sheet): void;
}
