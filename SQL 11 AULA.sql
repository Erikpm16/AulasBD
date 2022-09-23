
select CIDADES.nome[cidade], CIDADES.populacao_2010[populacao], estados.nome[estado], 
case 
	when CIDADES.populacao_2010 > 1000000 then 'grande' 
	when CIDADES.populacao_2010 > 100000 and CIDADES.populacao_2010 <= 1000000 then 'medio' 
	when CIDADES.populacao_2010 < 100000 then 'pequeno'
	ELSE 'morta'
end AS PORTE
from CIDADES
INNER JOIN ESTADOS ON ESTADOS.ID = CIDADES.ESTADO_ID
order by CIDADES.populacao_2010 desc



