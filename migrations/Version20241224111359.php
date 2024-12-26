<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20241224111359 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE sheet (
          id BINARY(16) NOT NULL,
          tasting_id VARCHAR(255) NOT NULL,
          participant VARCHAR(255) NOT NULL,
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER
        SET
          utf8mb4');
        $this->addSql('ALTER TABLE eye DROP FOREIGN KEY FK_727887B15BC0FE1E');
        $this->addSql('DROP INDEX IDX_727887B15BC0FE1E ON eye');
        $this->addSql('ALTER TABLE eye DROP participant, CHANGE tasting_id sheet_id BINARY(16) DEFAULT NULL');
        $this->addSql('ALTER TABLE
          eye
        ADD
          CONSTRAINT FK_727887B18B1206A5 FOREIGN KEY (sheet_id) REFERENCES sheet (id)');
        $this->addSql('CREATE INDEX IDX_727887B18B1206A5 ON eye (sheet_id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('DROP TABLE sheet');
        $this->addSql('ALTER TABLE eye DROP FOREIGN KEY FK_727887B18B1206A5');
        $this->addSql('DROP INDEX IDX_727887B18B1206A5 ON eye');
        $this->addSql('ALTER TABLE
          eye
        ADD
          participant VARCHAR(255) NOT NULL,
        CHANGE
          sheet_id tasting_id BINARY(16) DEFAULT NULL');
        $this->addSql('ALTER TABLE
          eye
        ADD
          CONSTRAINT FK_727887B15BC0FE1E FOREIGN KEY (tasting_id) REFERENCES tasting (id)');
        $this->addSql('CREATE INDEX IDX_727887B15BC0FE1E ON eye (tasting_id)');
    }
}
