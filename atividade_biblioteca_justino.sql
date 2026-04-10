############################################################
DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;
USE biblioteca;
############################################################


#----------------------------------------------
# Parte 1 — Criação das tabelas
# Crie as tabelas abaixo:
#----------------------------------------------

CREATE TABLE table_category (
	id_category 		INT PRIMARY KEY AUTO_INCREMENT,
    name_category		VARCHAR(100) UNIQUE
);

CREATE TABLE table_book (
	id_book			INT PRIMARY KEY AUTO_INCREMENT,
    name_book		VARCHAR(100),
    id_category		INT,
    FOREIGN KEY (id_category)  REFERENCES table_category (id_category)
);

CREATE TABLE table_reader (
	id_reader		INT PRIMARY KEY AUTO_INCREMENT,
    name_reader		VARCHAR(100)
);

CREATE TABLE table_loan (
	id_reader		INT,
    id_book			INT,
    FOREIGN KEY (id_reader) REFERENCES table_reader (id_reader),
    FOREIGN KEY (id_book) REFERENCES table_book (id_book)
);

#----------------------------------------------
# Parte 2 — Inserção dos dados
# 1. Insira as categorias:
#----------------------------------------------
INSERT INTO table_category
(id_category, name_category)
VALUES
(1, 'Romance'),
(2, 'IT'),
(3, 'History'),
(4, 'Science'),
(5, 'Philosophy'),
(6, 'Biology'),
(7, 'Arts'),
(8, 'Psychology');
#----------------------------------------------
# Parte 2 — Inserção dos dados
# 2. Insira os livros:
#----------------------------------------------
INSERT INTO table_book
(id_book, name_book, id_category)
VALUES
(1, 'Orgulho e Preconceito', 1),
(2, 'Dom Casmurro', 1),
(3, 'SQL para Iniciantes', 2),
(4, 'Python na Prática', 2),
(5, 'História do Brasil', 3),
(6, 'Física Básica', 4),
(7, 'O Pequeno Príncipe', NULL),
(8, 'Steve Jobs', 6),
(9, 'História da Arte', 7),
(10, 'Inteligência Emocional', NULL);

#----------------------------------------------
# Parte 2 — Inserção dos dados
# 3. Insira os leitores:
#----------------------------------------------
INSERT INTO table_reader (
	id_reader, name_reader
) VALUES
(1, 'Ana'),
(2, 'Brumm'),
(3, 'Carla'),
(4, 'Dany'),
(5, 'Elisa'),
(6, 'Felipa'),
(7, 'Gabriela'),
(8, 'Hello'),
(9, 'Isabela');
#----------------------------------------------
# Parte 2 — Inserção dos dados
# 4. Insira os empréstimos:
#----------------------------------------------
INSERT INTO table_loan
(id_reader, id_book)
VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 3),
(4, 5),
(5, 6),
(3, 8),
(4, 2),
(5, 3),
(7, 9);


#----------------------------------------------
#Parte 3 — Atividades:
#	1. Liste:
#	• nome do livro
#	• nome da categoria
#	Mostrar apenas livros que possuem categoria
#----------------------------------------------

SELECT
	book.id_book,
	book.name_book,
    category.name_category
FROM table_book book
INNER JOIN table_category category
	ON book.id_category = category.id_category;

#----------------------------------------------
#Parte 3 — Atividades:
#	2. Liste:
#	• todos os livros
#	• nome da categoria, se houver
#	Mesmo livros sem categoria devem aparecer.
#----------------------------------------------

SELECT
	book.id_book,
	book.name_book,
    category.name_category
FROM table_book book
LEFT JOIN table_category category
	ON book.id_category = category.id_category;

#----------------------------------------------
#Parte 3 — Atividades:
#	3. Liste:
#	• todas as categorias
#	• nome dos livros, se houver
#	Mesmo categorias sem livros devem aparecer
#----------------------------------------------

SELECT
	category.id_category,
    category.name_category,
    book.name_book
