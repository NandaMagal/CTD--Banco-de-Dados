
CREATE SCHEMA IF NOT EXISTS `NANDA_NETFLIX` DEFAULT CHARACTER SET utf8mb4 ;
USE `NANDA_NETFLIX` ;

-- -----------------------------------------------------
-- Table Atores
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NANDA_NETFLIX`.`Atores` (
  `idAtores` INT NOT NULL AUTO_INCREMENT,
  `nome_ator` VARCHAR(45) NULL,
  `sobrenome_Ator` VARCHAR(45) NULL,
  `data_nascimento` DATE ,
  `pais_Origem` VARCHAR(10) ,
  PRIMARY KEY (`idAtores`))
;


-- -----------------------------------------------------
-- Table Generos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NANDA_NETFLIX`.`Generos` (
  `idGeneros` INT NOT NULL AUTO_INCREMENT,
  `nome_genero` VARCHAR(25) NULL,
  `descricao` TEXT ,
  PRIMARY KEY (`idGeneros`))
;




-- -----------------------------------------------------
-- Table Series
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NANDA_NETFLIX`.`Series` (
  `idSeries` INT NOT NULL AUTO_INCREMENT,
  `idGeneros` INT NOT NULL,
  `nome_Serie` VARCHAR(45) NULL,
  `descricao` TEXT ,
  `classisficação` INT ,
  PRIMARY KEY (`idSeries`),
  CONSTRAINT `idGenerosSeries`
    FOREIGN KEY (`idGeneros`) REFERENCES `NANDA_NETFLIX`.`Generos` (`idGeneros`)
    );


-- -----------------------------------------------------
-- Table Filmes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NANDA_NETFLIX`.`Filmes` (
  `idFilmes` INT NOT NULL AUTO_INCREMENT,
  `idGenero` INT NOT NULL,
  `titulo_filme` VARCHAR(45) NULL,
  `ano_lancamento` DATE ,
  `classificacao` INT ,
  `sinopse` TEXT ,
  PRIMARY KEY (`idFilmes`),
  CONSTRAINT `idGeneroFilmes`
    FOREIGN KEY (`idGenero`) REFERENCES `NANDA_NETFLIX`.`Generos` (`idGeneros`)
    );


-- -----------------------------------------------------
-- Table Fatura_filmes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NANDA_NETFLIX`.`Fatura_filmes` (
  `idFatura_filmes` INT NOT NULL AUTO_INCREMENT,
  `idFilmes` INT NOT NULL,
  `idAtor` INT NOT NULL,
  `Custo` DECIMAL(10,2) ,
  PRIMARY KEY (`idFatura_filmes`),
  CONSTRAINT `idFilmesFatura`
  FOREIGN KEY (`idFilmes`) REFERENCES `NANDA_NETFLIX`.`Filmes` (`idFilmes`),
  CONSTRAINT `idAtorFatura` 
  FOREIGN KEY (`idAtor`) REFERENCES `NANDA_NETFLIX`.`Atores` (`idAtores`)
   );


-- -----------------------------------------------------
-- Table Temporadas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NANDA_NETFLIX`.`Temporadas` (
  `idTemporada` INT NOT NULL AUTO_INCREMENT,
  `idSeries` INT NOT NULL,
  `descricao` TEXT ,
  `classisficação` INT ,
  `num_temporada` INT NULL,
  PRIMARY KEY (`idTemporada`),
  CONSTRAINT `idSeriesTemporada`
  FOREIGN KEY (`idSeries`)REFERENCES `NANDA_NETFLIX`.`Series` (`idSeries`)
   )
;


-- -----------------------------------------------------
-- Table Episodios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NANDA_NETFLIX`.`Episodios` (
  `idEpisodios` INT NOT NULL AUTO_INCREMENT,
  `idTemporada` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `sinopse_Episodio` TEXT(300) ,
  PRIMARY KEY (`idEpisodios`),
  CONSTRAINT `idTemporada` 
  FOREIGN KEY (`idTemporada`) REFERENCES `NANDA_NETFLIX`.`Temporadas` (`idTemporada`)
 );


-- -----------------------------------------------------
-- Table Fatura_Episodio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NANDA_NETFLIX`.`Fatura_Episodio` (
  `idFatura_Episodio` INT NOT NULL AUTO_INCREMENT,
  `idEpisodio` INT NOT NULL,
  `idAtorFat` INT NOT NULL,
  `Custo` DECIMAL(10,2) ,
  `qde_Episodio` INT ,
  PRIMARY KEY (`idFatura_Episodio`),
  CONSTRAINT `idEpisodioFaturaEp`
  FOREIGN KEY (`idEpisodio`) REFERENCES `NANDA_NETFLIX`.`Episodios` (`idEpisodios`),
  CONSTRAINT `id_Atorfatura`
  FOREIGN KEY (`idAtorFat`) REFERENCES `NANDA_NETFLIX`.`Atores` (`idAtores`)
   );

