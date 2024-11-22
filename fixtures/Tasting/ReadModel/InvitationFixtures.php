<?php

declare(strict_types=1);

namespace DataFixtures\Tasting\ReadModel;

use App\Tasting\Application\ReadModel\Invitation;
use App\Tasting\Domain\Service\GetInvitationLink;
use Doctrine\Bundle\MongoDBBundle\Fixture\Fixture;
use Doctrine\Persistence\ObjectManager;

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
            // todo changer ça
            'Pedor',
            'root@gmail.com',
            // todo changer ça
            GetInvitationLink::getLink()->value(),
            new \DateTimeImmutable(),
            'Pedor',
        );

        $manager->persist($invitation);
        $manager->flush();
    }
}
