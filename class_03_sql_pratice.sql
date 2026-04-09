/*
Turma 1 Ciência de Dados
Artur Justino
-----------------------------------------------------

CREATE DATABASE Atividades;
USE Atividades;

SET SQL_SAFE_UPDATES = 0;
*/
# ATIVIDADE 01 linha 19
# ATIVIDADE 02 linha 324
# ATIVIDADE 03 linha 558
# ATIVIDADE 04 linha 623
# *************
# *************
# *************
# *************
# ************* ATIVIDADE 01 *************
# *************

-- ----------------------------------------------
# 1. Crie a tabela funcionários 
-- ----------------------------------------------

CREATE TABLE Atividades.Table_Employee (
	id_employee 			INT NOT NULL AUTO_INCREMENT,
	name_employee 			VARCHAR(100),
	department_employee 	VARCHAR(100),
	age_employee			INT,
	salary_employee			DECIMAL(10, 2),
	PRIMARY KEY(id_employee)
);


-- ----------------------------------------------
# 2. Insira os 8 funcionários:
-- ----------------------------------------------

INSERT INTO Atividades.Table_Employee (
	name_employee,
    department_employee,
    age_employee,
    salary_employee
)
VALUES (
	'Serena Williams',
    'Data Science Room',
    '50',
    20000
),(
	'Ashley Judd',
    'Python Solutions',
    '71',
    25000
),(
	'Jordana Brewster',
    'Quality',
    '20',
    10000
),(
	'Ashley Tisdale',
    '.NET',
    '35',
    35000
),(
	'Vanessa Hudgens',
    'Cyber Security',
    '27',
    50000
),(
	'Vanessa Jackson',
    'Data Science Room',
    '77',
    60000
),(
	'Aline Midlej',
    'Social Media',
    '80',
    70000
),(
	'Britney Spears',
    'Social Media',
    '40',
    31000
);






























START TRANSACTION;

INSERT INTO Atividades.Table_Employee (
	name_employee,
    department_employee,
    age_employee,
    salary_employee
)
VALUES (
	'Serena Williams',
    'Data Science Room',
    '50',
    20000
),(
	'Ashley Judd',
    'Python Solutions',
    '71',
    25000
),(
	'Jordana Brewster',
    'Quality',
    '20',
    10000
),(
	'Ashley Tisdale',
    '.NET',
    '35',
    35000
),(
	'Vanessa Hudgens',
    'Cyber Security',
    '27',
    50000
),(
	'Vanessa Jackson',
    'Data Science Room',
    '77',
    60000
),(
	'Aline Midlej',
    'Social Media',
    '80',
    70000
),(
	'Britney Spears',
    'Social Media',
    '40',
    31000
);

-- ----------------------------------------------
# 3. Mostre todos os funcionários.
-- ----------------------------------------------

SELECT * FROM Atividades.Table_Employee;


-- ----------------------------------------------
# 4. Mostre os funcionários ordenados pelo salário do maior para o menor.
-- ----------------------------------------------

SELECT *
FROM Atividades.Table_Employee
ORDER BY salary_employee DESC;


-- ----------------------------------------------
# 5. Atualize o salário da Gabriela para 3300.00 e verifique a alteração.
# 		* nome = 'Aline Midlej'
-- ----------------------------------------------

UPDATE Atividades.Table_Employee
SET salary_employee = 3300
WHERE name_employee = 'Aline Midlej';


-- ----------------------------------------------
# 6. O funcionário Bruno mudou de departamento e foi para TI, atualize a informações e verifique a alteração.
#		* nome = Britney
-- ----------------------------------------------

UPDATE Atividades.Table_Employee
SET department_employee = 'IT'
WHERE name_employee = 'Britney Spears';


SELECT * FROM Atividades.Table_Employee;
-- ----------------------------------------------
# 7. A funcionária Eduarda foi demitida, remova suas informações da tabela e verifique a alteração.
# 		* nome = Ashley
-- ----------------------------------------------

