
/*CREATE TABLE alunos (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    idade INTEGER
);

SELECT * FROM alunos
INSERT INTO alunos (nome, idade) VALUES ('Daiana', 36);
INSERT INTO alunos (nome, idade) VALUES ('Angelina', 33);
INSERT INTO alunos (nome, idade) VALUES ('Raquel', 41);

--Atualize a idade do aluno com id igual a 2 para 23 anos.
UPDATE alunos SET idade = 23 WHERE id = 2;
--excluir da tabela alunos
DELETE FROM alunos WHERE id = 4;*/



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

-- Selecionar  o título e o autor de todos os livros publicados após o ano de 2010.
SELECT titulo, autor from livros WHERE ano_publicacao > 1900;

--Selecionar o título, autor e preço dos livros com preço superior a R$ 30,00

SELECT titulo, autor, preco from livros WHERE preco > 30.00;
