-- Criando a tabela estoque_filmes
CREATE TABLE estoque_filmes (
    id INTEGER PRIMARY KEY,
    filme_id INTEGER,
    quantidade INTEGER,
    status TEXT
    );
-- inserindo dados na tabela estoque_filmes
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');
   
   SELECT * FROM estoque_filmes
   
-- criando a tabela com as informações dos filmes estoque_filmes
   
   CREATE TABLE filmes (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    genero TEXT,
    diretor TEXT,
    ano_lancamento INTEGER,
    preco REAL
);

-- Inserindo as informações na tabela
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);

SELECT * FROM filmes


--Obtendo a quantidade disponível em estoque do filme com ID 2
SELECT filmes.titulo AS filme, e.quantidade AS estoque
FROM filmes 
INNER JOIN estoque_filmes e ON filmes.id = e.filme_id
WHERE e.filme_id = 2;

--Verificando se um filme está disponível para aluguel: (Ex.: Para o filme com ID 3)

SELECT id, status
FROM estoque_filmes
WHERE id = 3;

--Atualizando o status de um filme para "Alugado":(Ex.: Para o filme com ID 1, diminuindo a quantidade em estoque)

SELECT * FROM estoque_filmes
UPDATE estoque_filmes
SET status = 'Alugado',
    quantidade = 9
WHERE id = 1;

--Atualizando o status de um filme para "Disponível": (Ex.: Para o filme com ID 1, aumentando a quantidade em estoque)

SELECT * FROM estoque_filmes
UPDATE estoque_filmes
SET status = 'Disponível',
    quantidade = 10
WHERE id = 1;

--Obtendo a lista de todos os filmes disponíveis para aluguel:

SELECT filmes.titulo AS filme, e.quantidade AS disponiveis
FROM filmes
INNER JOIN estoque_filmes e ON filmes.id = e.filme_id
WHERE e.status = 'Disponível';

-- alterarando o status dos filmes para Manutenção em estoque_filmes

SELECT* FROM estoque_filmes
UPDATE estoque_filmes
SET status = 'Manutenção'
WHERE status = 'Disponível';

--Obtendo a lista de filmes que estão em "Manutenção":

SELECT filmes.titulo AS filme, e.Status AS disponiveis
from filmes 
INNER JOIN estoque_filmes e ON filmes.id 
WHERE e.Status = 'Manutenção';