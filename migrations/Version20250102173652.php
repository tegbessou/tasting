<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20250102173652 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE eye CHANGE sheet_id sheet_id BINARY(16) NOT NULL');
        $this->addSql('ALTER TABLE invitation CHANGE tasting_id tasting_id BINARY(16) NOT NULL');
        $this->addSql('ALTER TABLE nose CHANGE sheet_id sheet_id BINARY(16) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE eye CHANGE sheet_id sheet_id BINARY(16) DEFAULT NULL');
        $this->addSql('ALTER TABLE invitation CHANGE tasting_id tasting_id BINARY(16) DEFAULT NULL');
        $this->addSql('ALTER TABLE nose CHANGE sheet_id sheet_id BINARY(16) DEFAULT NULL');
    }
}
