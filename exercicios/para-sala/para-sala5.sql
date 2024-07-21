--SQLite
--Este exercício e uma previa do exercício de casa:

CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
  	autor TEXT,
  	ano_publicacao INTEGER(4),
    preco REAL
);

INSERT INTO livros (titulo,autor,ano_publicacao,preco) VALUES ('Dom Quixote','Miguel de Cervantes',1605,29.90);
INSERT INTO livros (titulo,autor,ano_publicacao,preco) VALUES ('Orgulho e Preconceito','Jane Austen',1813,25.50);
INSERT INTO livros (titulo,autor,ano_publicacao,preco) VALUES ('1984','George Orwell',1949,35.75);


CREATE TABLE votos (
    id INTEGER PRIMARY KEY,
  	id_usuario INTEGER,
    id_livro INTEGER,
    estoque INTEGER,
 	FOREIGN KEY(id_livro) REFERENCES livros(id)
);

INSERT INTO votos (id_usuario, id_livro, estoque) VALUES (1, 1, 40);
INSERT INTO votos (id_usuario, id_livro, estoque) VALUES (2, 2, 20);  
INSERT INTO votos (id_usuario, id_livro, estoque) VALUES (1, 3, 1);

-- Consulta por ordem
SELECT l.id AS 'id livro',l.titulo,l.autor,l.ano_publicacao,l.preco,v.estoque AS 'qtd estoque'
FROM votos v
JOIN livros l
ON l.id = v.id_livro
ORDER BY estoque;

-- Incremento usando SET na coluna estoque
UPDATE votos
SET estoque = estoque + 1
WHERE id = 1; -- Supondo que você deseja incrementar o estoque do voto com ID 1

-- Consulta após o incremento
SELECT *
FROM votos;