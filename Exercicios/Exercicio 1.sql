-- 1.1 Você acabou de ser contratado pela Momento! Vamos começar incluindo você no sistema.

INSERT INTO funcionarios (
    primeiro_nome, 
    sobrenome, 
    email, 
    senha, 
    telefone, 
    data_contratacao, 
    cargo_id, 
    salario, 
    gerente_id, 
    departamento_id
) VALUES (
    'Guilherme', 
    'Farias', 
    'guirafias@momento.org', 
    'guirafias@momento', 
    '555.123.9999', 
    '2026-10-27', 
    9,          -- Cargo: Web Developer
    8500.00, 
    103,        -- Gerente: Alexander Hunold
    6           -- Departamento: Tecnologia
);

-- 1.2 Agora que você faz parte da equipe, quantos funcionários temos ao total na empresa?

SELECT COUNT(*) AS total_funcionarios 
FROM funcionarios;

-- 1.3 Quantos funcionários trabalham especificamente no Departamento de Tecnologia?

SELECT COUNT(*) AS total_tecnologia 
FROM funcionarios 
WHERE departamento_id = 6;

-- 1.4 Liste todos os departamentos que existem na empresa. Quantos são?

-- ID e Nomear os Departamentos
SELECT 
    departamento_id AS id_departamento, 
    departamento_nome AS nome_departamento 
FROM departamentos;
-- Total de Departamentos
SELECT COUNT(*) AS total_departamentos 
FROM departamentos;

-- 1.5 Quantos escritórios a Momento possui? Em quais países?

SELECT 
    paises.pais_nome AS nome_pais, 
    COUNT(escritorios.escritorio_id) AS quantidade_escritorios
FROM escritorios
JOIN paises ON escritorios.pais_id = paises.pais_id
GROUP BY paises.pais_nome;