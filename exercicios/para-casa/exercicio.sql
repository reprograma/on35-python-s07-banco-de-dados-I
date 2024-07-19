CREATE TABLE filmes (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    genero TEXT,
    diretor TEXT,
    ano_lancamento INTEGER,
    preco REAL
);

SELECt * FROM filmes;

INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Poderoso Chefão', 'Drama', 'Francis Ford Coppola', 1972, 25.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Pulp Fiction', 'Crime', 'Quentin Tarantino', 1994, 29.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 'Peter Jackson', 2001, 35.90);

CREATE TABLE estoque_filmes (
id INTEGER PRIMARY KEY AUTOINCREMENT,
filme_id INTEGER,
quantidade INTEGER,
status VARCHAR(20),
FOREIGN KEY (filme_id) REFERENCES filmes(id)
)
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');

SELECT*FROM estoque_filmes;

-- Juntei duas tabalhas, filme e quantidade filme para tirar a quantidade filmes disponiveis
SELECT f.titulo, ef.quantidade
FROM filmes f
INNER JOIN estoque_filmes ef ON f.id = ef.filme_id
WHERE f.id = 2;

SELECT CASE WHEN quantidade > 0 THEN 'Disponível para aluguel' ELSE 'Indisponível para aluguel' END AS status_aluguel 
FROM estoque_filmes WHERE filme_id = 1;

UPDATE estoque_filmes SET quantidade = quantidade - 1, status = 'Alugado' WHERE filme_id = 2;

UPDATE estoque_filmes SET quantidade = quantidade + 1, status = 'Disponível' WHERE filme_id = 2;

SELECT f.titulo, f.genero, f.diretor, f.ano_lancamento, f.preco, ef.quantidade FROM filmes f
INNER JOIN estoque_filmes ef ON f.id = ef.filme_id WHERE ef.status = 'Disponível';

SELECT f.titulo, f.genero, f.diretor, f.ano_lancamento, f.preco FROM filmes f
INNER JOIN estoque_filmes ef ON f.id = ef.filme_id WHERE ef.status = 'Em Manutenção';

UPDATE estoque_filmes SET status = 'Em Manutenção' WHERE filme_id = 3;

SELECT*FROM estoque_filmes;



