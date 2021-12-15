CREATE DATABASE SEGURADORA;
USE SEGURADOR;
CREATE TABLE EMPRESASEGURADORA(
id_empresa INT PRIMARY KEY AUTO_INCREMENT,
nome_empresa VARCHAR (20) not null,
cnpj CHAR (14) NOT NULL UNIQUE,
nome_fantasia  VARCHAR(20) NOT NULL UNIQUE,
fone_empresa char (10),
email varchar (14) NOT NULL UNIQUE,
logradouro varchar (20),
bairro char (10),
cidade char(10),
estado char (8),
cep char (8)
);
CREATE TABLE PROPRIETARIOS(
id_proprietario INT PRIMARY KEY AUTO_INCREMENT,
FOREIGN KEY (id_empresa) REFERENCES EMPRESASEGURADORA ,
nome_empresa VARCHAR (20) not null,
cnpj CHAR (14) NOT NULL UNIQUE,
nome_fantasia  VARCHAR(20),
fone_empresa char (10),
email varchar (14),
logradouro varchar (20),
bairro char (10),
cidade char(10),
estado char (8),
cep char (8)
);
CREATE TABLE TIPODOC(
id_tipodoc INT PRIMARY KEY AUTO_INCREMENT,
FOREIGN KEY (id_proprietario) REFERENCES PROPRIETARIOS,
tipodoc VARCHAR (10) not null,)

