CREATE DATABASE IF  NOT EXISTS NandaSpotify
DEFAULT CHARSET = 'utf8mb4'
DEFAULT COLLATE = 'utf8mb4_general_ci';

USE NandaSpotify;

-- TABELA USUARIO

CREATE TABLE if not exists Usuario
(
	idUsuario INT UNSIGNED AUTO_INCREMENT,
	strNomeUser VARCHAR(45) NULL,
    strSexo CHAR(1),
    strEmail VARCHAR(30) NULL,
    strSenha VARCHAR(8) NULL,
    dtNascimento DATE NULL,
    strPais VARCHAR (15) NULL,
    CONSTRAINT PK_Usuario_idUsuario PRIMARY KEY (idUsuario)
);

INSERT INTO Usuario
VALUES (DEFAULT,' NANDAMAGAL', 'F', 'nandamagalhaes28@hotmail.com', '311300','1979-10-16', 'Brasil'),
       (DEFAULT, 'HADASSA','F','hadassampc@gmnail.com', 'hmpc2021', '1988-10-05', 'Alemanha'),
       (DEFAULT, 'BRUNINHO','M', 'buno@kasaimoveis.com', 'bam2816', '1982-11-28', 'India'),
       (DEFAULT, 'ANA PAULA', 'F', 'anapaula@hyper.com','ana345', '1981-02-19', 'EUA'),
       (DEFAULT, 'FERNANDO MAGALHAES','M','katito50@hotmail.com','88922','1954-05-22','Itália'),
       (DEFAULT, 'NEUZA RIBEIRO','F','neuzinha63@gmail.com','458795','1957-05-27','Bahia');

-- TABELA ARTISTA
CREATE TABLE IF  NOT EXISTS Artista
(
	IdArtista INT UNSIGNED AUTO_INCREMENT,
    Nome_Artista VARCHAR(45) NULL,
    Sobrenome_Artista VARCHAR(45),
    CONSTRAINT PK_Artista_IdArtista PRIMARY KEY (IdArtista)
);

-- TABELA ALBUM

CREATE TABLE IF  NOT EXISTS Album
(
	IdAlbum INT UNSIGNED AUTO_INCREMENT,
    nome_Album VARCHAR(45),
    IdArtista INT UNSIGNED,
    CONSTRAINT  PK_Album_IdAlbum PRIMARY KEY (IdAlbum),
    CONSTRAINT FK_Album_IdArtista FOREIGN KEY (IdArtista)
		REFERENCES Artista (IdArtista)
);


INSERT INTO Album
VALUES (DEFAULT,' PLANO PILOTO', DEFAULT),
       (DEFAULT,' TODOS OS CANTOS ', DEFAULT),
       (DEFAULT,' A COR DESSA CIDADE', DEFAULT),
       (DEFAULT,' IN CONCERT', DEFAULT),
       (DEFAULT,' 20 ANOS PIXOTE', DEFAULT);
       
       

-- tabela Musicas

CREATE TABLE IF  NOT EXISTS Musicas
(
	IdMusica INT UNSIGNED AUTO_INCREMENT,
    Titulo_Musica VARCHAR(45),
    Duracao DOUBLE,
    Qtdevezes_Tocadas INT UNSIGNED,
    Qtdevezes_Curtidas INT UNSIGNED,
    IdAlbum INT UNSIGNED auto_increment,
    CONSTRAINT PK_Musicas_IdMusica PRIMARY KEY (IdMusica),
    CONSTRAINT FK_Musicas_IdAlbum FOREIGN KEY (IdAlbum)
		REFERENCES Album  (IdAlbum)
);

INSERT INTO Album
VALUES (DEFAULT,'FigurinhaRepetida', '3.05', '15', '25',DEFAULT),
       (DEFAULT,'Patience ', '10.15', '15', '25', DEFAULT),
       (DEFAULT,' Always', '11.34', '15', '25', DEFAULT),
       (DEFAULT,'Fulminante', '3.45', '15', '25', DEFAULT),
       (DEFAULT,'Cobaia ', '3.45', '15', '25', DEFAULT);
       

