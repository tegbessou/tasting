<?php

declare(strict_types=1);

namespace DataFixtures\Tasting;

use App\Tasting\Domain\Enum\TastingInvitationStatus;
use App\Tasting\Domain\Service\GetInvitationLink;
use App\Tasting\Infrastructure\Doctrine\Entity\Invitation;
use App\Tasting\Infrastructure\Doctrine\Entity\Tasting;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Persistence\ObjectManager;

final class InvitationFixtures extends Fixture implements DependentFixtureInterface
{
    #[\Override]
    public function load(ObjectManager $manager): void
    {
        $tasting = $manager
            ->getRepository(Tasting::class)
            ->find('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537')
        ;

        $invitation = new Invitation(
            'abed2f69-9aae-4d92-a91c-edfa7c985674',
            $tasting,
            'root@gmail.com',
            GetInvitationLink::getLink()->value(),
            TastingInvitationStatus::PENDING,
            new \DateTimeImmutable(),
        );

        $manager->persist($invitation);
        $manager->flush();
    }

    #[\Override]
    public function getDependencies(): array
    {
        return [
            TastingFixtures::class,
        ];
    }
}
