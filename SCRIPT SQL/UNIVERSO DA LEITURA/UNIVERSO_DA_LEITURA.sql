-- MySQL Script generated by MySQL Workbench
-- Sun Aug 29 19:39:22 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BIBLIOTECA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BIBLIOTECA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BIBLIOTECA` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `BIBLIOTECA` ;

-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`ASSOCIADOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`ASSOCIADOS` (
  `id_assoc` INT NOT NULL AUTO_INCREMENT,
  `rg` CHAR(10) NOT NULL,
  `nome_assoc` VARCHAR(50) NOT NULL,
  `sobrenome_assoc` VARCHAR(50) NULL,
  `end_assoc` VARCHAR(100) NULL,
  `cidade_assoc` VARCHAR(50) NULL,
  `estado_assoc` VARCHAR(2) NULL,
  PRIMARY KEY (`id_assoc`),
  UNIQUE INDEX `RG_UNIQUE` (`rg` ASC) VISIBLE,
  UNIQUE INDEX `idASSOCIADOS_UNIQUE` (`id_assoc` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`TELEFONES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`TELEFONES` (
  `id_assoc` INT NOT NULL,
  `id_telefones` INT NOT NULL AUTO_INCREMENT,
  `fone_assoc` VARCHAR(50) NOT NULL,
  UNIQUE INDEX `RG_UNIQUE` (`id_telefones` ASC) VISIBLE,
  UNIQUE INDEX `idASSOCIADOS_UNIQUE` (`id_assoc` ASC) VISIBLE,
  PRIMARY KEY (`id_telefones`),
  CONSTRAINT `id_assoc`
    FOREIGN KEY (`id_assoc`)
    REFERENCES `BIBLIOTECA`.`ASSOCIADOS` (`id_assoc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`EMPRESTIMOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`EMPRESTIMOS` (
  `id_emprestimo` INT NOT NULL AUTO_INCREMENT,
  `id_assoc` INT NOT NULL,
  `dt_emprestimo` DATETIME NOT NULL,
  `prazo_devol` DATETIME NOT NULL,
  `dt_devolucao` DATETIME NOT NULL,
  UNIQUE INDEX `RG_UNIQUE` (`id_emprestimo` ASC) VISIBLE,
  UNIQUE INDEX `idASSOCIADOS_UNIQUE` (`id_assoc` ASC) VISIBLE,
  PRIMARY KEY (`id_emprestimo`),
  CONSTRAINT `id_assoc0`
    FOREIGN KEY (`id_assoc`)
    REFERENCES `BIBLIOTECA`.`ASSOCIADOS` (`id_assoc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`EDITORAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`EDITORAS` (
  `id_editora` INT NOT NULL AUTO_INCREMENT,
  `razaosocial` VARCHAR(50) NOT NULL,
  `telefone` VARCHAR(50) NOT NULL,
  `end_editora` VARCHAR(100) NULL,
  `cidade_editora` VARCHAR(50) NULL,
  `estado_editora` VARCHAR(2) NULL,
  PRIMARY KEY (`id_editora`),
  UNIQUE INDEX `RG_UNIQUE` (`razaosocial` ASC) VISIBLE,
  UNIQUE INDEX `idASSOCIADOS_UNIQUE` (`id_editora` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`AUTORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`AUTORES` (
  `id_autores` INT NOT NULL AUTO_INCREMENT,
  `nome_autor` VARCHAR(45) NULL,
  `sobrenome_autor` VARCHAR(60) NULL,
  PRIMARY KEY (`id_autores`),
  UNIQUE INDEX `idASSOCIADOS_UNIQUE` (`id_autores` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`LIVROS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`LIVROS` (
  `id_livro` INT NOT NULL AUTO_INCREMENT,
  `id_editora` INT NOT NULL,
  `cod_ISBN` VARCHAR(13) NOT NULL,
  `titulo` VARCHAR(50) NULL,
  `ano_criacao` DATE NULL,
  `id_autores` INT NULL,
  `ano_publicacao` DATE NULL,
  UNIQUE INDEX `RG_UNIQUE` (`id_livro` ASC) VISIBLE,
  UNIQUE INDEX `idASSOCIADOS_UNIQUE` (`id_editora` ASC) VISIBLE,
  PRIMARY KEY (`id_livro`),
  INDEX `id_autores_idx` (`id_autores` ASC) VISIBLE,
  CONSTRAINT `id_editora`
    FOREIGN KEY ()
    REFERENCES `BIBLIOTECA`.`EDITORAS` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_autores`
    FOREIGN KEY (`id_autores`)
    REFERENCES `BIBLIOTECA`.`AUTORES` (`id_autores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`EXEMPLARES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`EXEMPLARES` (
  `id_exemplar` INT NOT NULL AUTO_INCREMENT,
  `id_livro` INT NOT NULL,
  `sinistro` TINYINT(2) NOT NULL COMMENT 'verdade ou falso \nObra dabificada 0\nobra em perfeito estado 1',
  UNIQUE INDEX `RG_UNIQUE` (`id_exemplar` ASC) VISIBLE,
  UNIQUE INDEX `idASSOCIADOS_UNIQUE` (`id_livro` ASC) VISIBLE,
  PRIMARY KEY (`id_exemplar`),
  CONSTRAINT `id_livro`
    FOREIGN KEY (`id_livro`)
    REFERENCES `BIBLIOTECA`.`LIVROS` (`id_livro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA`.`EMPRESTIMO_EXEMPLARES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA`.`EMPRESTIMO_EXEMPLARES` (
  `id_emprestimoexemplar` INT NOT NULL AUTO_INCREMENT,
  `id_emprestimo` INT NOT NULL,
  `id_exemplar` INT NULL,
  UNIQUE INDEX `RG_UNIQUE` (`id_emprestimo` ASC) VISIBLE,
  UNIQUE INDEX `idASSOCIADOS_UNIQUE` (`id_emprestimoexemplar` ASC) VISIBLE,
  PRIMARY KEY (`id_emprestimoexemplar`),
  INDEX `id_exemplar_idx` (`id_exemplar` ASC) VISIBLE,
  CONSTRAINT `id_emprestimo`
    FOREIGN KEY (`id_emprestimo`)
    REFERENCES `BIBLIOTECA`.`EMPRESTIMOS` (`id_emprestimo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_exemplar`
    FOREIGN KEY (`id_exemplar`)
    REFERENCES `BIBLIOTECA`.`EXEMPLARES` (`id_exemplar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
