<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20241119144432 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE invitation DROP FOREIGN KEY FK_F11D61A2158E0B66');
        $this->addSql('DROP INDEX IDX_F11D61A2158E0B66 ON invitation');
        $this->addSql('ALTER TABLE invitation ADD target VARCHAR(255) NOT NULL, DROP target_id');
        $this->addSql('ALTER TABLE tasting DROP FOREIGN KEY FK_736218107E3C61F9');
        $this->addSql('DROP TABLE participant');
        $this->addSql('DROP INDEX IDX_736218107E3C61F9 ON tasting');
        $this->addSql('ALTER TABLE tasting CHANGE owner_id owner_id VARCHAR(255) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('CREATE TABLE participant (
          id BINARY(16) NOT NULL,
          email VARCHAR(255) CHARACTER
          SET
            utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`,
            full_name VARCHAR(255) CHARACTER
          SET
            utf8mb4 DEFAULT NULL COLLATE `utf8mb4_unicode_ci`,
            PRIMARY KEY(id)
        ) DEFAULT CHARACTER
        SET
          utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\'');
        $this->addSql('ALTER TABLE tasting CHANGE owner_id owner_id BINARY(16) DEFAULT NULL');
        $this->addSql('ALTER TABLE
          tasting
        ADD
          CONSTRAINT FK_736218107E3C61F9 FOREIGN KEY (owner_id) REFERENCES participant (id)');
        $this->addSql('CREATE INDEX IDX_736218107E3C61F9 ON tasting (owner_id)');
        $this->addSql('ALTER TABLE invitation ADD target_id BINARY(16) DEFAULT NULL, DROP target');
        $this->addSql('ALTER TABLE
          invitation
        ADD
          CONSTRAINT FK_F11D61A2158E0B66 FOREIGN KEY (target_id) REFERENCES participant (id)');
        $this->addSql('CREATE INDEX IDX_F11D61A2158E0B66 ON invitation (target_id)');
    }
}
