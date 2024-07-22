-- Criação da tabela filmes
CREATE TABLE filmes (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    genero TEXT,
    diretor TEXT,
    ano_lancamento INTEGER,
    preco REAL
);


-- Inserção de alguns filmes para teste
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);
SELECT * FROM filmes

-- Criação da tabela estoque_filmes
CREATE TABLE estoque_filmes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    filme_id INTEGER,
    quantidade INTEGER,
    status TEXT,
    FOREIGN KEY (filme_id) REFERENCES filmes(id)
);


-- Inserção de registros na tabela estoque_filmes
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');
SELECT * FROM estoque_filmes

-- Consulta para obter a quantidade disponível em estoque para o filme com ID 2
SELECT quantidade
FROM estoque_filmes
WHERE filme_id = 2;


-- Consulta para verificar se o filme com ID 3 está disponível para aluguel
SELECT status
FROM estoque_filmes
WHERE filme_id = 3;


-- Atualizar o status de um filme para "Alugado" e diminuir a quantidade em estoque
UPDATE estoque_filmes
SET quantidade = quantidade - 1, status = 'Alugado'
WHERE filme_id = 1 AND quantidade > 0;


-- Atualizar o status de um filme para "Disponível" e aumentar a quantidade em estoque
UPDATE estoque_filmes
SET quantidade = quantidade + 1, status = 'Disponível'
WHERE filme_id = 2;


-- Consulta para obter a lista de todos os filmes disponíveis para aluguel
SELECT f.titulo, e.quantidade, e.status
FROM filmes f
JOIN estoque_filmes e ON f.id = e.filme_id
WHERE e.status = 'Disponível';


-- Atualizar o status de um filme para "Em Manutenção"
UPDATE estoque_filmes
SET status = 'Em Manutenção'
WHERE filme_id = 3;

