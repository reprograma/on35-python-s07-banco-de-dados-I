--SQLite
--Exercício 9: Sistema de Votação Online para Melhores Livros do Ano

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


CREATE TABLE votos (
    id INTEGER PRIMARY KEY,
  	id_usuario INTEGER,
  	id_livro INTEGER,
  	data_voto DATETIME,
    FOREIGN KEY(id_livro) REFERENCES livros(id)
)

INSERT INTO votos (id_usuario, id_livro, data_voto) VALUES (1, 1, '2024-05-10 08:30:00');  -- Voto do usuário 1 para o livro 1
INSERT INTO votos (id_usuario, id_livro, data_voto) VALUES (2, 2, '2024-05-10 09:45:00');  -- Voto do usuário 2 para o livro 2
INSERT INTO votos (id_usuario, id_livro, data_voto) VALUES (1, 3, '2024-05-10 10:15:00');  -- Voto do usuário 1 para o livro 3
INSERT INTO votos (id_usuario, id_livro, data_voto) VALUES (3, 1, '2024-05-10 10:15:00');  -- Voto do usuário 3 para o livro 1

--1 - Contar o número total de votos recebidos por cada livro.
SELECT L.titulo, L.autor, L.ano_publicacao, V.id_livro, COUNT(*) as 'votos'
FROM votos V
join livros L
on L.id = V.id_livro
GROUP by id_livro;

-- 2 - Identificar os livros mais votados.
SELECT l.id, l.titulo AS livro_mais_votado, l.autor, l.ano_publicacao, l.preco, COUNT(v.id) AS votos
FROM livros l
JOIN votos v ON l.id = v.id_livro
GROUP BY l.id
ORDER BY votos DESC
LIMIT 1;

-- 3 - Verificar se um determinado usuário já votou em um determinado livro
SELECT v.id_usuario,l.id AS 'id_livro', l.titulo, l.autor, l.ano_publicacao, l.preco,v.data_voto
FROM livros l
JOIN votos v ON l.id = v.id_livro
WHERE v.id_usuario = 1 AND l.id = 3;

--4 - Obter a lista de livros votados por um usuário específico.
SELECT v.id_usuario, l.titulo, l.autor, l.ano_publicacao, l.preco,v.data_voto
FROM livros l
JOIN votos v ON l.id = v.id_livro
WHERE v.id_usuario = 1;

-- Extra:
-- * Limitarlivros

SELECT id_livro, titulo
FROM votos
JOIN livros
on livros.id = votos.id_livro
LIMIT 2;

SELECT * FROM livros
ORDER BY ano_publicacao
ASC;

SELECT * FROM livros
ORDER BY ano_publicacao
DESC;