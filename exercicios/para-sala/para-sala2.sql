--SQLite
--Exercício 6: Problema da Loja de Livros

CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
  	autor TEXT,
  	ano_publicacao INTEGER(4),
    preco REAL
)

INSERT INTO livros (titulo,autor,ano_publicacao,preco) VALUES ('Dom Quixote','Miguel de Cervantes',1605,29.90);
INSERT INTO livros (titulo,autor,ano_publicacao,preco) VALUES ('Orgulho e Preconceito','Jane Austen',1813,25.50);
INSERT INTO livros (titulo,autor,ano_publicacao,preco) VALUES ('1984','George Orwell',1949,35.75);

SELECT * FROM livros;

SELECT titulo FROM livros;

SELECT titulo,autor FROM livros
	WHERE ano_publicacao > 2010;

SELECT titulo,autor FROM livros
	WHERE ano_publicacao > 1900;
    
SELECT titulo,autor,preco FROM livros
	WHERE preco > 30;