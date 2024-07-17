/* criando a tabela
CREATE TABLE alunos (
    id INTEGER PRIMARY KEY, --Número inteiro
    nome TEXT, -- String(Texto)
    idade INTEGER -- Número inteiro
);

SELECT * FROM alunos --Select from(Selecionar de )
-- inserindo dados
-- insert into(para inserir dados na tabela)
-- Values(valores)
INSERT INTO alunos (nome, idade) VALUES ('Daiana', 36);
INSERT INTO alunos (nome, idade) VALUES ('Angelina',33);
INSERT INTO alunos (nome, idade) VALUES ('Raquel',41);

-- Update (Atualizar) SET(Define a coluna =) Where(onde)
UPDATE alunos SET idade = 23 WHERE id = 2;

-- Delete From (Deletar de) 
DELETE FROM alunos WHERE id = 3;
--deletar mais de um dado
--DELETE FROM alunos where id in (1,2,3,4,5);*/


-- Criar a tabela 'livros'
CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT,
    autor TEXT,
    ano_publicacao INTEGER,
    preco REAL
);

-- Inserir os registros de livros

INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('Dom Quixote', 'Miguel de Cervantes', 1605, 29.90);
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('Orgulho e Preconceito', 'Jane Austen', 1813, 25.50);
INSERT INTO livros (titulo, autor, ano_publicacao, preco) VALUES ('1984', 'George Orwell', 1949, 35.75);


SELECT * FROM livros
SELECT titulo, autor FROM livros WHERE ano_publicacao > 1900;
SELECT titulo, autor, preco from livros where preco > 30.00;