select 'Quem nasce em ' + nome + ' ? ' + gentilico [DESCRICAO] from CIDADES

SELECT 'Quem nasce em ' + nome + ' ? ' + UPPER(LEFT(gentilico,1))+LOWER(SUBSTRING(gentilico,2,LEN(gentilico))) FROM CIDADES

SELECT POPULACAO_2010 *10 FROM CIDADES
--'TESTE' + CONVERT (VARCHAR,(POPULACAO_2010*10)) FROM CIDADES

SELECT * FROM CIDADES

ALTER TABLE CIDADES ADD DATA_FUNDACAO DATETIME
INSERT CIDADES
(
	DATA_FUNDACAO
)
VALUES
(
	'01/05/1990'
)