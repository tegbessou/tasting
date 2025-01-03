<?php

declare(strict_types=1);

namespace App\Tasting\Infrastructure\Doctrine\Entity;

use App\Tasting\Domain\Enum\TastingInvitationStatus;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
final class Invitation
{
    public function __construct(
        #[ORM\Id]
        #[ORM\Column(name: 'id', type: 'uuid', unique: true)]
        public string $id,
        #[ORM\ManyToOne(targetEntity: Tasting::class, inversedBy: 'invitations')]
        #[ORM\JoinColumn(name: 'tasting_id', referencedColumnName: 'id', nullable: false)]
        public ?Tasting $subject,
        #[ORM\Column(name: 'target', type: 'string')]
        public string $targetId,
        #[ORM\Column(name: 'link', type: 'text', nullable: false)]
        public string $link,
        #[ORM\Column(name: 'status', type: 'string', length: 10, nullable: false, enumType: TastingInvitationStatus::class)]
        public TastingInvitationStatus $status,
        #[ORM\Column(name: 'created_at', type: 'datetime_immutable', nullable: true)]
        public ?\DateTimeImmutable $createdAt,
        #[ORM\Column(name: 'sent_at', type: 'datetime_immutable', nullable: true)]
        public ?\DateTimeImmutable $sentAt = null,
        #[ORM\Column(name: 'updated_at', type: 'datetime_immutable', nullable: true)]
        public ?\DateTimeImmutable $updatedAt = null,
    ) {
    }
}
