CREATE TABLE alunos (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    idade INTEGER
)

INSERT INTO alunos (nome,idade) VALUES ('JAMILE',29);
INSERT INTO alunos (nome,idade) VALUES ('CAMILA',36);
INSERT INTO alunos (nome,idade) VALUES ('JOÃO',20);
INSERT INTO alunos (nome,idade) VALUES ('MARIA',22);
INSERT INTO alunos (nome,idade) VALUES ('PEDRO',19);

SELECT * FROM alunos;

UPDATE alunos SET idade = 23 WHERE id = 2;

DELETE FROM alunos WHERE id = 3;
DELETE FROM alunos WHERE id IN (2,4);