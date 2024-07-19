-- Criar Database
CREATE DATABASE estoque;
USE estoque;

-- Criar tabela filmes
CREATE TABLE filmes (
id INTEGER PRIMARY KEY,
titulo TEXT,
genero TEXT,
diretor TEXT,
ano_lancamento INTEGER,
preco REAL
);
-- Inserir alguns filmes para teste
INSERT INTO filmes (id, titulo, genero, diretor, ano_lancamento, preco) VALUES (1, 'O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (id, titulo, genero, diretor, ano_lancamento, preco) VALUES (2, 'Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (id, titulo, genero, diretor, ano_lancamento, preco) VALUES (3, 'O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);
SELECT * FROM filmes; 

-- -- Criar tabela filmes_estoque
CREATE TABLE filmes_estoque (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
	filme_id INTEGER,
	quantidade INTEGER,
    status VARCHAR(20),
    foreign KEY (filme_id) references filmes(id)
);
-- Inserir quantidades e status para teste
INSERT INTO filmes_estoque (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO filmes_estoque (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO filmes_estoque (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');
SELECT * FROM filmes_estoque;

-- Obter a quantidade disponível em estoque para o filme com ID 1
SELECT quantidade
FROM filmes_estoque
WHERE filmes_estoque.filme_id = 1;

-- Verificar se o filme com ID 1 está disponível para aluguel:
SELECT status
FROM filmes_estoque
WHERE filmes_estoque.filme_id = 1;

-- Atualizar o status do filme com ID 1 para "Alugado":  
UPDATE filmes_estoque 
SET status = 'alugado' 
WHERE id = 1;
-- Diminuindo a quantidade em estoque:
UPDATE filmes_estoque 
SET quantidade = quantidade - 1  
WHERE id = 1;

-- Atualizar o status do filme com ID 1 para "Disponível":  
UPDATE filmes_estoque 
SET status = 'Disponível' 
WHERE id = 1;
-- Aumentando a quantidade em estoque:
UPDATE filmes_estoque 
SET quantidade = quantidade + 1 
WHERE id = 1;

-- Obter a lista de todos os filmes disponíveis para aluguel:
SELECT f.id, f.titulo, f.genero, f.diretor, e.quantidade, e.status
FROM filmes f
JOIN filmes_estoque e ON f.id = e.filme_id
WHERE e.status = 'Disponível'
	AND e.quantidade > 0;
    
-- Atualizar o status do filme com ID 1 para "Em Manutenção":
UPDATE filmes_estoque 
SET status = 'Em Manutenção' 
WHERE id = 2;

-- Obter a lista de filmes que estão em "Manutenção":
SELECT f.id, f.titulo, f.genero, f.diretor, e.quantidade, e.status
FROM filmes f
JOIN filmes_estoque e ON f.id = e.filme_id
WHERE e.status = 'Em Manutenção'	
	AND e.quantidade > 0;
    
    