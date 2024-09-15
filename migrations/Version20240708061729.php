<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240708061729 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE invitation (
          id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\',
          tasting_id BINARY(16) DEFAULT NULL COMMENT \'(DC2Type:uuid)\',
          target_id BINARY(16) DEFAULT NULL COMMENT \'(DC2Type:uuid)\',
          sent_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\',
          updated_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\',
          link LONGTEXT NOT NULL,
          STATUS VARCHAR(10) NOT NULL,
          INDEX IDX_F11D61A25BC0FE1E (tasting_id),
          INDEX IDX_F11D61A2158E0B66 (target_id),
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE
          invitation
        ADD
          CONSTRAINT FK_F11D61A25BC0FE1E FOREIGN KEY (tasting_id) REFERENCES tasting (id)');
        $this->addSql('ALTER TABLE
          invitation
        ADD
          CONSTRAINT FK_F11D61A2158E0B66 FOREIGN KEY (target_id) REFERENCES participant (id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE invitation DROP FOREIGN KEY FK_F11D61A25BC0FE1E');
        $this->addSql('ALTER TABLE invitation DROP FOREIGN KEY FK_F11D61A2158E0B66');
        $this->addSql('DROP TABLE invitation');
    }
}
