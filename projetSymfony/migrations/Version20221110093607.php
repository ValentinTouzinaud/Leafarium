<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20221110093607 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE plante ADD nom_image VARCHAR(255) NOT NULL, ADD desc_image VARCHAR(255) NOT NULL, ADD floraison VARCHAR(255) NOT NULL, ADD desc_flo VARCHAR(255) NOT NULL, ADD symbolique VARCHAR(255) NOT NULL, ADD desc_symb VARCHAR(255) NOT NULL, ADD taille VARCHAR(255) NOT NULL, ADD desc_taille VARCHAR(255) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE plante DROP nom_image, DROP desc_image, DROP floraison, DROP desc_flo, DROP symbolique, DROP desc_symb, DROP taille, DROP desc_taille');
    }
}
