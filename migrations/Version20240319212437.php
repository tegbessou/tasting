<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240319212437 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE
          bottle
        ADD
          saved_at DATE NOT NULL COMMENT \'(DC2Type:date_immutable)\',
        ADD
          tasted_at DATE DEFAULT NULL COMMENT \'(DC2Type:date_immutable)\'
        ');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE bottle DROP saved_at, DROP tasted_at');
    }
}
