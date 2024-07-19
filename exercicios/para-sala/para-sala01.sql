--13/07/2024

-- Exercício 1: Criar uma Tabela

CREATE TABLE alunos (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    idade INTEGER
);

-- Exercício 2: Inserir Dados

INSERT INTO alunos (nome, idade) VALUES ('João', 20);
INSERT INTO alunos (nome, idade) VALUES ('Maria', 22);
INSERT INTO alunos (nome, idade) VALUES ('Pedro', 19);
INSERT INTO alunos (nome, idade) VALUES ('Daiana', 36);
INSERT INTO alunos (nome, idade) VALUES ('Angelina', 33);
INSERT INTO alunos (nome, idade) VALUES ('Raquel', 41);

-- Exercício 3: Selecionar Dados

SELECT * FROM alunos;

-- Exercício 4: Atualizar Dados


UPDATE alunos SET idade = 23 WHERE id = 2;

-- Exercício 5: Excluir Dados

DELETE FROM alunos WHERE id = 5;
DELETE FROm alunos where id in (1,2,3,4)


-- Exercício 6: Problema da Loja de Livros


CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    autor TEXT,
    ano_publicacao INTEGER,
    preco REAL
);


INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('Dom Quixote', 'Miguel de Cervantes', 1605, 29.90);
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('Orgulho e Preconceito', 'Jane Austen', 1813, 25.50);
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('1984', 'George Orwell', 1949, 35.75);

SELECT * FROM livros;
SELECT titulo, autor from livros where ano_publicacao > 1800;
SELECT titulo, autor, preco from livros where preco > 30.00;

-- Exercício 8: Gerenciamento de Vendas de Livros

-- Criar a tabela 'vendas'
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
    livros ON vendas.livro_id = livros.id;
  

-- Exercício 9: Sistema de Votação Online para Melhores Livros do Ano
 
 -- Criar a tabela 'votos'
CREATE TABLE votos (
    id INTEGER PRIMARY KEY,
    id_usuario INTEGER,
    id_livro INTEGER,
    data_voto DATETIME
);

-- Inserir alguns registros de exemplo na tabela 'votos'
INSERT INTO votos (id_usuario, id_livro, data_voto) VALUES (1, 1, '2024-05-10 08:30:00');  -- Voto do usuário 1 para o livro 1
INSERT INTO votos (id_usuario, id_livro, data_voto) VALUES (2, 2, '2024-05-10 09:45:00');  -- Voto do usuário 2 para o livro 2
INSERT INTO votos (id_usuario, id_livro, data_voto) VALUES (1, 3, '2024-05-10 10:15:00');  -- Voto do usuário 1 para o livro 3


