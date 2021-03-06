CREATE DATABASE DB_LIVRARIA

USE DB_LIVRARIA

CREATE TABLE TB_LIVRO (
CODIGO_LIVRO INT CONSTRAINT CONSTRAINT_PK_LIVRO PRIMARY KEY IDENTITY,
TITULO VARCHAR(100),
LINGUA VARCHAR(30)
)

CREATE TABLE TB_EDICAO (
COD_ISBN INT IDENTITY CONSTRAINT CONSTRAINT_PK_EDICAO PRIMARY KEY,
ANO INT,
PRECO SMALLMONEY,
PAGINAS INT,
QTD_ESTOQUE INT,
FK_COD_LIVRO INT CONSTRAINT CONST_FK_LIVRO FOREIGN KEY REFERENCES TB_LIVRO(CODIGO_LIVRO) 
)

CREATE TABLE TB_AUTOR (
MATRICULA INT IDENTITY CONSTRAINT CONST_PK_AUTOR PRIMARY KEY,
NOME VARCHAR(100),
DATA_NASC DATE,
PAIS_NASC VARCHAR(50),
BIOGRAFIA VARCHAR(360)
)

CREATE TABLE TB_EDITORA (
CODIGO INT IDENTITY CONSTRAINT CONST_PK_EDITORA PRIMARY KEY,
NOME VARCHAR(100),
RUA VARCHAR(100),
CEP INT,
TELEFONE INT,
)

CREATE TABLE TB_CADASTRO (
COD_CADASTRO INT IDENTITY CONSTRAINT CONST_PK_CADASTRO PRIMARY KEY,
FK_CADASTRO_LIVRO INT CONSTRAINT CONST_FK_CADASTRO_LIVRO FOREIGN KEY REFERENCES TB_LIVRO(CODIGO_LIVRO),
FK_CADASTRO_AUTOR INT CONSTRAINT CONST_FK_CADASTRO_AUTOR FOREIGN KEY REFERENCES TB_AUTOR(MATRICULA),
FK_CADASTRO_EDITORA INT CONSTRAINT CONST_FK_CADASTRO_EDITORA FOREIGN KEY REFERENCES TB_EDITORA(CODIGO)
)

ALTER TABLE TB_EDITORA 
ADD FK_EDITORA_CADASTRO INT

ALTER TABLE TB_EDITORA
ADD FOREIGN KEY (FK_EDITORA_CADASTRO)
REFERENCES TB_CADASTRO(COD_CADASTRO)

ALTER TABLE TB_EDITORA
ADD CONSTRAINT CONST_FK_EDIT_CAD FOREIGN KEY(FK_EDITORA_CADASTRO) REFERENCES TB_CADASTRO(COD_CADASTRO)