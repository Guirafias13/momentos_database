-- 2.1 Quantos funcionários trabalham no Departamento de Vendas?

SELECT COUNT(*) AS total_funcionarios_vendas
FROM funcionarios 
WHERE departamento_id = 8;

-- 2.2 Qual é o custo total com salários do Departamento de Vendas?

SELECT SUM(salario) AS custo_total_salarios
FROM funcionarios 
WHERE departamento_id = 8;

-- 2.3 Qual é a média salarial da empresa, excluindo os cargos de CEO, CMO e CFO?

SELECT ROUND(AVG(salario), 2) AS media_salarial_geral
FROM funcionarios 
WHERE cargo_id NOT IN (
    SELECT cargo_id 
    FROM cargos 
    WHERE cargo_nome IN ('CEO', 'CMO', 'CFO')
);

-- 2.4 Qual é a média salarial do Departamento de Tecnologia?

SELECT ROUND(AVG(salario), 2) AS media_salarial_tecnologia
FROM funcionarios 
WHERE departamento_id = 6;

-- 2.5 Qual departamento possui a maior média salarial?

SELECT 
    departamentos.departamento_nome AS nome_departamento, 
    ROUND(AVG(funcionarios.salario), 2) AS maior_media_salarial
FROM funcionarios
JOIN departamentos ON funcionarios.departamento_id = departamentos.departamento_id
GROUP BY departamentos.departamento_nome
ORDER BY maior_media_salarial DESC
LIMIT 1;

-- 2.6 Qual departamento possui o menor número de funcionários?

SELECT 
    departamento_id AS id_departamento, 
    COUNT(*) AS total_funcionarios
FROM funcionarios 
GROUP BY departamento_id 
ORDER BY total_funcionarios ASC;