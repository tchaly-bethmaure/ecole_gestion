CREATE TABLE `classe` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `numero` VARCHAR(255) NOT NULL
);

CREATE TABLE `cursus` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `nom_cursus` VARCHAR(255) NOT NULL,
  `annee` DATE NOT NULL
);

CREATE TABLE `eleve` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL,
  `prenom` VARCHAR(255) NOT NULL,
  `cursus` INTEGER NOT NULL
);

CREATE INDEX `idx_eleve__cursus` ON `eleve` (`cursus`);

ALTER TABLE `eleve` ADD CONSTRAINT `fk_eleve__cursus` FOREIGN KEY (`cursus`) REFERENCES `cursus` (`id`) ON DELETE CASCADE;

CREATE TABLE `matiere` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `intitule` VARCHAR(255) NOT NULL
);

CREATE TABLE `professeur` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL
);

CREATE TABLE `cours` (
  `numero` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `professeur` INTEGER NOT NULL,
  `date` DATETIME NOT NULL,
  `classe` INTEGER NOT NULL
);

CREATE INDEX `idx_cours__classe` ON `cours` (`classe`);

CREATE INDEX `idx_cours__professeur` ON `cours` (`professeur`);

ALTER TABLE `cours` ADD CONSTRAINT `fk_cours__classe` FOREIGN KEY (`classe`) REFERENCES `classe` (`id`) ON DELETE CASCADE;

ALTER TABLE `cours` ADD CONSTRAINT `fk_cours__professeur` FOREIGN KEY (`professeur`) REFERENCES `professeur` (`id`) ON DELETE CASCADE;

CREATE TABLE `cours_eleve` (
  `cours` INTEGER NOT NULL,
  `eleve` INTEGER NOT NULL,
  PRIMARY KEY (`cours`, `eleve`)
);

CREATE INDEX `idx_cours_eleve` ON `cours_eleve` (`eleve`);

ALTER TABLE `cours_eleve` ADD CONSTRAINT `fk_cours_eleve__cours` FOREIGN KEY (`cours`) REFERENCES `cours` (`numero`);

ALTER TABLE `cours_eleve` ADD CONSTRAINT `fk_cours_eleve__eleve` FOREIGN KEY (`eleve`) REFERENCES `eleve` (`id`);

CREATE TABLE `matiere_professeur` (
  `matiere` INTEGER NOT NULL,
  `professeur` INTEGER NOT NULL,
  PRIMARY KEY (`matiere`, `professeur`)
);

CREATE INDEX `idx_matiere_professeur` ON `matiere_professeur` (`professeur`);

ALTER TABLE `matiere_professeur` ADD CONSTRAINT `fk_matiere_professeur__matiere` FOREIGN KEY (`matiere`) REFERENCES `matiere` (`id`);

ALTER TABLE `matiere_professeur` ADD CONSTRAINT `fk_matiere_professeur__professeur` FOREIGN KEY (`professeur`) REFERENCES `professeur` (`id`)
