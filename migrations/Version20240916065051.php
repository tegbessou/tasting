<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240916065051 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('DROP INDEX UNIQ_73621810DCF9352B ON tasting');
        $this->addSql('ALTER TABLE tasting ADD bottle_name VARCHAR(255) NOT NULL, DROP bottle_id');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE
          tasting
        ADD
          bottle_id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\',
        DROP
          bottle_name');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_73621810DCF9352B ON tasting (bottle_id)');
    }
}
