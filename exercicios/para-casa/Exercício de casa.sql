--Criar uma tabela chamada estoque_filmes para armazenar as seguintes informações sobre os filmes em estoque id: Identificador único para cada registro de estoque (inteiro, chave primária).
--filme_id: Identificador do filme (chave estrangeira referenciando a tabela filmes).
--quantidade: Quantidade de cópias do filme disponível no estoque (inteiro).
--status: Status atual do filme (texto, podendo ser "Disponível", "Alugado", "Em Manutenção").  

CREATE TABLE estoque_filmes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    filme_id INT,
    quantidade INT,
    status TEXT CHECK(status IN ('Disponível', 'Alugado', 'Em Manutenção')),
    FOREIGN KEY (filme_id) REFERENCES filmes(id)
);

 SELECT * FROM estoque_filmes

--Crie a tabela filmes para armazenar informações básicas sobre os filmes:

CREATE TABLE filmes (
  id INTEGER PRIMARY KEY, 
  titulo TEXT,
  genero TEXT,
  diretor TEXT,
  ano_lancamento INT,
  preco REAL
  );


--Insira filmes na tabela de filmes
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Aquarius', 'Drama', 'Kleber Mendonça', 2016, 30.00);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('A febre do Rato', 'Drama', 'Cláudio Assis', 2012, 29.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Auto da Compadecida', 'Comédia', 'Ariano Suassuna', 2000, 35.90);
INSERT INTO filmes (titulo, genero, diretor, ano_lancamento, preco) VALUES ('Lisbela e o Prisioneiro','Comédia/Romance', 'Guel Arraes', 2003, 25.90);

--Insira registros na tabela estoque_filmes
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (1, 10, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (2, 5, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (3, 15, 'Disponível');
INSERT INTO estoque_filmes (filme_id, quantidade, status) VALUES (4, 6, 'Disponível');

-- Obter a quantidade disponível em estoque de um filme:
SELECT quantidade
FROM estoque_filmes
WHERE filme_id = 2;

--Verificar se um filme está disponível para aluguel:
SELECT status
FROM estoque_filmes
Where filme_id = 4;

--Atualizar o status de um filme para "Alugado" 

UPDATE estoque_filmes
SET status = 'Alugado', quantidade = quantidade -9
WHERE filme_id = 1 AND quantidade > 0;

--Atualizar o status de um filme para 'Disponível':

UPDATE estoque_filmes
SET status = 'Disponível', quantidade = quantidade + 1 
WHERE filme_id = 2;

-- Obter a lista de todos os filmes disponíveis para aluguel: 

SELECT * FROM estoque_filmes WHERE status = 'Disponível'

-- Obter a lista de todos os filmes que estão em 'Manutenção':

SELECT * FROM estoque_filmes WHERE status = 'Em Manutenção'

-- Atualizar o status de um filme para 'Em manutenção':

UPDATE estoque_filmes 
SET status = 'Em Manutenção' 
WHERE filme_id = 3;

