<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240207105701 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE
          bottle
        CHANGE
          country country VARCHAR(255) DEFAULT NULL,
        CHANGE
          price price DOUBLE PRECISION DEFAULT NULL,
        CHANGE
          picture picture VARCHAR(255) DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE
          bottle
        CHANGE
          country country VARCHAR(255) NOT NULL,
        CHANGE
          price price DOUBLE PRECISION NOT NULL,
        CHANGE
          picture picture VARCHAR(255) NOT NULL');
    }
}