INSERT INTO `NANDA_NETFLIX`.`Atores`
VALUES(DEFAULT,'ANGELINA','JOLIE','1978-12-15','EUA');
INSERT INTO `NANDA_NETFLIX`.`Atores`
VALUES(DEFAULT,'FERNANDA','MONTENEGRO','1938-11-05','BRASIL');
INSERT INTO `NANDA_NETFLIX`.`Atores`
VALUES(DEFAULT,'BRAD','PITT','1978-02-23','EUA');
INSERT INTO `NANDA_NETFLIX`.`Atores`
VALUES(DEFAULT,'SILVESTRE','STALONE','1948-10-02','EUA');
INSERT INTO `NANDA_NETFLIX`.`Atores`
VALUES(DEFAULT,'BRUCE','WILLYS','1945-02-23','EUA');
INSERT INTO `NANDA_NETFLIX`.`Atores`
VALUES(DEFAULT,'PAULO','GUSTAVO','1978-12-17','BRASIL');
INSERT INTO `NANDA_NETFLIX`.`Atores`
VALUES(DEFAULT,'MAGGIE','RIHER','1958-07-01','EUA');
INSERT INTO `NANDA_NETFLIX`.`Atores`
VALUES(DEFAULT,'JODIE','FOSTER','1965-02-07','EUA');

UPDATE `NANDA_NETFLIX`.`Atores` SET `sobrenome_Ator` = 'MONTENEGRO'
WHERE `sobrenome_Ator`='TORRES';
UPDATE `NANDA_NETFLIX`.`Atores` SET `data_nascimento`= '1948-10-02'
WHERE `data_nascimento`='1964-04-11';
UPDATE `NANDA_NETFLIX`.`Atores` SET `pais_Origem`= 'EUA'
WHERE `pais_Origem`='Alemanha';







INSERT INTO `NANDA_NETFLIX`.`Generos`
VALUES(DEFAULT,'TERROR','GENERO MOSTRA CENAS FORTES E HORRIPILANTES');
INSERT INTO `NANDA_NETFLIX`.`Generos`
VALUES(DEFAULT,'ENGRAÇADO','GENERO MOSTRA CENAS ENGRAÇADAS E PIADAS');
INSERT INTO `NANDA_NETFLIX`.`Generos`
VALUES(DEFAULT,'ROMANCE','GENERO MOSTRA CENAS DE AMOR E NAMORO');
INSERT INTO `NANDA_NETFLIX`.`Generos`
VALUES(DEFAULT,'DRAMA','GENERO MOSTRA CENAS FORTES E COM DRAMAS PESSOAIS');
INSERT INTO `NANDA_NETFLIX`.`Generos`
VALUES(DEFAULT,'POLICIAL','GENERO MOSTRA CENAS DE INVESTIGAÇÃO CRIMINAL ');
INSERT INTO `NANDA_NETFLIX`.`Generos`
VALUES(DEFAULT,'SUSPENSE','GENERO MOSTRA CENAS DE MISTERIO');



UPDATE `NANDA_NETFLIX`.`Generos` SET `nome_genero`= 'ROMANCE'
WHERE `nome_genero`='AMOR';
UPDATE `NANDA_NETFLIX`.`Generos` SET `nome_genero`= 'POLICIAL'
WHERE `nome_genero`='POLICIAL DRAMATICO';
UPDATE `NANDA_NETFLIX`.`Generos` SET `nome_genero`= 'SUSPENSE'
WHERE `nome_genero`='SUSPENSE E POLICIAL';

SELECT *
FROM `NANDA_NETFLIX`.`Generos`;

SELECT `pais_Origem`
FROM `NANDA_NETFLIX`.`Atores`;


 