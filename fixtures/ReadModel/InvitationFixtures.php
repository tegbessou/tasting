<?php

declare(strict_types=1);

namespace EmpireDesAmis\Tasting\DataFixtures\ReadModel;

use Doctrine\Bundle\MongoDBBundle\Fixture\Fixture;
use Doctrine\Persistence\ObjectManager;
use EmpireDesAmis\Tasting\Application\ReadModel\Invitation;
use EmpireDesAmis\Tasting\Domain\Service\GetInvitationLink;

final class InvitationFixtures extends Fixture
{
    #[\Override]
    public function load(ObjectManager $manager): void
    {
        $invitation = new Invitation(
            'abed2f69-9aae-4d92-a91c-edfa7c985674',
            '2ea56c35-8bb9-4c6e-9a49-bd79c5f11537',
            'Domaine Leflaive Montrachet Grand Cru 2016',
            'hugues.gobet@gmail.com',
            'Pedor',
            'root@gmail.com',
            GetInvitationLink::getLink()->value(),
            new \DateTimeImmutable(),
            'Pedor',
        );

        $manager->persist($invitation);
        $manager->flush();
    }
}
