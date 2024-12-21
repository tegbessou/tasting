<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20241220165416 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE
          tasting
        ADD
          bottle_wine_type ENUM(
            \'red\', \'white\', \'rosé\', \'orange\',
            \'champagne\', \'sparkling\'
          ) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE tasting DROP bottle_wine_type');
    }
}
