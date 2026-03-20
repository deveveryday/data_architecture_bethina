/*DROP DB
u: root
p: senai115


DROP DATABASE IF EXISTS university;
CREATE DATABASE university;

-- USE university
*/



/*
12/03/2026
Exercício 1 - Professores 
Uma escola deseja armazenar informações sobre professores. Crie uma tabela chamada
professores com os seguintes campos:

Tabela Teacher
*/

CREATE TABLE university.Table_Teacher (
  ID_Teacher INT NOT NULL AUTO_INCREMENT,
  Name_Teacher VARCHAR(100) NOT NULL,
  Subject_Teacher VARCHAR(100) NOT NULL,
  Age_Teacher INT CHECK (Age_Teacher > 18),
  PRIMARY KEY(ID_Teacher)
);

CREATE TABLE university.Table_Teacher_Two (
  ID_Teacher INT NOT NULL AUTO_INCREMENT,
  Name_Teacher VARCHAR(100),
  Subject_Teacher varchar(100),
  Age_Teacher INT,
  PRIMARY KEY(ID_Teacher)
);

ALTER TABLE university.Table_Teacher
ADD CHECK (Age_Teacher > 18);


CREATE TABLE university.Table_Student (
  ID_Student INT NOT NULL AUTO_INCREMENT,
  Name_Student VARCHAR(100),
  Subject_Student varchar(100),
  Age_Student INT,
  PRIMARY KEY(ID_Student)
);

insert into university.Table_Student (Name_Student, Subject_Student, Age_Student) values ('Bru', 'Python', 19);
insert into university.Table_Student (Name_Student, Subject_Student, Age_Student) values ('Lane', 'Database', 18);
insert into university.Table_Student (Name_Student, Subject_Student, Age_Student) values ('Jane', 'R', 19);
insert into university.Table_Student (Name_Student, Subject_Student, Age_Student) values ('Louis', 'F#', 21);
insert into university.Table_Student (Name_Student, Subject_Student, Age_Student) values ('Tara', 'C', 33);
insert into university.Table_Student (Name_Student, Subject_Student, Age_Student) values ('Lilly', 'Julia', 20);


insert into university.Table_Teacher (Name_Teacher, Subject_Teacher, Age_Teacher) values ('Lilly', 'Julia', 55);
insert into university.Table_Teacher (Name_Teacher, Subject_Teacher, Age_Teacher) values ('Jann', 'SQL', 55);
insert into university.Table_Teacher (Name_Teacher, Subject_Teacher, Age_Teacher) values ('Luann', 'C++', 95);
insert into university.Table_Teacher (Name_Teacher, Subject_Teacher, Age_Teacher) values ('Lilly', 'Julia', 55);



select * 
from university.Table_Teacher;

select COUNT(*), name_teacher
from university.Table_Teacher where Age_Teacher > 35
group by name_teacher;

select * 
from university.Table_Teacher where Age_Teacher between 30 and 40;

select * 
from university.Table_Teacher 
where name_teacher ='MARY'
order by Age_Teacher;






/*
WITH
  cte1 AS (SELECT a, b FROM table1),
  cte2 AS (SELECT c, d FROM table2)
SELECT b, d FROM cte1 JOIN cte2
WHERE cte1.a = cte2.c;
*/

WITH
	cte1 AS (SELECT id_teacher, name_teacher FROM university.Table_Teacher),
    cte2 AS (SELECT id_teacher, name_teacher FROM university.Table_Teacher)
SELECT name_teacher FROM cte1 JOIN cte2
WHERE cte1.id_teacher = cte2.id_teacher;


SELECT
	Name_Teacher,
    RANK() OVER (ORDER BY Age_Teacher)
FROM university.Table_Teacher;


SELECT
	Name_Teacher,
    Age_Teacher,
    Age_Teacher - LAG(Age_Teacher) OVER (ORDER BY Age_Teacher) AS minha_coluna

FROM university.Table_Teacher;

select * from university.table_teacher;



SELECT
	Name_Teacher,
    MAX(Age_Teacher)
FROM university.table_teacher

GROUP BY Name_Teacher
HAVING (SELECT
    MAX(Age_Teacher)
FROM university.table_teacher);

/*
Exercício 2 - Produtos
Uma loja deseja cadastrar produtos. Crie uma tabela chamada produtos com os seguintes
campos:
• id → inteiro, auto incremento, chave primária
• nome → texto com até 100 caracteres
• categoria → texto com até 50 caracteres
• preco → número decimal
*/
CREATE TABLE university.Table_Product (
    ID_Product INT NOT NULL AUTO_INCREMENT,
    Name_Product VARCHAR(100),
    Category_Product VARCHAR(50),
    Price_Product decimal,
    PRIMARY KEY(ID_Product)
);

