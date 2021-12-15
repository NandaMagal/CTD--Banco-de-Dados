CREATE SCHEMA IF NOT EXISTS NETFLIX2 DEFAULT CHARACTER SET utf8mb4 ;
USE NETFLIX2 ;


#TABELA ATORES

CREATE TABLE IF NOT EXISTS ATOR (
  Id_Ator int NOT NULL AUTO_INCREMENT,
  Nome_Ator varchar(45) DEFAULT NULL,
  Sobren_Ator varchar(45) DEFAULT NULL,
  Data_Nasc_Ator date,
  Pais_Origem varchar(10),
  PRIMARY KEY (Id_Ator)
) ;

#TABELA GÊNEROS

CREATE TABLE IF NOT EXISTS GENERO (
  Id_gen int NOT NULL AUTO_INCREMENT,
  Nome_Genero varchar(45) DEFAULT NULL,
  Descricao text NULL,
  PRIMARY KEY (Id_gen)
) ;

#TABELA SÉRIES

CREATE TABLE IF NOT EXISTS SERIES (
  Id_Serie int NOT NULL AUTO_INCREMENT,
  Id_Genero int NOT NULL ,
  Nome_Serie varchar(45) DEFAULT NULL,
  Descricao text NULL,
  Classificacao Int,
  PRIMARY KEY (Id_Serie),
  KEY fk_Id_Genero (Id_gen),
  CONSTRAINT fk_Id_Genero FOREIGN KEY (Id_gen) REFERENCES GENERO
) ;

#TABELA FILMES

CREATE TABLE IF NOT EXISTS FILMES (
  Id_Filmes int NOT NULL AUTO_INCREMENT,
  Id_Genero_Filmes int NOT NULL ,
  Titulo_Filmes varchar(45) DEFAULT NULL,
  Ano_Lancamento date,
  Classificacao Int,
  Sinopse text(100),
  PRIMARY KEY (Id_Filmes),
  KEY fk_Id_Genero_Filmes (Id_gen),
  CONSTRAINT fk_Id_Genero_Filmes FOREIGN KEY (Id_gen) REFERENCES GENERO
) ;


#TABELA FATURA-FILMES

CREATE TABLE IF NOT EXISTS FATURA_FILMES (
  Id_FatFilmes int NOT NULL AUTO_INCREMENT,
  Id_Filmes_Fat int NOT NULL ,
  Id_Ator_Filmes int NOT NULL ,
  Custo decimal(10,2),
  PRIMARY KEY ( Id_FatFilmes),
  KEY fk_Id_Filmes_Fat (Id_Filmes),
  CONSTRAINT fk_Id_Filmes_Fat FOREIGN KEY (Id_Filmes) REFERENCES FILMES,
  KEY fk_Id_Ator_Filmes (Id_Filmes),
  CONSTRAINT fk_Id_Ator_Filmes FOREIGN KEY (Id_Ator) REFERENCES ATOR
) ;

#TABELA TEMPORADAS

CREATE TABLE IF NOT EXISTS TEMPORADAS (
  Id_Temporada int NOT NULL AUTO_INCREMENT,
  Id_Temp_Series int NOT NULL,
  Descricao text,
  Classificacao Int,
  Num_Temporada Int,
  PRIMARY KEY ( Id_Temporada),
  KEY fk_Id_Temp_Series  (Id_Serie),
  CONSTRAINT fk_Id_Temp_Series  FOREIGN KEY (Id_Serie) REFERENCES SERIES
  ) ;

#TABELA EPISODIOS

CREATE TABLE IF NOT EXISTS EPISODIOS (
  Id_Episodio int NOT NULL AUTO_INCREMENT,
  Id_Temp_Episodios int NOT NULL,
  Descricao text,
  Classificacao Int,
  Num_Temporada Int,
  PRIMARY KEY ( Id_Episodio),
  KEY fk_Id_Temp_Episodios  (Id_Temporada),
  CONSTRAINT fk_Id_Temp_Episodios FOREIGN KEY (Id_Temporada) REFERENCES TEMPORADAS
  ) ;

#TABELA FATURA-EPISODIOS

CREATE TABLE IF NOT EXISTS FATURA_EPISODIOS (
  Id_Fat int NOT NULL AUTO_INCREMENT,
  Id_Episodio_Fat int NOT NULL,
  Id_Ator_Episodio int NOT NULL,
  CustoEpisodio decimal(10,2),
  QuantEpisodios Int,
  PRIMARY KEY ( Id_Fat),
  KEY fk_Id_Episodio_Fat (Id_Episodio),
  CONSTRAINT fk_Id_Episodio_Fat FOREIGN KEY (Id_Episodio) REFERENCES EPISODIOS,
  KEY fk_Id_Ator_Episodio (Id_Ator),
  CONSTRAINT fk_Id_Ator_Episodio FOREIGN KEY (Id_Ator) REFERENCES ATOR
) ;
