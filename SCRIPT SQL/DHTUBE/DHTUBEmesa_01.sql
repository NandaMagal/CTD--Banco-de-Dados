/*Schema*/
-- criado por :
-- ROBERTO CASTRO
-- TATIANE GARDIN 
-- FERNANDA RIBEIRO 
-- JUAN EVANGELISTA

CREATE DATABASE `dhtube`; 
USE `dhtube`;
-- Tabela AVATAR
-- 
CREATE TABLE IF NOT EXISTS  `dhtube`.`avatar`(
	`idAvatar` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NULL,
    `urlimagem` VARCHAR(100) NULL,
    PRIMARY KEY (`idAvatar`)
);

-- Tabela PAIS
 
CREATE TABLE IF NOT EXISTS  `dhtube`.`pais` (
`idPais` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(100) NULL,
PRIMARY KEY (`idPais`) );

-- Tabela USUARIO
 
CREATE TABLE IF NOT EXISTS `dhtube`.`usuario` (
`idUsuario` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(45) NULL,
`email` VARCHAR(45) NULL, 
`senha` VARCHAR(45) NULL,
`dataNascimento` DATETIME NULL,
`cep` VARCHAR(45) NULL,
`Pais_idPais` INT NOT NULL,
`Avatar_idAvatar` INT NOT NULL,
PRIMARY KEY (`idUsuario`),
CONSTRAINT `FKIdPais`
	FOREIGN KEY (`Pais_idPais`)	REFERENCES  `dhtube`. `pais`(`idPais`),
CONSTRAINT `FKIdAvatar`
    FOREIGN KEY (`Avatar_idAvatar`)	REFERENCES  `dhtube`. `avatar`(`idAvatar`)
);

-- Tabela VIDEO 

CREATE TABLE IF NOT EXISTS `dhTube`.`video`(
	`idVideo` INT NOT NULL AUTO_INCREMENT,
    `Usuario_idUsuario` INT NOT NULL,
    `titulo` VARCHAR(100),
    `descricao` TEXT,
    `tamanho` DOUBLE,
    `nomeArquivo` VARCHAR(100),
    `duracao` DOUBLE,
    `imagem` VARCHAR(100),
    `qtdReproducoes` INT,
    `qtdLikes` INT,
    `qtdDislikes` INT,
    `privado` SMALLINT,
    `dataPublicacao` DATETIME,    
PRIMARY KEY (`idVideo`),
CONSTRAINT `FKIdUsuario2`
    FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `dhtube`.`usuario`(`idUsuario`)
);
    

-- TABELA  PLAYLIST

CREATE TABLE IF NOT EXISTS  `dhtube`.`playlist`(
`idPlaylist` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(45) NULL,
`datacriacao` DATETIME NULL,
`privado` SMALLINT NULL,
`Usuario_idUsuario` INT NOT NULL,
PRIMARY KEY (`idPlaylist`),
CONSTRAINT `FKIdUsuario`
    FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `dhtube`.`usuario`(`idUsuario`)
);
    
-- Tabela PLAYLIST_VIDEO
 
CREATE TABLE IF NOT EXISTS  `dhtube`.`playlist_video` (
`Video_idVideo` INT NOT NULL,
`Playlist_idPlaylist` INT NOT NULL,
CONSTRAINT `FKVideo_idVideo`	
	FOREIGN KEY (`Video_idVideo`) REFERENCES `dhTube`.`video`(`idVideo`),
CONSTRAINT `FKPlaylist_idPlaylist`
    FOREIGN KEY (`Playlist_idPlaylist`) REFERENCES `dhtube`.`playlist`(`idPlaylist`)
);


-- Tabela CANAL 

CREATE TABLE IF NOT EXISTS `Canal` (
	`idCanal` INT NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR (45)  NULL, 
    `descricao` TEXT,
    `dataCriacao` DATETIME ,
    `Usuario_idUsuario` INT ,
PRIMARY KEY (`idCanal`) ,
CONSTRAINT `FKIdUsuario3`
    FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `dhtube`.`usuario`(`idUsuario`)
);
    



