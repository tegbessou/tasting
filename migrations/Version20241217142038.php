<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20241217142038 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE country (
          id BINARY(16) NOT NULL,
          name VARCHAR(255) NOT NULL,
          UNIQUE INDEX UNIQ_5373C9665E237E06 (name),
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER
        SET
          utf8mb4');
        $this->addSql('CREATE TABLE invitation (
          id BINARY(16) NOT NULL,
          target VARCHAR(255) NOT NULL,
          link LONGTEXT NOT NULL,
          status VARCHAR(10) NOT NULL,
          created_at DATETIME DEFAULT NULL,
          sent_at DATETIME DEFAULT NULL,
          updated_at DATETIME DEFAULT NULL,
          tasting_id BINARY(16) DEFAULT NULL,
          INDEX IDX_F11D61A25BC0FE1E (tasting_id),
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER
        SET
          utf8mb4');
        $this->addSql('CREATE TABLE tasting (
          id BINARY(16) NOT NULL,
          bottle_name VARCHAR(255) NOT NULL,
          participants JSON NOT NULL,
          owner_id VARCHAR(255) NOT NULL,
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER
        SET
          utf8mb4');
        $this->addSql('ALTER TABLE
          invitation
        ADD
          CONSTRAINT FK_F11D61A25BC0FE1E FOREIGN KEY (tasting_id) REFERENCES tasting (id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE invitation DROP FOREIGN KEY FK_F11D61A25BC0FE1E');
        $this->addSql('DROP TABLE country');
        $this->addSql('DROP TABLE invitation');
        $this->addSql('DROP TABLE tasting');
    }
}