FROM table_book book
LEFT JOIN table_category category
	ON book.id_category = category.id_category;
    
#----------------------------------------------
#	4. Explique com suas palavras a diferença entre:
# 	• INNER JOIN
# 	• LEFT JOIN
#	Resposta:
#	INNER JOIN somente traz resultados correspondentes nas duas tabelas.
#	LEFT JOIN não traz os resultados ausentes na tabela direita
#----------------------------------------------

#----------------------------------------------
#	5. Liste:
#	• nome do leitor
#	• nome do livro
#	Mostrar quem pegou qual livro.
#----------------------------------------------

SELECT 
	reader.name_reader,
    book.name_book
FROM table_reader reader
LEFT JOIN table_loan loan
	ON reader.id_reader = loan.id_reader
LEFT JOIN table_book book
	ON loan.id_book = book.id_book
ORDER BY
	reader.name_reader;
    
    
#----------------------------------------------
#	6. Liste:
#	• nome do leitor
#	• nome do livro
#	• nome da categoria
#	Mostrar apenas leitores que possuem empréstimos.
#----------------------------------------------  

SELECT 
	reader.name_reader,
  book.name_book,
  category.name_category  
FROM table_reader reader
INNER JOIN table_loan loan
	ON reader.id_reader = loan.id_reader
INNER JOIN table_book book
	ON loan.id_book = book.id_book
INNER JOIN table_category category
	ON category.id_category = book.id_category;
	
    
#----------------------------------------------
# 7. Liste:
# • leitores que não pegaram nenhum livro.
#----------------------------------------------  

SELECT 
	reader.name_reader
FROM table_reader reader
LEFT JOIN table_loan loan
	ON reader.id_reader = loan.id_reader
WHERE loan.id_reader IS NULL;

#----------------------------------------------
# 8. Liste:
# • livros que não foram emprestados. 
#----------------------------------------------  

SELECT 
	book.name_book
FROM table_book book
LEFT JOIN table_loan loan
	ON book.id_book = loan.id_book
WHERE loan.id_book IS NULL;

#----------------------------------------------
# 9. Liste:
# • categorias que não possuem livros. 
#----------------------------------------------  

SELECT
  category.name_category
FROM table_category category
LEFT JOIN table_book book
  ON category.id_category = book.id_category
WHERE book.id_book IS NULL;


#----------------------------------------------
# 10. Monte uma consulta que mostre:
# • todos os leitores
# • nome do livro
# • categoria do livro
# Mesmo que o leitor não tenha feito empréstimo.
#----------------------------------------------  

SELECT
  reader.name_reader,
  book.name_book,
  category.name_category
FROM table_reader reader
LEFT JOIN table_loan loan
  ON loan.id_reader = reader.id_reader
LEFT JOIN table_book book
  ON book.id_book = loan.id_book
LEFT JOIN table_category category
  ON category.id_category = book.id_category
ORDER BY reader.name_reader;

#----------------------------------------------
# 11. Diagrama do banco de dados
# Usando o recurso Reverse Engineer no MySQL Workbench, gere o diagrama
# das tabelas do banco de dados e identifique:
# • as chaves primárias;
# • as chaves estrangeiras;
# • os relacionamentos entre as tabelas.

# Resposta: 
# Terminei a atividade em casa fazendo online no https://onecompiler.com/, então não consegui usar o Workbench para exportar o diagrama.
# Fiz uma versão de Diagrama no https://drawdb.app/, posso gerar uma do Workbench na próxima oportunidade no Senai
# imagem no email ou no endereço abaixo
# https://github.com/deveveryday/data_architecture_bethina/blob/main/diagrama.png
#----------------------------------------------  

#----------------------------------------------
# 12. Desafio extra
# Explique por que a tabela emprestimos representa um relacionamento muitos-para-muitos (N:N) entre leitores e livros.
# Resposta: Porque de forma geral ela pode ter muitos ids repetidos de leitores/id_reader e de livros/id_book. Em outro relacionamento 1-N poderia ter somente um id_book
#---------------------------------------------- 



      






    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	