DELETE FROM Atividades.Table_Employee
WHERE name_employee = 'Ashley Judd';

SELECT * FROM Atividades.Table_Employee;


-- ----------------------------------------------
# 8. Conte quantos funcionários existem na empresa.
-- ----------------------------------------------

SELECT COUNT(*) amount_employee
FROM Atividades.Table_Employee;


-- ----------------------------------------------
# 9. Mostre a quantidade de funcionários por departamento.
-- ----------------------------------------------

SELECT
	COUNT(*) amount_employee,
	department_employee
FROM Atividades.Table_Employee
GROUP BY department_employee;


-- ----------------------------------------------
# 10. Mostre a média salarial por departamento.
-- ----------------------------------------------

SELECT
	AVG(salary_employee) average_salary_employee,
	department_employee
FROM Atividades.Table_Employee
GROUP BY department_employee;


-- ----------------------------------------------
# 11. Mostre o salário total pago por departamento.
-- ----------------------------------------------

SELECT
	SUM(salary_employee) total_salary_employee,
	department_employee
FROM Atividades.Table_Employee
GROUP BY department_employee;


-- ----------------------------------------------
/* 
12. Monte um relatório por departamento contendo: 
• quantidade de funcionários
• média salarial
• maior salário
• menor salário
• total pago
*/
-- ----------------------------------------------
SELECT
	COUNT(*) amount_employee,
    AVG(salary_employee) avarage_salary_employee,
    MAX(salary_employee) max_salary_employee,
    MIN(salary_employee) min_salary_employee,
    SUM(salary_employee) total_salary_employee
FROM Atividades.Table_Employee;

#9	40555.555556	70000.00	4000.00	365000.00
-- ----------------------------------------------
/* 
13.Mostre apenas departamentos que:
• possuem mais de 1 funcionário
• e possuem média salarial maior que 3000
*/
-- ----------------------------------------------

SELECT
	department_employee,
    COUNT(*) amount_employee
FROM Atividades.Table_Employee
GROUP BY department_employee
HAVING amount_employee > 1;

SELECT
	department_employee,
    AVG(salary_employee) average_employee
FROM Atividades.Table_Employee
GROUP BY department_employee
HAVING average_employee > 3000;


-- ----------------------------------------------
/* 
14. Ordene o relatório pelo total pago, do maior para o menor.
*/
-- ----------------------------------------------

SELECT 
	SUM(salary_employee) total_salary_department,
    department_employee
FROM Atividades.Table_Employee
GROUP BY department_employee
ORDER BY total_salary_department DESC;


-- ----------------------------------------------
/* 
15.Com base nos resultados, responda:
• Qual departamento parece ser o mais caro para a empresa? Justifique sua resposta com base nos dados
R.: Social Media, devido o valor exibido na query 15, 171000.
*/
-- ----------------------------------------------
# *************
# *************
# *************
# *************
# *************
# ************* ATIVIDADE 02 *************
# *************

/*
Uma loja deseja analisar suas vendas. Crie uma tabela chamada vendas
com os seguintes campos:
Campo Tipo
id INT, chave primária, auto incremento
produto VARCHAR(100)
categoria VARCHAR(100)
quantidade INT
valor DECIMAL(10,2)
*/

CREATE TABLE Atividades.Table_Sale (
	id_sale			INT NOT NULL AUTO_INCREMENT,
    product_sale	VARCHAR(100),
    category_sale	VARCHAR(100),
    amount_sale		INT,
    price_sale		DECIMAL(10, 2),
    PRIMARY KEY (id_sale)
);


-- ----------------------------------------------
/* 
1. Insira os 8 registros de vendas:
*/
-- ----------------------------------------------

