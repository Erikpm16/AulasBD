
like '%ra' -- tudo antes do 'r' vai aparecer 'ra' final da palavra.
and --tem que ser verdadeiro todas as condições,
or -- uma ou outra tem que ser verdadeiro
order by  -- ordenar pela coluna que for colocada
order by asc -- ordem alfabetica -- desc do menor para maior (asc não precisa colocar já fica automatico)

--CODIGO PROFESSOR
Select TOP 1 ATT.DATAHORA [DATA ATENDIMENTO], ATT.DESCRICAO [DESC ATENDIMENTO], PAC.NOME [PACIENTE], PAC.CPF, PAC.DATANASC, PRES.DESCRICAO_PRESCRICAO [DESCRICAO], 
		MED.NOME [MEDICO], MED.CRM [CRM], DOE.NOME [DOENCA]
	FROM ATENDIMENTO ATT
		INNER JOIN PACIENTE PAC ON PAC.CODIGO_PACIENTE = ATT.CODIGO_PACIENTE
		INNER JOIN PRESCRICAO PRES ON PRES.CODIGO_PRESCRICAO = ATT.CODIGO_PACIENTE
		INNER JOIN MEDICO MED ON MED.CODIGO_MEDICO = ATT.CODIGO_MEDICO
		INNER JOIN DOENCA DOE ON DOE.CODIGO_DOENCA = ATT.CODIGO_ATENDIMENTO
		INNER JOIN ESPECIALIDADE ESP ON ESP.CODIGO_ESPECIALIDADE = MED.CODIGO_ESPECIALIDADE
		ORDER BY ATT.DATAHORA DESC


-- Faça uma consulta que retorne todas as cidades (nome da cidade, habitantes  e nome do estado) com mais de 100.000 habitantes do Ceará.

select top 8 cid.nome, cid.populacao_2010, estados.nome from cidades cid
	INNER JOIN estados on estados.id = cid.estado_id
	WHERE estados.nome = 'Ceará'
	order by populacao_2010 desc

-- Faca uma consulta que retorne a maior cidade(area) do Norte (nome da cidade, habitantes, tamanho, nome do estado e sigla estado)
-- 1Acre, 4Amapá, 3Amazonas, 14Pará, 21Rondônia, 22Roraima e 27Tocantins.

select top 1 cid.nome, cid.populacao_2010, cid.area, estados.nome, estados.sigla from cidades cid
	INNER JOIN estados on estados.id = cid.estado_id
	where estados.id = 1 or estados.id = 14 or estados.id = 4 or estados.id = 3 or estados.id = 21 or estados.id = 22 or estados.id = 27
	order by cid.area desc

-- qual a menor cidade do Brasil?

select top 1 cid.nome, cid.area from cidades cid
order by cid.area

-- qual a cidade com menos habitantes 

select top 1 cid.nome, cid.area from cidades cid
order by cid.populacao_2010

--Faca uma consulta que retorne todas as cidades(nome da cidade, habitantes, gentilico, area e nome do estado) com menos de 50000 habitantes que sejam de 13mato grosso ou 19rio de janeiro
--que o nome da cidade termine em r e que tenham area maior que 22641

select cd.nome, cd.populacao_2010, cd.gentilico, cd.area, estados.nome from CIDADES cd
inner join estados on estados.id = cd.estado_id
where (estados.id = 13 or estados.id = 19) and cd.nome LIKE '%a' and cd.populacao_2010 < 50000 and cd.area > 22641

--CODIGO PROFESSOR
SELECT * FROM CIDADES
INNER JOIN estados ON ESTADOS.id = CIDADES.estado_id
WHERE CIDADES.populacao_2010 < 50000
AND estados.nome IN ('MATO GROSSO','RIO DE JANEIRO') AND CIDADES.nome LIKE '%A'
AND CIDADES.area > 22641
ORDER BY CIDADES.area

-- TRAZER CIDADE COM MAIS DE 300.000 E MENOS DE 1.000.000
SELECT * FROM CIDADES
WHERE CIDADES.populacao_2010 > 300000 AND CIDADES.populacao_2010 < 1000000
ORDER BY CIDADES.populacao_2010

--CODIGO DO PROFESSOR

SELECT * FROM CIDADES
WHERE  populacao_2010 BETWEEN 300000 AND 1000000  

select * from estados