<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240201152951 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE bottle (
          id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\',
          name VARCHAR(255) NOT NULL,
          estate_name VARCHAR(255) NOT NULL,
          type VARCHAR(255) NOT NULL,
          year INT NOT NULL,
          grape_varieties JSON NOT NULL COMMENT \'(DC2Type:json)\',
          rate VARCHAR(2) NOT NULL,
          picture VARCHAR(255) NOT NULL,
          owner_id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\',
          country VARCHAR(255) NOT NULL,
          price DOUBLE PRECISION NOT NULL,
          PRIMARY KEY(id)
        ) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('DROP TABLE bottle');
    }
}
