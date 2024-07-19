-- Criação tabela de filmes --
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

-- Tabela para armazenar os status
CREATE TABLE status_filmes (
    id INTEGER PRIMARY KEY,
    descricao TEXT
);

-- Inserindo os valores permitidos na tabela de status
INSERT INTO status_filmes (id, descricao) VALUES
  (1, 'Disponível'),
  (2, 'Alugado'),
  (3, 'Em Manutenção');

-- Tabela estoque_filmes com referência à tabela status_filmes
CREATE TABLE estoque_filmes (
    id INTEGER PRIMARY KEY,
    filme_id INTEGER,
    quantidade INTEGER,
    status_id INTEGER,
    FOREIGN KEY (filme_id) REFERENCES filmes(id),
    FOREIGN KEY (status_id) REFERENCES status_filmes(id)
);

-- Inserindo valores para tabela estoque_filmes
INSERT INTO estoque_filmes (filme_id, quantidade, status_id) VALUES (1, 10, 'Alugado');
INSERT INTO estoque_filmes (filme_id, quantidade, status_id) VALUES (2, 5, 'Alugado');
INSERT INTO estoque_filmes (filme_id, quantidade, status_id) VALUES (3, 15, 'Dispomivel');

SELECT *FROM filmes
SELECT *FROM estoque_filmes

--1. **Obter a quantidade disponível em estoque para um determinado filme:**  (Ex.: Para o filme com ID 2)
SELECT quantidade FROM estoque_filmes WHERE filme_id=3

--2 Verificar se um filme está disponível para aluguel:
SELECT quantidade FROM estoque_filmes WHERE filme_id = 3 AND status_id = 1 LIMIT 1;

-- 3 Atualizar o status de um filme para "Alugado"
UPDATE estoque_filmes
SET quantidade = quantidade - 1
WHERE filme_id = 3 AND quantidade > 0;

UPDATE estoque_filmes
set status_id = 2
WHERE filme_id = 3 AND quantidade = 0;

--4. **Atualizar o status de um filme para "Disponível"**: (Ex.: Para o filme com ID 2, aumentando a quantidade em estoque)

UPDATE estoque_filmes
SET quantidade = quantidade + 1
WHERE filme_id = 3 AND quantidade > 0;

UPDATE estoque_filmes
set status_id = 2
WHERE filme_id = 3 AND quantidade = 0;

--5. **Obter a lista de todos os filmes disponíveis para aluguel:**  
SELECT f.titulo, f.genero, f.diretor, f.ano_lancamento, f.preco
FROM filmes f
JOIN estoque_filmes e ON f.id = e.filme_id
WHERE e.status_id = 'Disponível';

--6  Obter a lista de filmes que estão em "Manutenção"
SELECT f.titulo, f.genero, f.diretor, f.ano_lancamento, f.preco
FROM filmes f
JOIN estoque_filmes e ON f.id = e.filme_id
WHERE e.status_id = 'Em Manutenção';

-- 7 Atualizar o status de um filme para "Em Manutenção" para o filme com ID 3
UPDATE estoque_filmes
SET status_id = 'Em Manutenção'
WHERE filme_id = 3;