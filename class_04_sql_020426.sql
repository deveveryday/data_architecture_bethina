############################################################
WITH cte (col1, col2) AS
(
  SELECT 1, 2
  UNION ALL
  SELECT 3, 4
)
SELECT col1, col2 FROM cte;
############################################################
DROP DATABASE IF EXISTS escola;
CREATE DATABASE escola;
USE escola;
############################################################

CREATE TABLE table_course (
	id_course 		INT PRIMARY KEY AUTO_INCREMENT,
    name_course		VARCHAR(100) UNIQUE
);
############################################################
CREATE TABLE table_student (
	id_student		INT PRIMARY KEY AUTO_INCREMENT,
    name_student	VARCHAR(100) UNIQUE,
    id_course		INT,
    FOREIGN KEY (id_course) REFERENCES table_course(id_course)
);
############################################################
CREATE TABLE table_course_subject (
	id_course_subject		INT PRIMARY KEY AUTO_INCREMENT,
    name_course_subject		VARCHAR(100) UNIQUE
);
############################################################
CREATE TABLE table_student_course_subject (
	id_student			INT,
	id_course_subject	INT,
    PRIMARY KEY (id_student, id_course_subject),
    FOREIGN KEY (id_student) REFERENCES table_student(id_student),
    FOREIGN KEY (id_course_subject) REFERENCES table_course_subject(id_course_subject)
);

############################################################

INSERT INTO table_course 
(name_course)
VALUES (
'ADS'
),(
'Engineer'
),(
'Law'
),(
'Medicine'
);
############################################################
INSERT INTO table_student
(name_student, id_course)
VALUES (
'Jane', 1
),(
'Carmela', 2
),(
'Tara', 1
),(
'Ima', 3
),(
'Jemma', 3
),(
'Layla', 3
),(
'Luann', 3
),(
'Barb', 2
);
############################################################
INSERT INTO table_course_subject
(name_course_subject)
VALUES (
'Python'
), (
'Extension'
), (
'Logic Programming'
), (
'C#'
), (
'Super Laws'
), (
'Data Structures'
);

############################################################

INSERT INTO table_course_subject
(name_course_subject)
VALUES (
'Medical Law'
), (
'Apply Math'
), (
'Super Laws'
);
############################################################
INSERT INTO table_course_subject
(name_course_subject)
VALUES (
'Citizen Law'
), (
'Education Law'
), (
'Phisics'
);
############################################################
INSERT INTO table_student_course_subject (
	id_student, id_course_subject
) VALUES (
	1, 1
),(
	1, 2
),(
	2, 1
),(
	3, 1
),(
	3, 2
),(
	3, 4
),(
	4, 1
),(
	5, 3
),(
	6, 4
);
############################################################



############################################################
SELECT
	student.id_student,
    student.name_student,
    course.name_course
FROM table_student student
LEFT JOIN table_course course
	ON student.id_course = course.id_course;
############################################################
SELECT
	student.id_student,
    student.name_student,
    course.name_course
FROM table_student student
JOIN table_course course
	ON student.id_course = course.id_course; 
############################################################
SELECT
	student.id_student,
    student.name_student,
    course.name_course
FROM table_student student
CROSS JOIN table_course course;

############################################################
SELECT * from table_student;
SELECT * FROM table_course;
SELECT * FROM table_course_subject;
SELECT * FROM table_student_course_subject;



1	Jane	1
2	Carmela	2
3	Tara	1
4	Ima	3
5	Jemma	3
6	Layla	3
7	Luann	3
8	Barb	2
10	Louis	
		
	
1	ADS
2	Engineer
3	Law
4	Medicine
	
17	Apply Math
4	C#
19	Citizen Law
5	Data Archtecture
6	Data Structures
20	Education Law
2	Extension
3	Logic Programming
16	Medical Law
21	Physics Calculation
1	Python
18	Super Laws
	


