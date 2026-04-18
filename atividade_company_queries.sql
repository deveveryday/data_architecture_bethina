CREATE TABLE table_department (
  id_department INT PRIMARY KEY AUTO_INCREMENT,
  name_department VARCHAR(100) NOT NULL
);

CREATE TABLE table_employee (
  id_employee INT PRIMARY KEY AUTO_INCREMENT,
  name_employee VARCHAR(100) NOT NULL,
  occupation_employee VARCHAR(100) NOT NULL,
  salary_employee DECIMAL(10,2),
  id_department INT,
  FOREIGN KEY (id_department) REFERENCES table_department(id_department)
);

CREATE TABLE table_project (
  id_project INT PRIMARY KEY AUTO_INCREMENT,
  name_project VARCHAR(100) NOT NULL
);

CREATE TABLE table_employee_project (
  id_employee INT,
  id_project INT,
  PRIMARY KEY (id_employee, id_project)
);
 
 --###############################################################
 
 INSERT INTO table_department (name_department) 
 VALUES
('Technology'),
('Finance'),
('Marketing'),
('Human Resources'),
('Legal Department');

INSERT INTO table_employee (name_employee, occupation_employee, salary_employee, id_department)
VALUES
('Ana', 'Analyst', 41500.00, 1),
('Bruna', 'Developer', 62000.00, 1),
('Carla', 'Assistent', 32000.00, 2),
('Dani', 'Coordinator', 71300.00, 3),
('Elisa', 'Analyst', 44800.00, 2),
('Felice', 'Trainee', 18020.00, 4),
('Gabriela', 'Manager', 90300.00, 3),
('Henna', 'Analyst', 52400.00, NULL);

INSERT INTO table_project (name_project) 
VALUES
('Projeto Alpha'),
('Projeto Beta'),
('Projeto Gama'),
('Projeto Delta'),
('Projeto Ômega');

INSERT INTO table_employee_project (id_employee, id_project) 
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(4, 3),
(5, 4),
(7, 1),
(7, 4);

 
--###############################################################
/* 
Parte 3 – Atividades
*/

-- 1. Liste todos os funcionários em ordem alfabética.
SELECT *
FROM table_employee
ORDER BY name_employee;

-- 2. Mostre os 3 primeiros funcionários ordenados pelo id_funcionario.
SELECT *
FROM table_employee
ORDER BY id_employee
LIMIT 3;

-- 3. Liste os 3 funcionários com maiores salários.
SELECT *
FROM table_employee
ORDER BY salary_employee DESC
LIMIT 3;

-- 4. Liste os cargos sem repetição.
SELECT DISTINCT occupation_employee
FROM table_employee;

-- 5. Liste os funcionários do departamento Tecnologia.
SELECT employee.*
FROM table_employee employee
INNER JOIN table_department department
  ON employee.id_department = department.id_department
WHERE department.name_department = 'Technology';

-- 6. Liste os funcionários de Tecnologia ou Financeiro.
SELECT employee.*
FROM table_employee employee
INNER JOIN table_department department
  ON employee.id_department = department.id_department
WHERE
  department.name_department = 'Technology' OR
  department.name_department = 'Finance';
  
-- 7. Liste funcionários com salário > 40000 e de Tecnologia.
SELECT employee.*
FROM table_employee employee
INNER JOIN table_department department
  ON employee.id_department = department.id_department
WHERE
  employee.salary_employee > 40000 AND
  department.name_department = 'Technology';
  
-- 8. Funcionários sem departamento.
SELECT *
FROM table_employee
WHERE id_department IS NULL;

-- 9. Funcionários com departamento.
SELECT *
FROM table_employee
WHERE id_department IS NOT NULL;

-- 10. Nome e salário ordenado do maior para o menor.
SELECT 
  name_employee,
  salary_employee
FROM table_employee
ORDER BY salary_employee DESC;

-- 11. Funcionários de Tecnologia ou Financeiro com salário > 45000
SELECT employee.*
FROM table_employee employee
INNER JOIN table_department department
  ON employee.id_department = department.id_department
WHERE
  employee.salary_employee > 45000 AND
  (department.name_department = 'Technology' OR
  department.name_department = 'Finance');
  
-- 12. Explique por que parênteses são importantes.
-- R.: Os parênteses determinam ordem de execução desejada pelo programador

-- 13. Funcionários cujo nome começa com A ou B
SELECT *
FROM table_employee
WHERE name_employee LIKE 'A%' OR name_employee LIKE 'B%';

-- 14. Funcionários com departamento em Marketing ou RH
SELECT employee.*
FROM table_employee employee
INNER JOIN table_department department
  ON employee.id_department = department.id_department
WHERE
  department.name_department = 'Human Resources' OR
  department.name_department = 'Marketing';
  
-- 15. Nome do funcionário + nome do departamento (incluindo quem não tem departamento)
SELECT 
  employee.name_employee,
  department.name_department
FROM table_employee employee
LEFT JOIN table_department department
  ON employee.id_department = department.id_department;
  
-- 16. Funcionário + projeto (somente quem participa)
SELECT 
  employee.*,
  project.name_project
FROM table_employee employee
INNER JOIN table_employee_project employee_project
  ON employee.id_employee = employee_project.id_employee
INNER JOIN table_project project
  ON project.id_project = employee_project.id_project;

-- 17. Funcionários que NÃO participam de projetos
SELECT 
  employee.*
FROM table_employee employee
LEFT JOIN table_employee_project employee_project
  ON employee.id_employee = employee_project.id_employee
WHERE employee_project.id_employee IS NULL;

-- 18. Projetos sem funcionários
SELECT *
FROM table_project project
LEFT JOIN table_employee_project employee_project
  ON project.id_project = employee_project.id_project
WHERE employee_project.id_project IS NULL;


-- 19. Nome do funcionário + departamento + projeto
SELECT 
  employee.name_employee,
  department.name_department,
  project.name_project
FROM table_employee employee
INNER JOIN table_employee_project employee_project
  ON employee.id_employee = employee_project.id_employee
INNER JOIN table_project project
  ON project.id_project = employee_project.id_project
INNER JOIN table_department department
  ON department.id_department = employee.id_department;
  
-- 20.Departamentos que possuem funcionários
SELECT department.*
FROM table_department department
INNER JOIN table_employee employee
  ON department.id_department = employee.id_employee;
  
-- 21.Departamentos sem funcionários
SELECT department.*
FROM table_department department
LEFT JOIN table_employee employee
  ON department.id_department = employee.id_department
WHERE employee.id_department IS NULL;

-- 22.Classifique:
-- • Com departamento
-- • Sem departamento
SELECT 
  name_employee,
  CASE
    WHEN id_department IS NULL THEN 'Without Department'
    ELSE 'With Department'
  END AS status_employee
FROM table_employee;


-- 23.Classifique salário:
-- • Alto ≥ 70000 
SELECT 
  name_employee,
  salary_employee,
  CASE
    WHEN salary_employee >= 70000 THEN 'High $$'
    ELSE ''
  END AS salary_classification_employee
FROM table_employee;