-- TABELA GÊNERO
CREATE TABLE IF  NOT EXISTS Genero
(
	IdGenero INT UNSIGNED AUTO_INCREMENT,
    nome_Genero VARCHAR(45),
    IdMusica_Genero INT NOT NULL,
    CONSTRAINT PK_Genero_idGenero2 PRIMARY KEY (IdGenero),
    CONSTRAINT FK_Genero_IdMusica FOREIGN KEY (IdMusica_Genero)
		REFERENCES Musicas (IdMusica)
);

-- TABELA PLAYLIST

CREATE TABLE IF  NOT EXISTS Playlist
(
	IdPlaylist INT UNSIGNED AUTO_INCREMENT,
	IdUsuario INT UNSIGNED AUTO_INCREMENT,
	Titulo_Playlist VARCHAR(40),
	Qde_cancoes INT NULL,
	Dt_Criacao DATE ,
	CONSTRAINT PK_Playlist_idPlaylist PRIMARY KEY (IdPlaylist),
	CONSTRAINT FK_Playlst_IdUsuario FOREIGN KEY (IdUsuario)
		REFERENCES Usuario  (IdUsuario)
);

-- TABELA PLAYLIST MUSICAS

CREATE TABLE IF  NOT EXISTS Playlist_Musicas
(
	IdPlaylist_Musica INT UNSIGNED AUTO_INCREMENT,
	IdPlaylist INT UNSIGNED ,
	IdMusica INT UNSIGNED, 
	CONSTRAINT PK_PlaylistMusica_IdPlaylist_Musica PRIMARY KEY (IdPlaylist_Musica),
	CONSTRAINT FK_PlaylistMusica_IdPlaylist FOREIGN KEY (IdPlaylist)
		REFERENCES Playlist  (IdPlaylist),
	CONSTRAINT FK_PlaylistMusica_IdMusica FOREIGN KEY (IdMusica)
		REFERENCES Musica (IdMusica)
);

-- TABELA ASSINATURA 
CREATE TABLE IF  NOT EXISTS Assinatura
(
	IdAssinatura INT UNSIGNED AUTO_INCREMENT,
	IdUsuario INT UNSIGNED ,
	Tipo_Assinatura TINYINT, 
	CONSTRAINT PK_Assinatura_IdAssinatura PRIMARY KEY (IdAssinatura2),
    CONSTRAINT FK_Assinatura_IdUsuario FOREIGN KEY (IdUsuario)
		REFERENCES Usuario (IdUsuario)
);

-- TABELA MODELO PREMIUM
CREATE TABLE IF  NOT EXISTS Modelo_Premium
(
	IdPremium INT UNSIGNED AUTO_INCREMENT,
	IdAssinatura INT UNSIGNED,
	Nome_Conta_Premium VARCHAR(45),
	Preco DECIMAL(3,2),
	CONSTRAINT PK_Premium_IdPremium  PRIMARY KEY (IdPremium ),
    CONSTRAINT FK_Premium_IdAssinatura FOREIGN KEY (IdAssinatura)
		REFERENCES Assinatura (IdAssinatura)
);

-- TABELA MODELO GRATUITO
CREATE TABLE IF  NOT EXISTS Modelo_Gratuito
(
	IdGratuito INT UNSIGNED AUTO_INCREMENT,
	IdAssinatura INT UNSIGNED,
	Nome_Conta_Gratuita VARCHAR(45),
	CONSTRAINT PK_Gratuito_IdGratuito  PRIMARY KEY (IdGratuito ),
    CONSTRAINT FK_Gratuito_IdAssinatura FOREIGN KEY (IdAssinatura)
		REFERENCES Assinatura (IdAssinatura)
);
