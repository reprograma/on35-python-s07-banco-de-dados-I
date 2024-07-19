--Elaborar a tabela flmes para referenciar a chave estrangeira
CREATE TABLE filmes (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    genero TEXT,
    diretor TEXT,
    ano_lancamento INTEGER,
    preco REAL
);

--Inserir filmes para teste 
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);

--SELECT APRESENTA A LISTA DE FILMES
select * FROM filmes

--Criar a tabela estoque filmes com colunas e restrições específicas
CREATE TABLE IF NOT EXISTS estoque_filmes (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    filme_id INTEGER,
    quantidade INTEGER NOT NULL,
    status TEXT CHECK(status IN ('Disponível', 'Alugado', 'Em Manutenção')),
    FOREIGN KEY (filme_id) REFERENCES filmes(id)
);

--Inserir registros na tabela 
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');

--Obter quantidade disponível em estoque para o filme com ID 2
SELECT ef.quantidade
FROM estoque_filmes ef
WHERE ef.filme_id = 2;

--Verificar se o filme com ID 3 está disponível para aluguel
SELECT CASE
           WHEN ef.quantidade > 0 THEN 'Disponível'
           ELSE 'Indisponível'
       END AS disponivel_para_aluguel
FROM estoque_filmes ef
WHERE ef.filme_id = 3;


--Atualizar o status do filme com ID 1 para "Alugado" e decrementar a quantidade disponível em estoque
UPDATE estoque_filmes
SET quantidade = quantidade - 1,
    status = 'Alugado'
WHERE filme_id = 1
  AND quantidade > 0;

--Atualizar o status do filme com ID 2 para "Disponível" e incrementar a quantidade disponível em estoque
UPDATE estoque_filmes
SET quantidade = quantidade + 1,
    status = 'Disponível'
WHERE filme_id = 2;

--Obter uma lista de todos os filmes disponíveis para aluguel
SELECT f.titulo, ef.quantidade
FROM filmes f
JOIN estoque_filmes ef ON f.id = ef.filme_id
WHERE ef.quantidade > 0;

--Obter a lista de filmes que estão em "Manutenção"
SELECT f.titulo
FROM filmes f
JOIN estoque_filmes ef ON f.id = ef.filme_id
WHERE ef.status = 'Em Manutenção';

--Atualizar o status do filme com ID 3 para "Em Manutenção"
UPDATE estoque_filmes
SET status = 'Em Manutenção'
WHERE filme_id = 3;

SELECT * FROM estoque_filmes