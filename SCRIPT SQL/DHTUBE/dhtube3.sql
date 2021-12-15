/*Schema*/
-- criado por :
-- ROBERTO CASTRO
-- TATIANE GARDIN 
-- FERNANDA RIBEIRO 
-- JUAN EVANGELISTA
-- -----------------------------------------------------
-- Schema dtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dtube` DEFAULT CHARACTER SET utf8mb4 ;
USE `dtube` ;

-- -----------------------------------------------------
-- Table `dtube`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dtube`.`pais` (
  `idpais` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  PRIMARY KEY (`idpais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dtube`.`avatar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dtube`.`avatar` (
  `idAvatar` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `urlimagem` VARCHAR(100) NULL,
  PRIMARY KEY (`idAvatar`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dtube`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dtube`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NULL,
  `dataNascimentio` DATETIME NULL,
  `cep` VARCHAR(45) NULL,
  `Pais_idPais` INT NOT NULL,
  `Avatar_idAvatar` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `FKidAvatar_idx` (`Avatar_idAvatar` ASC) VISIBLE,
  INDEX `FKidPais_idx` (`Pais_idPais` ASC) VISIBLE,
  CONSTRAINT `FKidAvatar`
    FOREIGN KEY (`Avatar_idAvatar`)
    REFERENCES `dtube`.`avatar` (`idAvatar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FKidPais`
    FOREIGN KEY (`Pais_idPais`)
    REFERENCES `dtube`.`pais` (`idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dtube`.`canal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dtube`.`canal` (
  `idCanal` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `descricao` TEXT NULL,
  `dataCriacao` DATETIME NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idCanal`),
  INDEX `FKIdUsuario_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `FKIdUsuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `dtube`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dtube`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dtube`.`video` (
  `idVideo` INT NOT NULL AUTO_INCREMENT,
  `Usuario_idUsuario` INT NOT NULL,
  `titulo` VARCHAR(100) NULL,
  `descricao` TEXT NULL,
  `tamanho` DOUBLE NULL,
  `noimeArquivo` VARCHAR(100) NULL,
  `duracao` DOUBLE NULL,
  `imagem` VARCHAR(100) NULL,
  `qtdReproducoes` INT NULL,
  `qtdLikes` INT NULL,
  `qtdDslikes` INT NULL,
  `privado` SMALLINT NULL,
  `dataPublicacao` DATETIME NULL,
  PRIMARY KEY (`idVideo`),
  INDEX `FKUsuario-idUsuario_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `FKUsuario-idUsuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `dtube`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FKUsuario_idUsuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `dtube`.`pais` (`idpais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dtube`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dtube`.`playlist` (
  `idPlaylist` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `dataCriacao` DATETIME NULL,
  `privado` SMALLINT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idPlaylist`),
  INDEX `FKUsuario-idUsuario_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `FKUsuario-idUsuario0`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `dtube`.`usuario` (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dtube`.`playlist_video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dtube`.`playlist_video` (
  `Video_idVideo` INT NOT NULL,
  `Playlist_idPlaylist` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Playlist_idPlaylist`, `Video_idVideo`),
  CONSTRAINT `FKPlaylist_idPlaylist`
    FOREIGN KEY (`Playlist_idPlaylist` , `Video_idVideo`)
    REFERENCES `dtube`.`pais` (`idpais` , `idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FKPlaylist_idPlaylist`
    FOREIGN KEY (`Playlist_idPlaylist`)
    REFERENCES `dtube`.`playlist` (`idPlaylist`))
ENGINE = InnoDB;
