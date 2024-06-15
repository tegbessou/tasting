<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240614133504 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE owner (
          id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\',
          email VARCHAR(255) NOT NULL,
          full_name VARCHAR(255) NOT NULL,
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE bottle CHANGE owner_id owner_id BINARY(16) DEFAULT NULL COMMENT \'(DC2Type:uuid)\'');
        $this->addSql('ALTER TABLE
          bottle
        ADD
          CONSTRAINT FK_ACA9A9557E3C61F9 FOREIGN KEY (owner_id) REFERENCES owner (id)');
        $this->addSql('CREATE INDEX IDX_ACA9A9557E3C61F9 ON bottle (owner_id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE bottle DROP FOREIGN KEY FK_ACA9A9557E3C61F9');
        $this->addSql('DROP TABLE owner');
        $this->addSql('DROP INDEX IDX_ACA9A9557E3C61F9 ON bottle');
        $this->addSql('ALTER TABLE bottle CHANGE owner_id owner_id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\'');
    }
}