insert into university.Products (name, category, price) values ('', '', 1000);
insert into university.Products (name, category, price) values ('', '', 2039);
insert into university.Products (name, category, price) values ('', '', 5000);

CREATE TABLE university.Table_Product (
    ID_Product INT NOT NULL AUTO_INCREMENT,
    Name_Product VARCHAR(100),
    Category_Product VARCHAR(50),
    Price_Product decimal,
    PRIMARY KEY(ID_Product)
);



CREATE TABLE university.Table_Movie (
	Id_Movie INT NOT NULL AUTO_INCREMENT,
    Title_Movie VARCHAR(100),
    Genre_Movie VARCHAR(50),
    Duration_Movie INT,
    Nationality_Movie VARCHAR(50),
    Star_Character VARCHAR(50),
    PRIMARY KEY (Id_Movie)
);

INSERT INTO university.Table_Movie (
	Title_Movie, 
    Genre_Movie, 
    Duration_Movie, 
    Nationality_Movie, 
    Star_Character
)
VALUES(
	'Fast And Furious',
    'Action',
    90,
    'USA',
    'Jordana Brewster'
);

INSERT INTO university.Table_Movie (
	Title_Movie, 
    Genre_Movie, 
    Duration_Movie, 
    Nationality_Movie, 
    Star_Character
)
VALUES(
	'Heat',
    'Police',
    120,
    'USA',
    'Ashley Judd'
);

INSERT INTO university.Table_Movie (
	Title_Movie, 
    Genre_Movie, 
    Duration_Movie, 
    Nationality_Movie, 
    Star_Character
)
VALUES(
	'Waist Deep',
    'Action',
    110,
    'USA',
    'Megan Good'
);

INSERT INTO university.Table_Movie (
	Title_Movie, 
    Genre_Movie, 
    Duration_Movie, 
    Nationality_Movie, 
    Star_Character
)
VALUES(
	'CREED',
    'Action',
    '95',
    'USA',
    'Tessa Thompson'
);

INSERT INTO university.Table_Movie (
	Title_Movie, 
    Genre_Movie, 
    Duration_Movie, 
    Nationality_Movie, 
    Star_Character
)
VALUES(
	'The Equalizer',
    'Police',
    '114',
    'USA',
    'Chloe Grace Moretz'
);
INSERT INTO university.Table_Movie (
	Title_Movie, 
    Genre_Movie, 
    Duration_Movie, 
    Nationality_Movie, 
    Star_Character
)
VALUES(
	'Takers',
    'Police',
    '80',
    'USA',
    'Zoe Saldanha'
);



select * from university.Table_Movie;
SELECT Title_Movie FROM university.Table_Movie;


/*
Aula 02 - SQL
19/03/26
UPDATE
DELETE
COUNT
AVG
MIN
MAX
SUM
GROUP BY
HAVING
ORDER BY

Using a Database
	USE _____;
    USE university;
    
    
SELECT, WHERE ORDER BY


SET SQL_SAFE_UPDATES = 0;
*/

SELECT *
FROM table_student;

SELECT 
	name_student,
    subject_student
FROM 
	table_student;
    
SELECT
	name_student,
    subject_student,
    age_student
FROM
	table_student
WHERE
	age_student BETWEEN  21 AND 33;

SELECT
	name_student,
    age_student
FROM
	table_student
ORDER BY 
	age_student ASC;
    
    
SELECT
	*
FROM 
	table_student
ORDER BY
	subject_student;
    
    
INSERT INTO table_student
(name_student, subject_student, age_student)
VALUES 
('Sabrina', 'Ruby', 22),
('Meghan', 'Ruby', 36),
('Chalize', 'db4o', 42),
('Demmy', 'NodeJS', 18),
('Sammy', 'C#', 27),
('Jennifer', 'SQL', 34),
('Cammy', 'Java', 40);

INSERT INTO table_student
(name_student, subject_student, age_student)
VALUES 
('Kemmy', 'Javascript', 95);

#---------------------------------------------------

SELECT *
FROM table_student
ORDER BY ID_Student;

UPDATE table_student
SET ID_student = 20
WHERE ID_student = 200;

UPDATE table_student
SET subject_student = 'C++'
WHERE ID_Student = 11;

UPDATE table_student
SET age_student = age_student + 1;

