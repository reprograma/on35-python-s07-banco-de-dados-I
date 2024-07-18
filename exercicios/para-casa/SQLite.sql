CREATE TABLE filmes (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    genero TEXT,
    diretor TEXT,
    ano_lancamento INTEGER,
    preco REAL
);

-- Insira alguns filmes para teste
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);

SELECT * FROM filmes;

CREATE TABLE estoque_filmes (
  id INTEGER PRIMARY KEY,
  filme_id INTEGER,
  quantidade INTEGER,
  status CHECK (status in ('Disponível','Alugado','Em Manutenção')) DEFAULT 'Disponível',
  FOREIGN KEY (filme_id) REFERENCES filmes(id)
  );
  
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');

SELECT * FROM estoque_filmes;

-- 1. Obter a quantidade disponível em estoque para um determinado filme: (Ex.: Para o filme com ID 2)

SELECT quantidade FROM estoque_filmes WHERE filme_id = 2 AND status = 'Disponível';

-- 2. Verificar se um filme está disponível para aluguel: (Ex.: Para o filme com ID 3)

SELECT 
	f.titulo, 
    e.status,
    e.quantidade
FROM filmes f 
JOIN estoque_filmes e ON f.id = e.filme_id 
WHERE f.id = 3; 

-- 3. Atualizar o status de um filme para "Alugado": (Ex.: Para o filme com ID 1, diminuindo a quantidade em estoque)

UPDATE estoque_filmes
SET status = 'Alugado', quantidade = quantidade - 1
WHERE filme_id = 1 AND quantidade > 0;

-- 4. Atualizar o status de um filme para "Disponível": (Ex.: Para o filme com ID 2, aumentando a quantidade em estoque)

UPDATE estoque_filmes
SET status = 'Disponível', quantidade = quantidade + 1
WHERE filme_id = 2 AND quantidade > 0;

-- 5. Obter a lista de todos os filmes disponíveis para aluguel:

SELECT f.titulo, e.status
FROM filmes f
JOIN estoque_filmes e on e.filme_id = f.id
WHERE status = 'Disponível'

-- 6. Obter a lista de filmes que estão em "Manutenção":

SELECT f.titulo, e.status
FROM filmes f
JOIN estoque_filmes e on e.filme_id = f.id
WHERE status = 'Em Manutenção'

-- 7. Atualizar o status de um filme para "Em Manutenção": (Ex.: Para o filme com ID 3)

UPDATE estoque_filmes set status = 'Em Manutenção' WHERE filme_id = 3;
