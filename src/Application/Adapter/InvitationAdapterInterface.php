<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\Application\Adapter;

use EmpireDesAmis\Tasting\Application\ReadModel\Invitation;
use TegCorp\SharedKernelBundle\Domain\Repository\RepositoryInterface;

/**
 * @extends RepositoryInterface<Invitation>
 */
interface InvitationAdapterInterface extends RepositoryInterface
{
    public function ofId(string $id): ?Invitation;

    public function add(Invitation $invitation): void;

    public function sortCreatedAt(): self;

    public function withTarget(string $targetId): InvitationAdapterInterface;

    public function withTargetAndSubject(string $targetId, string $subjectId): InvitationAdapterInterface;

    public function delete(Invitation $invitation): void;

    public function update(): void;
}
