<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240617165906 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE participant (
          id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\',
          email VARCHAR(255) NOT NULL,
          full_name VARCHAR(255) NOT NULL,
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tasting (
          id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\',
          owner_id BINARY(16) DEFAULT NULL COMMENT \'(DC2Type:uuid)\',
          bottle_id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\',
          participants JSON NOT NULL COMMENT \'(DC2Type:json)\',
          UNIQUE INDEX UNIQ_73621810DCF9352B (bottle_id),
          INDEX IDX_736218107E3C61F9 (owner_id),
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE
          tasting
        ADD
          CONSTRAINT FK_736218107E3C61F9 FOREIGN KEY (owner_id) REFERENCES participant (id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE tasting DROP FOREIGN KEY FK_736218107E3C61F9');
        $this->addSql('DROP TABLE participant');
        $this->addSql('DROP TABLE tasting');
    }
}
