--SQLite
--Exercício 9: Sistema de Votação Online para Melhores Livros do Ano

CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
  	autor TEXT,
  	ano_publicacao INTEGER(4),
    preco REAL
)                                                                                                                                                                                                                 

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
SELECT id_livro,titulo,COUNT(id_livro) AS votos_livro_um
FROM votos
JOIN livros
on livros.id = votos.id_livro
WHERE id_livro = 1;

SELECT id_livro, titulo,COUNT(id_livro) AS votos_livro_dois
FROM votos
JOIN livros
on livros.id = votos.id_livro
WHERE id_livro = 2;

SELECT id_livro, titulo,COUNT(id_livro) AS votos_livro_tres
FROM votos
JOIN livros
on livros.id = votos.id_livro
WHERE id_livro = 3;

-- 2 - Identificar os livros mais votados.

SELECT id_livro, titulo,COUNT(id_livro) AS livro_mais_votado
FROM votos
JOIN livros
on livros.id = votos.id_livro
ORDER BY id_livro;

-- 3 - Verificar se um determinado usuário já votou em um determinado livro

SELECT * FROM votos
    WHERE id_livro = 1 and id_usuario = 1;

--4 - Obter a lista de livros votados por um usuário específico.
select L.id,L.titulo,L.autor, V.data_voto, V.id_usuario
from livros L
join votos V
on L.id = V.id_livro
WHERE id_usuario = 1;




