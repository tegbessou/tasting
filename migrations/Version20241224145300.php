<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20241224145300 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE
          eye
        DROP
          INDEX IDX_727887B18B1206A5,
        ADD
          UNIQUE INDEX UNIQ_727887B18B1206A5 (sheet_id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE eye DROP INDEX UNIQ_727887B18B1206A5, ADD INDEX IDX_727887B18B1206A5 (sheet_id)');
    }
}
