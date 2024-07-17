 -- cria a tabela com as informações dos filmes
 
   CREATE TABLE filmes (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    genero TEXT,
    diretor TEXT,
    ano_lancamento INTEGER,
    preco REAL
);

-- Insira as informações na tabela
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);

SELECT * FROM filmes

-- Criando a tabela estoque_filmes
CREATE TABLE estoque_filmes (
    id INTEGER PRIMARY KEY,
    filme_id INTEGER,
    quantidade INTEGER,
    status TEXT,
  FOREIGN KEY(filme_id) REFERENCES filmes(id)
  );
-- inserindo dados na tabela estoque_filmes
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');
   
SELECT * FROM estoque_filmes
   
 
--Obtendo a quantidade disponível em estoque do filme com ID 2
SELECT filmes.titulo AS filme, e.quantidade AS estoque
FROM filmes 
INNER JOIN estoque_filmes e ON filmes.id = e.filme_id
WHERE e.filme_id = 2 AND status = 'Disponível'

--Verificar se um filme está disponível para aluguel: (Ex.: Para o filme com ID 3)

SELECT 
f.titulo,
e.status,
e.quantidade
from filmes f
INNER join estoque_filmes e On f.id = e.filme_id
WHERE f.id = 3;

--Atualizar o status de um filme para "Alugado":(Ex.: Para o filme com ID 1, diminuindo a quantidade em estoque)

SELECT * FROM estoque_filmes
UPDATE estoque_filmes
SET status = 'Alugado',
    quantidade = quantidade -1
WHERE id = 1;

--Atualizar o status de um filme para "Disponível": (Ex.: Para o filme com ID 1, aumentando a quantidade em estoque)

SELECT* FROM estoque_filmes
UPDATE estoque_filmes
SET status = 'Disponível',
    quantidade = quantidade + 1
WHERE id = 1;

--Obter a lista de todos os filmes disponíveis para aluguel:

SELECT filmes.titulo AS filme, e.quantidade AS disponiveis
FROM filmes
INNER JOIN estoque_filmes e ON filmes.id = e.filme_id
WHERE e.status = 'Disponível';

-- alterar o status dos filmes para Manutenção em estoque_filmes

SELECT* FROM estoque_filmes
UPDATE estoque_filmes
SET status = 'Manutenção'
WHERE status = 'Disponível';

--Obter a lista de filmes que estão em "Manutenção":

SELECT filmes.titulo AS filme, e.Status AS disponiveis
from filmes 
INNER JOIN estoque_filmes e ON filmes.id 
WHERE e.Status = 'Manutenção';