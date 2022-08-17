create database TERRA

USE TERRA
CREATE TABLE CIDADE
(
	CODIGO_CIDADE INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(50) NOT NULL,
	POPULACAO INT NOT NULL,
	GENTILICO VARCHAR(60) NOT NULL,
	AREA DECIMAL(12,2) NOT NULL,
	--CODIGO_ESTADO INT
)

CREATE TABLE ESTADO
(
	CODIGO_ESTADO INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(50) NOT NULL,
	SIGLA CHAR(2) NOT NULL,
	--CODIGO_REGIAO INT 
)

CREATE TABLE REGIAO
(
	CODIGO_REGIAO INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(30) NOT NULL,
)

ALTER TABLE CIDADE ADD AREA DECIMAL(12,2) NOT NULL --ALTERAR UMA TABELA E ACRESCENTAR UMA COLUNA


ALTER TABLE CIDADE ADD CONSTRAINT REGRA_COD_ESTADO FOREIGN KEY (CODIGO_ESTADO) REFERENCES ESTADO (CODIGO_ESTADO)
ALTER TABLE ESTADO ADD CONSTRAINT REGRA_COD_REGIAO FOREIGN KEY (CODIGO_REGIAO) REFERENCES REGIAO (CODIGO_REGIAO)

UPDATE CIDADE SET CODIGO_ESTADO = 1 WHERE NOME = 'BAURU';
UPDATE CIDADE SET CODIGO_ESTADO = 9 WHERE NOME = 'BELEM';
UPDATE CIDADE SET CODIGO_ESTADO = 18 WHERE NOME = 'BLUMENAU';



INSERT CIDADE
(
	NOME,
	POPULACAO,
	GENTILICO,
	AREA
)
VALUES
(
	'BLUMENAU',
	'361855',
	'BLUMENAUENSE',
	'518619'
)

INSERT ESTADO
(
	NOME,
	SIGLA
)
VALUES
(
	'RIO_DE_JANEIRO',
	'RJ'
)

INSERT REGIAO
(
	NOME
)
VALUES
(
	'NORDESTE'
)

SELECT ESTADO.NOME AS MONTANHA, CIDADE.NOME FROM CIDADE
INNER JOIN ESTADO ON ESTADO.CODIGO_ESTADO = CIDADE.CODIGO_ESTADO
INNER JOIN REGIAO ON REGIAO.CODIGO_REGIAO = ESTADO.CODIGO_REGIAO-- CODIGO_ESTADO CHAVE PRIMARIA = CODIGO_CIDADE CHAVE ESTRANGEIRA