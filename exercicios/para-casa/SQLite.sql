CREATE TABLE filmes (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    genero TEXT,
    diretor TEXT,
    ano_lancamento INTEGER,
    preco REAL
);

INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);

SELECT * FROM filmes;

CREATE TABLE estoque_filmes (
  id integer PRIMARY KEY,
  filme_id integer,
  quantidade integer,
  status text,
  FOREIGN KEY (filme_id) REFERENCES filmes(id)
 );
 
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');

SELECT * FROM estoque_filmes;

--Obter a quantidade disponível em estoque para um determinado filme: (Ex.: Para o filme com ID 2)
SELECT * from estoque_filmes WHERE id = 2;

--Verificar se um filme está disponível para aluguel: (Ex.: Para o filme com ID 3)
SELECT
f.titulo,
e.quantidade,
e.status
from filmes f
INNER JOIN estoque_filmes e on f.id = e.filme_id
WHERE f.id = 3;

--Atualizar o status de um filme para "Alugado": (Ex.: Para o filme com ID 1, diminuindo a quantidade em estoque)

SELECT * from estoque_filmes;
UPDATE estoque_filmes
SET status = 'Alugado', quantidade = quantidade - 1
WHERE id = 1;

--Atualizar o status de um filme para "Disponível": (Ex.: Para o filme com ID 2, aumentando a quantidade em estoque)

SELECT * from estoque_filmes;
UPDATE estoque_filmes
SET status = 'Disponivel', quantidade = quantidade + 1
WHERE id = 2;

--Obter a lista de todos os filmes disponíveis para aluguel:

SELECT 	f.titulo as 'Filmes',
		e.status as 'Disponivel'
FROM filmes f INNER JOIN estoque_filmes e 
on f.id = e.filme_id
WHERE e.status = 'Disponivel';

--Obter a lista de filmes que estão em "Manutenção":

SELECT	f.titulo as 'Filmes',
		e.status as 'Status'
FROM filmes f INNER JOIN estoque_filmes e
on f.id = e.filme_id
WHERE e.status = 'Manutenção';


--Atualizar o status de um filme para "Em Manutenção": (Ex.: Para o filme com ID 3)

UPDATE estoque_filmes
SET status = 'Manutenção'
WHERE id = 3;
SELECT * from estoque_filmes;