INSERT INTO Atividades.Table_Sale (
	product_sale,
    category_sale,
    amount_sale,
    price_sale
)
VALUES (
	'Apple iPhone 18',
    'Smartphone',
    '477',
    10000
),(
	'Apple MacBook Pro',
    'laptop',
    '44',
    21000
),(
	'Dell Notebook Razor',
    'laptop',
    '10',
    8000
),(
	'Sure SM 58',
    'Microphone',
    '11',
    100
),(
	'Intelbras Camera i8',
    'Camera',
    '3',
    50
),(
	'Sony Playstation 5',
    'Game Console',
    '4444',
    1000
),(
	'Dell Monitor 77',
    'Monitor',
    '4',
    500
),(
	'Giannini Cavaquinho Raiz',
    'Musical Instrument',
    '1',
    1000
),(
	'Book Python 3',
    'Book',
    '15',
    20
),(
	'Desk Delany Room 10x10',
    'Desk',
    '12',
    75
);

-- ----------------------------------------------
/* 
2. Mostre todas as vendas.
*/
-- ----------------------------------------------

SELECT * FROM Atividades.Table_Sale;


-- ----------------------------------------------
/* 
3. Mostre os produtos ordenados pelo valor do maior para o menor.
*/
-- ----------------------------------------------

SELECT *
FROM Atividades.Table_Sale
ORDER BY price_sale DESC;


-- ----------------------------------------------
/* 
4. O ‘Livro Python’ teve um aumento de 25% no seu valor, atualize e verifique a alteração.
*/
-- ----------------------------------------------

UPDATE Atividades.Table_Sale
SET price_sale = price_sale * 1.25
WHERE id_sale = 9;

SELECT * FROM Atividades.Table_Sale
WHERE id_sale = 9;
-- ----------------------------------------------
/* 
5. Foi vendida a última mesa e a empresa não irá mais trabalhar com esse tipo de móvel. Faça a exclusão da tabela desse item.
*/
-- ----------------------------------------------

DELETE FROM Atividades.Table_Sale
WHERE category_sale = 'Desk';


-- ----------------------------------------------
/* 
6. Conte quantas vendas existem.
*/
-- ----------------------------------------------

SELECT COUNT(*) amount_sale
FROM Atividades.Table_Sale;


-- ----------------------------------------------
/* 
7. Mostre a quantidade de vendas por categoria.
*/
-- ----------------------------------------------

SELECT
	COUNT(*) amount_sale,
	category_sale
FROM Atividades.Table_Sale
GROUP BY category_sale;


-- ----------------------------------------------
/* 
8. Mostre o valor médio por categoria.
*/
-- ----------------------------------------------

SELECT
	AVG(price_sale) average_category_sale,
    category_sale
FROM Atividades.Table_Sale
GROUP BY category_sale;


-- ----------------------------------------------
/* 
9. Mostre o valor total vendido por categoria.
*/
-- ----------------------------------------------

SELECT
	SUM(price_sale) total_sale,
    category_sale
FROM Atividades.Table_Sale
GROUP BY category_sale;


-- ----------------------------------------------
/* 
10. Monte um relatório por categoria contendo:
• quantidade de vendas
• valor médio
• maior valor
• menor valor
• valor total vendido
*/
-- ----------------------------------------------

SELECT
	COUNT(*) amount_product_sale,
    AVG(price_sale) average_sale,
    MAX(price_sale) max_sale,
    MIN(price_sale) min_sale,
    SUM(price_sale) total_sale
FROM Atividades.Table_Sale;    
    
    
    
-- ----------------------------------------------
/* 
11. Mostre apenas categorias que possuem mais de 2 vendas.
*/
-- ----------------------------------------------

SELECT 
	category_sale,
    COUNT(*) amount_sale
FROM Atividades.Table_Sale
GROUP BY category_sale
HAVING amount_sale > 2;


-- ----------------------------------------------
/* 
12. Ordene as categorias pelo valor total vendido (maior → menor).
*/
-- ----------------------------------------------

