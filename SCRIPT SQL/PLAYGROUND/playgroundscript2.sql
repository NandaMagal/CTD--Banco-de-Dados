-- MySQL Script generated by MySQL Workbench
-- Thu Aug 26 22:44:25 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PLAYGROUND
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PLAYGROUND
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PLAYGROUND` DEFAULT CHARACTER SET utf8mb4 ;
USE `PLAYGROUND` ;

-- -----------------------------------------------------
-- Table `PLAYGROUND`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLAYGROUND`.`CATEGORIA` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nome_categoria` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE INDEX `idUSUARIOS_UNIQUE` (`id_categoria` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLAYGROUND`.`USUARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLAYGROUND`.`USUARIOS` (
  `idUSUARIOS` INT NOT NULL,
  `nome_usuario` VARCHAR(25) NOT NULL,
  `sobrenome_usuario` VARCHAR(30) NOT NULL,
  `email_usuario` VARCHAR(15) NOT NULL,
  `senha_usuario` CHAR(8) NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`idUSUARIOS`),
  UNIQUE INDEX `idUSUARIOS_UNIQUE` (`idUSUARIOS` ASC) VISIBLE,
  INDEX `id_categoria_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `id_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `PLAYGROUND`.`CATEGORIA` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLAYGROUND`.`DISCIPLINA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLAYGROUND`.`DISCIPLINA` (
  `id_disciplina` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(10) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `dt_inicio` DATE NOT NULL,
  `dt_final` DATE NOT NULL,
  `imagem` VARCHAR(45) NOT NULL,
  `id_modulo` INT NOT NULL,
  PRIMARY KEY (`id_disciplina`),
  UNIQUE INDEX `idUSUARIOS_UNIQUE` (`id_disciplina` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLAYGROUND`.`CURSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLAYGROUND`.`CURSO` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(20) NOT NULL,
  `descricao_modulo` VARCHAR(45) NOT NULL,
  `carga_horaria` INT NOT NULL,
  `dt_inicio` DATE NOT NULL,
  `dt_final` DATE NOT NULL,
  `id_disciplina` INT NOT NULL AUTO_INCREMENT,
  `id_USUARIOS` INT NOT NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE INDEX `idUSUARIOS_UNIQUE` (`id_curso` ASC) VISIBLE,
  INDEX `id_disciplina_idx` (`id_disciplina` ASC, `id_USUARIOS` ASC) VISIBLE,
  INDEX `id_usuarios_idx` (`id_USUARIOS` ASC) VISIBLE,
  CONSTRAINT `id_disciplina`
    FOREIGN KEY (`id_disciplina` , `id_USUARIOS`)
    REFERENCES `PLAYGROUND`.`DISCIPLINA` (`id_disciplina` , `id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_usuarios`
    FOREIGN KEY (`id_USUARIOS`)
    REFERENCES `PLAYGROUND`.`USUARIOS` (`idUSUARIOS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLAYGROUND`.`CLASSE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLAYGROUND`.`CLASSE` (
  `id_classe` INT NOT NULL,
  `titulo_classe` VARCHAR(25) NOT NULL,
  `descricao` VARCHAR(40) NOT NULL,
  `dt_inicio` DATE NOT NULL,
  `invisible` TINYINT(1) NOT NULL,
  `modalidade_aula` ENUM("ao vivo ou virtual") NOT NULL,
  `ao_vivo` TINYINT(1) NOT NULL,
  `id_curso` INT NOT NULL,
  PRIMARY KEY (`id_classe`),
  UNIQUE INDEX `idUSUARIOS_UNIQUE` (`id_classe` ASC) VISIBLE,
  INDEX `id curso_idx` (`id_curso` ASC) VISIBLE,
  CONSTRAINT `id curso`
    FOREIGN KEY (`id_curso`)
    REFERENCES `PLAYGROUND`.`CURSO` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLAYGROUND`.`BLOCO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLAYGROUND`.`BLOCO` (
  `id_bloco` INT NOT NULL AUTO_INCREMENT,
  `titulo_bloco` VARCHAR(10) NOT NULL,
  `e_visivel` TINYINT(1) NOT NULL,
  `id_conteudo` INT NOT NULL,
  PRIMARY KEY (`id_bloco`),
  UNIQUE INDEX `idUSUARIOS_UNIQUE` (`id_bloco` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLAYGROUND`.`MODULO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLAYGROUND`.`MODULO` (
  `id_modulo` INT NOT NULL AUTO_INCREMENT,
  `titulo_modulo` VARCHAR(10) NOT NULL,
  `descricao_modulo` VARCHAR(45) NOT NULL,
  `dt_inicio` DATE NOT NULL,
  `id_bloco` INT NOT NULL,
  PRIMARY KEY (`id_modulo`),
  UNIQUE INDEX `idUSUARIOS_UNIQUE` (`id_modulo` ASC) VISIBLE,
  CONSTRAINT `id_modulo`
    FOREIGN KEY (`id_modulo`)
    REFERENCES `PLAYGROUND`.`DISCIPLINA` (`id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_bloco`
    FOREIGN KEY ()
    REFERENCES `PLAYGROUND`.`BLOCO` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLAYGROUND`.`AULAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLAYGROUND`.`AULAS` (
  `id_aula` INT NOT NULL AUTO_INCREMENT,
  `id_classe` INT NOT NULL,
  `descricao` TEXT(1000) NOT NULL,
  `exercicios` TEXT(1000) NOT NULL,
  `id_disciplina` INT NOT NULL,
  PRIMARY KEY (`id_aula`),
  UNIQUE INDEX `idUSUARIOS_UNIQUE` (`id_aula` ASC) VISIBLE,
  INDEX `id curso_idx` (`id_disciplina` ASC) VISIBLE,
  CONSTRAINT `id curso0`
    FOREIGN KEY (`id_disciplina`)
    REFERENCES `PLAYGROUND`.`CURSO` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PLAYGROUND`.`CONTEUDO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PLAYGROUND`.`CONTEUDO` (
  `id_conteudo` INT NOT NULL AUTO_INCREMENT,
  `tipo_conteudo` VARCHAR(1000) NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `descricao` TEXT(1000) NOT NULL,
  `imagem` VARCHAR(200) NOT NULL,
  `dt_inicio` DATE NOT NULL,
  `cap-MAX` INT NOT NULL,
  `id_aula` INT NULL,
  PRIMARY KEY (`id_conteudo`),
  INDEX `id_aula_idx` (`id_aula` ASC) VISIBLE,
  CONSTRAINT `id_aula`
    FOREIGN KEY (`id_aula`)
    REFERENCES `PLAYGROUND`.`AULAS` (`id_aula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
