<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20250102173445 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE mouth (
          id BINARY(16) NOT NULL,
          alcool VARCHAR(255) NOT NULL,
          acide VARCHAR(255) NOT NULL,
          matiere VARCHAR(255) NOT NULL,
          finale VARCHAR(255) NOT NULL,
          observation LONGTEXT NOT NULL,
          tanin VARCHAR(255) DEFAULT NULL,
          sucre VARCHAR(255) DEFAULT NULL,
          sheet_id BINARY(16) NOT NULL,
          UNIQUE INDEX UNIQ_9EC55C978B1206A5 (sheet_id),
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER
        SET
          utf8mb4');
        $this->addSql('ALTER TABLE
          mouth
        ADD
          CONSTRAINT FK_9EC55C978B1206A5 FOREIGN KEY (sheet_id) REFERENCES sheet (id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE mouth DROP FOREIGN KEY FK_9EC55C978B1206A5');
        $this->addSql('DROP TABLE mouth');
    }
}
