1. Criação da tabela filmes
CREATE TABLE filmes (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    genero TEXT,
    diretor TEXT,
    ano_lancamento INTEGER,
    preco REAL
);

-- 2. Inserção de dados de teste na tabela filmes
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);

-- 3. Criação da tabela estoque_filmes
CREATE TABLE estoque_filmes (
    id INTEGER PRIMARY KEY,
    filme_id INTEGER,
    quantidade INTEGER,
    status TEXT,
    FOREIGN KEY (filme_id) REFERENCES filmes (id)
);

-- 4. Inserção de dados de teste na tabela estoque_filmes
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');

-- 5. Consultas SQL

-- Obter a quantidade disponível em estoque para um determinado filme
SELECT quantidade FROM estoque_filmes WHERE filme_id = 2;

-- Verificar se um filme está disponível para aluguel
SELECT status FROM estoque_filmes WHERE filme_id = 3;

-- Atualizar o status de um filme para "Alugado" 
UPDATE estoque_filmes
SET status = 'Alugado', quantidade = quantidade - 1
WHERE filme_id = 1 AND quantidade > 0;

-- Atualizar o status de um filme para "Disponível" 
UPDATE estoque_filmes
SET status = 'Disponível', quantidade = quantidade + 1
WHERE filme_id = 2;

-- Obter a lista de todos os filmes disponíveis para aluguel
SELECT f.id, f.titulo, ef.quantidade, ef.status
FROM filmes f
JOIN estoque_filmes ef ON f.id = ef.filme_id
WHERE ef.status = 'Disponível';

-- Obter a lista de filmes que estão em "Manutenção"
SELECT f.id, f.titulo, ef.quantidade, ef.status
FROM filmes f
JOIN estoque_filmes ef ON f.id = ef.filme_id
WHERE ef.status = 'Em Manutenção';

-- Atualizar o status de um filme para "Em Manutenção"
UPDATE estoque_filmes
SET status = 'Em Manutenção'
WHERE filme_id = 3;
