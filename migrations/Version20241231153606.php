<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20241231153606 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE nose (
          id BINARY(16) NOT NULL,
          impression VARCHAR(255) NOT NULL,
          intensite VARCHAR(255) NOT NULL,
          arome VARCHAR(255) NOT NULL,
          observation LONGTEXT NOT NULL,
          sheet_id BINARY(16) DEFAULT NULL,
          UNIQUE INDEX UNIQ_80FC6CD38B1206A5 (sheet_id),
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER
        SET
          utf8mb4');
        $this->addSql('ALTER TABLE
          nose
        ADD
          CONSTRAINT FK_80FC6CD38B1206A5 FOREIGN KEY (sheet_id) REFERENCES sheet (id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE nose DROP FOREIGN KEY FK_80FC6CD38B1206A5');
        $this->addSql('DROP TABLE nose');
    }
}
