<?php

declare(strict_types=1);

namespace DataFixtures\Tasting;

use App\Tasting\Domain\Entity\Invitation;
use App\Tasting\Domain\Entity\Participant;
use App\Tasting\Domain\Entity\Tasting;
use App\Tasting\Domain\Service\GetInvitationLinkService;
use App\Tasting\Domain\ValueObject\InvitationId;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Persistence\ObjectManager;

final class InvitationFixtures extends Fixture implements DependentFixtureInterface
{
    #[\Override]
    public function load(ObjectManager $manager): void
    {
        $participantRoot = $manager
            ->getRepository(Participant::class)
            ->find('c9350812-3f30-4fa4-8580-295ca65a4451')
        ;

        $tasting = $manager
            ->getRepository(Tasting::class)
            ->find('2ea56c35-8bb9-4c6e-9a49-bd79c5f11537')
        ;

        $invitation = Invitation::create(
            InvitationId::fromString('abed2f69-9aae-4d92-a91c-edfa7c985674'),
            $tasting,
            $participantRoot,
            GetInvitationLinkService::getLink(),
        );

        $manager->persist($invitation);
        $manager->flush();
    }

    #[\Override]
    public function getDependencies(): array
    {
        return [
            TastingFixtures::class,
            ParticipantFixtures::class,
        ];
    }
}
