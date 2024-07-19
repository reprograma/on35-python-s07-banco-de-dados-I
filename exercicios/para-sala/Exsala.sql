--Exercício 1: Criar uma Tabela
CREATE TABLE alunos (
   id INTEGER PRIMARY KEY,
    nome TEXT,
  idade INTEGER
);

--Exercício 2: Inserir Dados
INSERT INTO alunos (nome, idade) VALUES ('Daiana', 36);
INSERT INTO alunos (nome, idade) VALUES ('Angelina', 33);
INSERT INTO alunos (nome, idade) VALUES ('Raquel', 41);
INSERT INTO alunos VALUES (4, 'Dyliane', 28)

--Exercício 3: Selecionar Dados
Select * FROM alunos

--Exercício 4: Atualizar Dados
UPDATE alunos SET idade = 23 WHERE id = 2;

--Exercício 5: Excluir Dados
DELETE FROM alunos WHERE id = 3;

--Atualizando
UPDATE alunos SET id = 3 WHERE id = 4;

--Exercício 6: Problema da Loja de Livros
CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    autor TEXT,
    ano_publicacao INTEGER,
    preco REAL
);

SELECT * FROM livros

INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('Dom Quixote', 'Miguel de Cervantes', 1605, 29.90);
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('Orgulho e Preconceito', 'Jane Austen', 1813, 25.50);
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('1984', 'George Orwell', 1949, 35.75);

SELECT titulo, autor FROM livros WHERE ano_publicacao > 1900

SELECT titulo, autor, preco from livros where preco > 30

--Exercício 8: Gerenciamento de Vendas de Livros

CREATE TABLE vendas (
    id INTEGER PRIMARY KEY,
    livro_id INTEGER,
    data_venda DATE,
    quantidade INTEGER,
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- Inserir alguns registros de vendas para teste
INSERT INTO vendas (livro_id, data_venda, quantidade) VALUES (1, '2024-05-10', 3);  -- Venda de 3 exemplares de 'Dom Quixote'
INSERT INTO vendas (livro_id, data_venda, quantidade) VALUES (2, '2024-05-09', 5);  -- Venda de 5 exemplares de 'Orgulho e Preconceito'
INSERT INTO vendas (livro_id, data_venda, quantidade) VALUES (3, '2024-05-08', 2);  -- Venda de 2 exemplares de '1984'

-- Realizar JOIN entre as tabelas 'livros' e 'vendas'
SELECT 
    livros.titulo, 
    livros.autor, 
    vendas.data_venda, 
    vendas.quantidade
FROM 
    vendas
JOIN 
    livros ON vendas.livro_id = livros.id;*/
    
--Exercício 9/10: Sistema de Votação Online para Melhores Livros do Ano
-- Criar a tabela 'votos'
CREATE TABLE votos (
    id INTEGER PRIMARY KEY,
    id_usuario INTEGER,
    estoque INTEGER
);

-- Inserir alguns registros de exemplo na tabela 'votos'
INSERT INTO votos (id, id_usuario, estoque) VALUES (10, 1, 40);
INSERT INTO votos (id, id_usuario, estoque) VALUES (20, 2, 20);  
INSERT INTO votos (id, id_usuario, estoque) VALUES (30, 3, 1);  

-- Consulta por ordem
SELECT *
FROM votos
ORDER BY estoque;

-- Incremento usando SET na coluna estoque
UPDATE votos
SET estoque = estoque + 1
WHERE id = 10; -- Supondo que você deseja incrementar o estoque do voto com ID 1

-- Consulta após o incremento
SELECT *
FROM votos;
