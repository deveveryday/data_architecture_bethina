/*DROP DB


-- DROP DATABASE IF EXISTS university;
-- CREATE DATABASE university;

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

select * from university.Table_Teacher;
delete from university.Table_Teacher where id_teacher  = 8;

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


insert into university.Table_Teacher (Name_Teacher, Subject_Teacher, Age_Teacher) values ('Lilly', 'Julia', 15);


select * 
from university.Table_Teacher;

select COUNT(*) 
from university.Table_Teacher where Age_Teacher > 35;

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