/*
ATENÇÃO --- UPDATE SEM WHERE
*/

DELETE FROM table_student
WHERE ID_Student = 11;

SELECT *
FROM table_student;

-- DELETE students with age less than 21
START TRANSACTION;
DELETE FROM table_student
WHERE age_student < 21;

ROLLBACK;

/*
ATTENTION DELETE SEM WHERE
*/
-- Funções de agregação
-- RESUMIR DADOS AVG COUNT 

SELECT
	COUNT(*) AS total_students
FROM
	table_student;
    
    
SELECT COUNT(*) AS total_shit
FROM table_student
WHERE subject_student = 'C';


SELECT 
	ROUND(AVG(age_student)) AS mean_age_student, 
	subject_student
FROM table_student
GROUP BY subject_student;


SELECT MIN(age_student) AS minor_age
FROM table_student;


SELECT MAX(age_student) AS max_age
FROM table_student;

SELECT SUM(age_student) AS SUMM
FROM table_student;


SELECT
	COUNT(*) amount,
    AVG(age_student) AS mean_age,
    MIN(age_student) AS minor_age,
    MAX(age_student) AS max_age,
    SUM(age_student) sum_age
FROM
	table_student
WHERE 
	subject_student = 'RUBY';
    
    
SELECT 
	COUNT(*) total,
    subject_student
FROM table_student
GROUP BY subject_student
HAVING total > 1;
    
    
SELECT 
	COUNT(*),
    age_student
FROM table_student
GROUP BY age_student;


SELECT
	AVG(age_student),
    subject_student
FROM table_student
GROUP BY subject_student;

SELECT 
	MIN(age_student),
    subject_student
FROM table_student
GROUP BY subject_student;

SELECT
	MAX(age_student),
    subject_student
FROM table_student
GROUP BY subject_student;

SELECT 
	SUM(age_student),
    subject_student
FROM table_student
GROUP BY subject_student;



SELECT 
	subject_student,
    COUNT(*) summ
FROM table_student
GROUP BY subject_student
ORDER BY summ DESC;

SELECT
	AVG(age_student),
    subject_student
FROM table_student
GROUP BY subject_student 
ORDER BY avg(age_student) DESC;

SELECT 
	subject_student,
	COUNT(*) amount
FROM table_student
GROUP BY subject_student
ORDER BY subject_student;


SELECT
	subject_student,
    COUNT(*) amount
FROM table_student
GROUP BY subject_student
HAVING amount < 2;


SELECT
	age_student,
    COUNT(age_student) amount_student
FROM table_student
GROUP BY age_student
HAVING amount_student > 1;

SELECT
	subject_student,
    AVG(age_student) mean_age_student
FROM table_student
GROUP BY subject_student
HAVING mean_age_student > 22;


SELECT
	subject_student,
    SUM(age_student) sum_student
FROM table_student
GROUP BY subject_student
HAVING SUM(age_student) > 40;

SELECT 
	subject_student,
	COUNT(*) amount_student
FROM table_student
WHERE age_student > 22
GROUP BY subject_student;





SELECT 
	subject_student,
    COUNT(*) amount_student
FROM table_student
GROUP BY subject_student
HAVING amount_student > 1;



SELECT	
	subject_student,
    COUNT(*) amount_student
FROM table_student
WHERE age_student > 22
GROUP BY subject_student
HAVING amount_student > 1;


SELECT
	subject_student,
	AVG(age_student) mean_age_student
FROM table_student
GROUP BY subject_student
HAVING mean_age_student > 20;


SELECT
	subject_student,
    COUNT(*) amount_student
FROM table_student
GROUP BY subject_student
ORDER BY amount_student DESC;

SELECT
	subject_student,
    COUNT(*) amount_student
FROM table_student
WHERE age_student > 21
GROUP BY subject_student;


SELECT
	subject_student,
    COUNT(*) amount
FROM table_student
GROUP BY subject_student
HAVING amount > 1;



SELECT
	age_student,
    COUNT(age_student)
FROM table_student
GROUP BY age_student;



SELECT
	subject_student,
    AVG(age_student) AS mean_age_student
FROM table_student
GROUP BY subject_student
ORDER BY mean_age_student;


SELECT
	subject_student,
	MAX(age_student) bigger_age_student,
    MIN(age_student) min_age_student
FROM
	table_student
GROUP BY subject_student;


SELECT
	subject_student,
	AVG(age_student),
    MAX(age_student),
    MIN(age_student),
    SUM(age_student),
    COUNT(*)
FROM table_student
GROUP BY subject_student;


