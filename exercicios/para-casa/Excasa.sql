CREATE DATABASE ESTOQUE; 
USE ESTOQUE;

CREATE TABLE filmes (
id INTEGER PRIMARY KEY,
titulo TEXT,
genero TEXT,
diretor TEXT,
ano_lancamento INTEGER,
preco REAL
);

-- Insira alguns filmes para teste
INSERT INTO filmes (id, titulo, genero, diretor, ano_lancamento, preco) VALUES (1, 'O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (id, titulo, genero, diretor, ano_lancamento, preco) VALUES (2, 'Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (id, titulo, genero, diretor, ano_lancamento, preco) VALUES (3, 'O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);

SELECT * FROM estoque_filmes;

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


-- Obter a quantidade disponível em estoque para um determinado filme: (Ex.: Para o filme com ID 2)
SELECT filmes.titulo,
	estoque_filmes.quantidade 
FROM 
	estoque_filmes 
JOIN
	filmes ON estoque_filmes.filme_id = filmes.id
where
	filmes.id = 2;
    
-- Verificar se um filme está disponível para aluguel: (Ex.: Para o filme com ID 3)
SELECT filmes.titulo,
	estoque_filmes.status 
FROM 
	estoque_filmes 
JOIN
	filmes ON estoque_filmes.filme_id = filmes.id
where
	filmes.id = 3;

-- Atualizar o status de um filme para "Alugado": (Ex.: Para o filme com ID 1, diminuindo a quantidade em estoque)
update estoque_filmes set status = 'Indisponível' where filme_id = 1;

-- Atualizar o status de um filme para "Disponível": (Ex.: Para o filme com ID 2, aumentando a quantidade em estoque)
update estoque_filmes set status = 'Disponível' where filme_id = 1;

-- Obter a lista de todos os filmes disponíveis para aluguel:
SELECT filmes.titulo,
	estoque_filmes.quantidade,
    estoque_filmes.status
FROM 
	estoque_filmes 
JOIN
	filmes ON estoque_filmes.filme_id = filmes.id
where
	estoque_filmes.status = 'Disponível';
    
-- Atualizar o status de um filme para "Em Manutenção": (Ex.: Para o filme com ID 3)
update estoque_filmes set status = 'Em Manutenção' where filme_id = 3;

-- Obter a lista de filmes que estão em "Manutenção":
SELECT filmes.titulo,
    estoque_filmes.status
FROM 
	estoque_filmes 
JOIN
	filmes ON estoque_filmes.filme_id = filmes.id
where
	estoque_filmes.status = 'Em Manutenção';