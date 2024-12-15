<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240929091802 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE
          bottle
        CHANGE
          id id BINARY(16) NOT NULL,
        CHANGE
          grape_varieties grape_varieties JSON NOT NULL,
        CHANGE
          owner_id owner_id BINARY(16) DEFAULT NULL,
        CHANGE
          saved_at saved_at DATE NOT NULL,
        CHANGE
          tasted_at tasted_at DATE DEFAULT NULL');
        $this->addSql('ALTER TABLE country CHANGE id id BINARY(16) NOT NULL');
        $this->addSql('ALTER TABLE grape_variety CHANGE id id BINARY(16) NOT NULL');
        $this->addSql('ALTER TABLE
          invitation
        CHANGE
          id id BINARY(16) NOT NULL,
        CHANGE
          tasting_id tasting_id BINARY(16) DEFAULT NULL,
        CHANGE
          target_id target_id BINARY(16) DEFAULT NULL,
        CHANGE
          sent_at sent_at DATETIME DEFAULT NULL,
        CHANGE
          updated_at updated_at DATETIME DEFAULT NULL,
        CHANGE
          created_at created_at DATETIME DEFAULT NULL');
        $this->addSql('ALTER TABLE owner CHANGE id id BINARY(16) NOT NULL');
        $this->addSql('ALTER TABLE participant CHANGE id id BINARY(16) NOT NULL');
        $this->addSql('ALTER TABLE
          tasting
        CHANGE
          id id BINARY(16) NOT NULL,
        CHANGE
          owner_id owner_id BINARY(16) DEFAULT NULL,
        CHANGE
          participants participants JSON NOT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE user CHANGE id id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\'');
        $this->addSql('ALTER TABLE owner CHANGE id id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\'');
        $this->addSql('ALTER TABLE
          tasting
        CHANGE
          id id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\',
        CHANGE
          participants participants JSON NOT NULL COMMENT \'(DC2Type:json)\',
        CHANGE
          owner_id owner_id BINARY(16) DEFAULT NULL COMMENT \'(DC2Type:uuid)\'');
        $this->addSql('ALTER TABLE
          invitation
        CHANGE
          sent_at sent_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\',
        CHANGE
          created_at created_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\',
        CHANGE
          updated_at updated_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\',
        CHANGE
          id id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\',
        CHANGE
          tasting_id tasting_id BINARY(16) DEFAULT NULL COMMENT \'(DC2Type:uuid)\',
        CHANGE
          target_id target_id BINARY(16) DEFAULT NULL COMMENT \'(DC2Type:uuid)\'');
        $this->addSql('ALTER TABLE participant CHANGE id id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\'');
        $this->addSql('ALTER TABLE country CHANGE id id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\'');
        $this->addSql('ALTER TABLE
          bottle
        CHANGE
          id id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\',
        CHANGE
          grape_varieties grape_varieties JSON NOT NULL COMMENT \'(DC2Type:json)\',
        CHANGE
          saved_at saved_at DATE NOT NULL COMMENT \'(DC2Type:date_immutable)\',
        CHANGE
          tasted_at tasted_at DATE DEFAULT NULL COMMENT \'(DC2Type:date_immutable)\',
        CHANGE
          owner_id owner_id BINARY(16) DEFAULT NULL COMMENT \'(DC2Type:uuid)\'');
        $this->addSql('ALTER TABLE grape_variety CHANGE id id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\'');
    }
}
