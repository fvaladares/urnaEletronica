-- Query para consultar candidatos à presidente da república que têm número 13;
SELECT * 
	FROM candidato c
	WHERE c.numero_partido = 13
	AND c.cargo = 'Presidente da República';

-- Busca todos os candidatos a presidência (* significa todos)
SELECT * 
	FROM candidato c
	WHERE c.cargo = 'Presidente da República';

-- Busca todos os candidatos a presidência
-- em ordem decrescente (nome)
SELECT * 
	FROM candidato c
	WHERE c.cargo = 'Presidente da República'
	ORDER BY c.nome_candidato DESC; --ASC
	
	
-- Crie a query para listar todos os candidatos
-- a deputado federal, ordenados por partido 
-- em ordem crscente
	
	SELECT * FROM candidato c 
		WHERE c.cargo = "Deputado Federal" 
		ORDER BY c.numero_partido ASC;
-- Crie uma consulta que exiba a quantidade de 
-- eleitores cadastrados.

	SELECT COUNT (*) AS qtd_eleitores 
	FROM eleitor e;

	
-- consulta com limitação da quantidade de 
-- registros retorandos;
--- útil quando a tabela possui muitos dados;	
	SELECT * FROM eleitor e LIMIT 10;
	

-- Escreva uma query que liste:
-- o número do candidato; o nome; o nome do partido
-- e a sigla;

SELECT c.numero_candidato, c.nome_candidato, c.cargo , 
		p.nome_partido, p.sigla 
	FROM candidato c, partido p	
	WHERE c.cargo  LIKE 'Dep%'
	AND c.numero_partido = p.numero_partido ;

-- Consulta limitada aos dados do partido;
SELECT * FROM partido p LIMIT 3;
	
	
	
	
	