SELECT
	category_sale,
    SUM(amount_sale) amount_sale
FROM Atividades.Table_Sale
GROUP BY category_sale
ORDER BY amount_sale DESC;



# *************
# *************
# *************
# *************
# *************
# ************* ATIVIDADE 03 *************
# *************

-- ----------------------------------------------
/* 
1. Atualize o salário do bruno para 4000.00
	* nome = Jordana 
*/
-- ----------------------------------------------

UPDATE Atividades.Table_Employee
SET salary_employee = 4000
WHERE id_employee = 3;


-- ----------------------------------------------
/* 
2. Exclua a funcionária Gabriela.
	* nome = Vanessa 
*/
-- ----------------------------------------------
DELETE FROM Atividades.Table_Employee
WHERE id_employee = 6;


-- ----------------------------------------------
/* 
3. Execute novamente o relatório da Atividade 1

9	40555.555556	70000.00	4000.00	365000.00

8	38125.000000	70000.00	4000.00	305000.00
*/
-- ----------------------------------------------

SELECT
	COUNT(*) amount_employee,
    AVG(salary_employee) avarage_salary_employee,
    MAX(salary_employee) max_salary_employee,
    MIN(salary_employee) min_salary_employee,
    SUM(salary_employee) total_salary_employee
FROM Atividades.Table_Employee;


/*

4. Responda:
• O que mudou nos resultados?
R.: Diminuiu a quantidade total de funcionários.
Média salarial diminiuiu.
Soma dos salários diminuiu.

• Qual operação teve maior impacto: UPDATE ou DELETE? Por quê?
R.: DELETE, por poder afetar mais de uma coluna no relatório.
O UPDATE não alteraria a quantidade total de funcionários.

*/



# *************
# *************
# *************
# *************
# *************
# ************* ATIVIDADE 04 *************
# *************

-- ----------------------------------------------
/* 
Atividade 4 – Conceitual: WHERE vs HAVING
Indique qual cláusula deve ser utilizada (WHERE ou HAVING) e justifique:
1. Mostrar apenas alunos com idade maior que 21
2. Mostrar apenas cursos com mais de 2 alunos
3. Mostrar apenas funcionários do departamento TI
4. Mostrar apenas departamentos com média salarial maior que 4000
*/
-- ----------------------------------------------

-- ----------------------------------------------
/* 
1. Mostrar apenas alunos com idade maior que 21
Indique qual cláusula deve ser utilizada (WHERE ou HAVING) e justifique:
R.: WHERE, para filtrar a consulta
*/
-- ----------------------------------------------
SELECT *
FROM University.Table_Student
WHERE age_student > 21;


-- ----------------------------------------------
/* 
2. Mostrar apenas cursos com mais de 2 alunos
Indique qual cláusula deve ser utilizada (WHERE ou HAVING) e justifique:
R.: HAVING, para filtrar o resultado da agregação
*/
-- ----------------------------------------------
SELECT 
    COUNT(*) amount_registered_student, 
    subject_student
FROM
    University.Table_Student
GROUP BY subject_student
HAVING amount_registered_student > 2;


-- ----------------------------------------------
/* 
3. Mostrar apenas funcionários do departamento TI
Indique qual cláusula deve ser utilizada (WHERE ou HAVING) e justifique:
R.: WHERE, para filtrar a consulta
*/
-- ----------------------------------------------

SELECT *
FROM Atividades.Table_Employee
WHERE department_employee = 'IT';


-- ----------------------------------------------
/* 
4. Mostrar apenas departamentos com média salarial maior que 4000
Indique qual cláusula deve ser utilizada (WHERE ou HAVING) e justifique:
R.: HAVING, para filtrar a agregação AVG
*/
-- ----------------------------------------------
SELECT 
    AVG(salary_employee) average_employee, 
    department_employee
FROM
    Atividades.Table_Employee
GROUP BY department_employee
HAVING average_employee > 4000;




/*



*/