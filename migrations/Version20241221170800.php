<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20241221170800 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE eye (
          id BINARY(16) NOT NULL,
          participant VARCHAR(255) NOT NULL,
          limpidite VARCHAR(255) NOT NULL,
          brillance VARCHAR(255) NOT NULL,
          intensite_couleur VARCHAR(255) NOT NULL,
          teinte VARCHAR(255) NOT NULL,
          larme VARCHAR(255) NOT NULL,
          observation LONGTEXT NOT NULL,
          tasting_id BINARY(16) DEFAULT NULL,
          INDEX IDX_727887B15BC0FE1E (tasting_id),
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER
        SET
          utf8mb4');
        $this->addSql('ALTER TABLE
          eye
        ADD
          CONSTRAINT FK_727887B15BC0FE1E FOREIGN KEY (tasting_id) REFERENCES tasting (id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE eye DROP FOREIGN KEY FK_727887B15BC0FE1E');
        $this->addSql('DROP TABLE eye');
    }
}
