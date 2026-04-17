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



INSERT INTO table_student
(name_student)
VALUES (
'Gabe'
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

SELECT
	student.id_student,
    student.name_student student,
    course.name_course course
FROM table_student student
INNER JOIN table_course course
	ON student.id_course = course.id_course;
    
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
RIGHT JOIN table_course course
	ON student.id_course = course.id_course;

SELECT
	course.name_course,
    student.id_student,
    student.name_student
FROM table_course course
LEFT JOIN table_student student
	ON course.id_course = student.id_course;
    
    
	
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

SELECT 
	student.name_student,
    course_subject.name_course_subject
FROM table_student student
INNER JOIN table_student_course_subject student_course_subject
	ON student.id_student = student_course_subject.id_student
INNER JOIN table_course_subject course_subject
	ON course_subject.id_course_subject = student_course_subject.id_course_subject;


SELECT 
	student.id_student AS id_student,
    course_subject.name_course_subject AS name_course_subject
FROM table_student student
INNER JOIN table_student_course_subject student_course_subject
	ON student.id_student = student_course_subject.id_student
INNER JOIN table_course_subject course_subject
	ON course_subject.id_course_subject = student_course_subject.id_course_subject
INNER JOIN table_course course
	ON course.id_course = course_subject.id_course_subject;
    
    

SELECT 
	student.id_student AS id_student,
    student.name_student AS name_student,
    course_subject.name_course_subject AS name_course_subject,
    course.name_course
FROM table_student student
LEFT JOIN table_student_course_subject student_course_subject
	ON student.id_student = student_course_subject.id_student
LEFT JOIN table_course_subject course_subject
	ON course_subject.id_course_subject = student_course_subject.id_course_subject
LEFT JOIN table_course course
	ON course.id_course = course_subject.id_course_subject;
    
    
SELECT *
FROM table_course course
LEFT JOIN table_student_course_subject student_course_subject
	ON course.id_course = student_course_subject.id_course
LEFT JOIN table_student student
	ON student.id_student = student_course_subject.id_student
LEFT JOIN table_course_subject course_subject	
	ON course_subject.id_course_subject = course_subject.id_course_subject;
######################################################################	
select * from table_student_course_subject;
######################################################################
select * from table_course_subject;
INSERT INTO table_course (name_course)
VALUES ('Archtecture');
######################################################################
SELECT * FROM table_course;
######################################################################
SELECT * FROM TABLE_COURSE_SUBJECT;
######################################################################

###################
# 1. DISTNCT
###################

SELECT DISTINCT id_course
FROM table_student
WHERE id_course IS NOT NULL;
######################################################################

###################
# 2. DISTNCT AND JOIN
###################

SELECT DISTINCT name_course
FROM table_student student
INNER JOIN table_course course
	ON student.id_course = course.id_course;
    
######################################################################

###################
# 3. DISTNCT AND COLUMNS
###################

SELECT DISTINCT
	id_course,
    name_student
FROM table_student student
WHERE id_course IS NOT NULL;

######################################################################

###################
# 4. LIMIT
###################

SELECT *
FROM table_student
LIMIT 3;

######################################################################

###################
# 5. ORDER BY + LIMIT
###################

SELECT name_student
FROM table_student
ORDER BY name_student
LIMIT 3;


######################################################################

###################
# 6. MANY FILTERS
###################

SELECT
	name_student
FROM table_student student
JOIN table_course course
	ON student.id_course = course.id_course
WHERE 
	student.id_student > 1 AND 
    course.id_course = 1;

######################################################################

###################
# 7. MANY FILTERS OR
###################

SELECT
	student.name_student,
    student.id_course
FROM
	table_student student
WHERE student.id_course IN (1, 2);

######################################################################

###################
# 8. AND + IS NOT NULL
###################

SELECT *
FROM table_student student
WHERE 
	id_course IS NOT NULL AND
    id_course = 2;


######################################################################

###################
# 9. AND OR
###################

SELECT *
FROM table_student student
WHERE 
	id_course = 1 OR
    id_course = 2 AND
    id_student > 2;
    
    

######################################################################

###################
# 10.  AND OR ()
###################    

SELECT *
FROM table_student student
WHERE 
	(id_course = 1 OR id_course = 2) AND
    id_student > 2;



######################################################################

###################
# 11.  JOIN COMPLETE
################### 

SELECT 
	student.name_student,
    course.name_course
FROM
	table_student student
LEFT JOIN
	table_course course
ON student.id_course = course.id_course
WHERE student.id_course IS NOT NULL
ORDER BY 
	course.name_course ASC,
    student.name_student;
   
######################################################################

###################
# 12.  GROUP BY
################### 

SELECT 
	student.name_student,
    COUNT(student.id_course)
FROM
	table_student student
LEFT JOIN
	table_course course
	ON course.id_course = student.id_course
GROUP BY name_student;
   
   
######################################################################

###################
# 13. HAVING  GROUP BY
################### 

SELECT 
	student.name_student,
    COUNT(student.id_course) c
FROM
	table_student student
LEFT JOIN
	table_course course
	ON course.id_course = student.id_course
GROUP BY name_student
HAVING COUNT(student.id_course) > 0;
   

   
######################################################################

###################
# 14. CASE WHEN
################### 


SELECT 
	student.name_student,
    CASE WHEN student.id_course IS NULL THEN 'None'
    ELSE 'With Course' 
    END AS 'student_situation',
    student.id_course
FROM
	table_student student;
   
   
######################################################################

###################
# 15. CASE WHEN
################### 


SELECT 
	student.name_student,
    CASE 
		WHEN student.id_course = 1 THEN 'Curso 1'
        WHEN student.id_course = 2 THEN 'Curso 2'
        WHEN student.id_course = 3 THEN 'Curso 3'
        WHEN student.id_course = 4 THEN 'Curso 4'
        WHEN student.id_course = 5 THEN 'Curso 5'
        WHEN student.id_course = 6 THEN 'Curso 6'
		ELSE 'None' 
    END AS 'student_super_course'
FROM
	table_student student;


   
######################################################################

###################
# 16. CASE WHEN + Report
################### 

SELECT
	course.name_course,
    COUNT(student.id_student) AS total_students,
    CASE 
		WHEN COUNT(student.id_student) = 0 THEN 'no class'
		WHEN COUNT(student.id_student) = 1 THEN 'small class'
        WHEN COUNT(student.id_student) = 2 THEN 'Bigger class'
        ELSE 'No students'
	END AS situation_class
FROM table_course course
LEFT JOIN table_student student
	ON course.id_course = student.id_course
GROUP BY course.name_course;

   
######################################################################

###################
# 17. CTE
################### 

WITH student AS (
	SELECT 
		id_student,
		name_student,
        id_course
    FROM table_student
    WHERE id_course IS NOT NULL
)
SELECT *
FROM student;
   
######################################################################

###################
# 18. CTE JOIN
################### 

WITH students AS (
	SELECT *
    FROM table_student student
	WHERE student.id_course IS NOT NULL
)
SELECT 
	students.id_student,
	students.name_student,
	course.name_course
FROM students
LEFT JOIN table_course course
	ON students.id_course = course.id_course;



######################################################################

###################
# 19. CTE + AGGREGATION
################### 
WITH total_per_course AS (
	SELECT
		id_course,
        COUNT(*) AS total
	FROM table_student student
    WHERE id_course IS NOT NULL
    GROUP BY id_course
)
SELECT 
	*
FROM
	total_per_course;


        

######################################################################

###################
# 20. WINDOW FUNCTION - ROW_NUMBER
###################

SELECT
	name_student,
    ROW_NUMBER() OVER(ORDER BY name_student ASC) as alphabetic_rank
FROM table_student;



######################################################################

###################
# 21. WINDOW FUNCTION PARTITION BY
###################

SELECT
	name_student,
    id_course,
    ROW_NUMBER() OVER (
		PARTITION BY id_course
        ORDER BY name_student ASC
    ) AS ordem_student
FROM table_student
WHERE id_course IS NOT NULL;

######################################################################

###################
# 22. WINDOW FUNCTION RANK
###################

SELECT
	name_student,
    id_course,
    RANK() OVER (
		PARTITION BY id_course
        ORDER BY name_student ASC
    ) AS ordem_student
FROM table_student
WHERE id_course IS NOT NULL;


######################################################################

###################
# 23. Complete query JOIN CASE ORDER
###################

SELECT
	student.name_student,
    course.name_course,
    CASE
		WHEN student.id_course IS NULL THEN 'No class'
        ELSE 'With class'
	END AS situation_student
FROM table_student student
LEFT JOIN table_course course
	ON student.id_course = course.id_course
ORDER BY student.name_student ASC;

###################

SELECT *
FROM table_student student
WHERE 
	id_course = 1 AND
	name_student LIKE '%a%';
        
        
        

