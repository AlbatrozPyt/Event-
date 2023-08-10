--DDL

--criar banco de dados
CREATE DATABASE [Event+_Tarde]
USE [Event+_Tarde]

--criar as tabelas
CREATE TABLE TiposDeUsuario
(
	IdTiposDeUsuario INT PRIMARY KEY IDENTITY,
	TituloTiposUsuario VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE TiposDeEvento
(
	IdTiposDeEvento INT PRIMARY KEY IDENTITY,
	TituloTipoEvento VARCHAR(20) NOT NULL UNIQUE
);

--alter table NOMEDATABELA add unique (TITULODACOLUNA)

CREATE TABLE Instituicao
(
	IdInstituicao INT PRIMARY KEY IDENTITY,
	CNPJ CHAR(14) NOT NULL UNIQUE,
	NomeFantasia VARCHAR(20) NOT NULL,
	Endereco VARCHAR(20) NOT NULL
);

CREATE TABLE Usuario
(
	IdUsuario INT PRIMARY KEY IDENTITY,
	IdTiposDeUsuario INT FOREIGN KEY REFERENCES TiposDeUsuario(IdTiposDeUsuario) NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Email VARCHAR(50) NOT NULL UNIQUE,
	Senha VARCHAR(20) NOT NULL
);

CREATE TABLE Evento
(
	IdEvento INT PRIMARY KEY IDENTITY,
	IdTiposDeEvento INT FOREIGN KEY REFERENCES TiposDeEvento(IdTiposDeEvento) NOT NULL,
	IdInstituicao INT FOREIGN KEY REFERENCES Instituicao(IdInstituicao) NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Descricao VARCHAR(100) NOT NULL,
	DataEvento DATE NOT NULL,
	HorarioEvento TIME NOT NULL
);

CREATE TABLE PresencasEvento
(
	IdPresencasEvento INT PRIMARY KEY IDENTITY,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL,
	IdEvento INT FOREIGN KEY REFERENCES Evento(IdEvento) NOT NULL,
	Situacao BIT DEFAULT(0)
);

CREATE TABLE ComentarioEvento
(
	IdComentario INT PRIMARY KEY IDENTITY,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL,
	IdEvento INT FOREIGN KEY REFERENCES Evento(IdEvento) NOT NULL,
	Descricao VARCHAR(20) NOT NULL,
	Exibe BIT DEFAULT(0)
);