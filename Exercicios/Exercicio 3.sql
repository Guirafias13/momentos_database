-- 3.1 Quantos funcionários da empresa Momento possuem cônjuges?

USE momento;

SELECT COUNT(DISTINCT funcionario_id) 
FROM dependentes 
WHERE relacionamento = 'Cônjuge';

-- 3.2 Quantos funcionários possuem filhos registrados?

SELECT COUNT(DISTINCT funcionario_id) 
FROM dependentes 
WHERE relacionamento = 'Filha(o)'; 

-- 3.3 Qual funcionário foi contratado há mais tempo na empresa?

SELECT primeiro_nome, sobrenome, data_contratacao 
FROM funcionarios 
ORDER BY data_contratacao ASC 
LIMIT 1;

-- 3.4 Qual funcionário foi contratado há menos tempo na empresa?

SELECT primeiro_nome, sobrenome, data_contratacao 
FROM funcionarios 
ORDER BY data_contratacao DESC
LIMIT 1;

-- 3.5 Liste os 5 funcionários com mais tempo de casa, ordenados pela data de contratação.

SELECT primeiro_nome, sobrenome, data_contratacao 
FROM funcionarios 
ORDER BY data_contratacao ASC 
LIMIT 5;

-- 3.6 Quantos funcionários foram contratados na década de 1990 (entre 1990-1999)?

SELECT COUNT(*) 
FROM funcionarios 
WHERE data_contratacao >= '1990-01-01' 
  AND data_contratacao <= '1999-12-31';

-- 3.7 Como a média salarial da Momento evoluiu ao longo dos anos? Agrupe por ano de contratação e calcule a média salarial.

SELECT 
    YEAR(data_contratacao) AS ano, 
    ROUND(AVG(salario), 2) AS media_salarial 
FROM funcionarios 
GROUP BY YEAR(data_contratacao) 
ORDER BY ano ASC;