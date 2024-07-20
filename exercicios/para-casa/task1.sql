CREATE DATABASE estoque;
USE estoque;

CREATE TABLE filmes (
	id INTEGER PRIMARY KEY,
	titulo TEXT,
	genero TEXT,
	diretor TEXT,
	ano_lancamento INTEGER,
	preco REAL
);

INSERT INTO filmes (id, titulo, genero, diretor, ano_lancamento, preco) VALUES (1, 'O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (id, titulo, genero, diretor, ano_lancamento, preco) VALUES (2, 'Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (id, titulo, genero, diretor, ano_lancamento, preco) VALUES (3, 'O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);

SELECT * FROM filmes;

CREATE TABLE estoque_filmes (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  filme_id INTEGER,
  quantidade INTEGER,
  status VARCHAR(20),
  FOREIGN KEY (filme_id) REFERENCES filmes(id)
);

INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');

SELECT * FROM estoque_filmes;

-- 1. Obter a quantidade disponível em estoque para um determinado filme: (Ex.: Para o filme com ID 2)
SELECT filmes.titulo,
	estoque_filmes.quantidade 
FROM 
	estoque_filmes 
JOIN
	filmes ON estoque_filmes.filme_id = filmes.id
where
	filmes.id = 2;

-- 2. Verificar se um filme está disponível para aluguel: (Ex.: Para o filme com ID 3)
SELECT filmes.titulo,
	estoque_filmes.status
FROM
	estoque_filmes
JOIN
	filmes ON estoque_filmes.filme_id = filmes.id
WHERE filme_id = 3;

-- 3. Atualizar o status de um filme para "Alugado": (Ex.: Para o filme com ID 1, diminuindo a quantidade em estoque)
UPDATE estoque_filmes
SET status = 'Alugado',
	quantidade = quantidade - 1
where filme_id = 1 AND quantidade >= 1;

-- 4. Atualizar o status de um filme para "Disponível": (Ex.: Para o filme com ID 2, aumentando a quantidade em estoque)
UPDATE estoque_filmes
SET status = 'disponível',
quantidade = quantidade + 1
WHERE filme_id = 2;

-- 5. Obter a lista de todos os filmes disponíveis para aluguel:
SELECT filmes.titulo,
	estoque_filmes.status
FROM
	estoque_filmes
JOIN
	filmes ON estoque_filmes.filme_id = filmes.id;

-- 6. Obter a lista de filmes que estão em "Manutenção":
SELECT filmes.titulo,
	estoque_filmes.status
FROM
	estoque_filmes
JOIN
	filmes ON estoque_filmes.filme_id = filmes.id
WHERE status = 'Manutenção';

-- 7. Atualizar o status de um filme para "Em Manutenção": (Ex.: Para o filme com ID 3)
UPDATE estoque_filmes
SET status = 'Em manutenção',
quantidade = quantidade - 1
WHERE filme_id = 3;

