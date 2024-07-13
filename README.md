<h1 align="center">
  <img src="assets/reprograma-fundos-claros.png" alt="logo reprograma" width="500">
</h1>

# Lidando com Bancos de Dados

Turma ON35 | Python | Semana 7 | 2024 | Professora Camila Ribeiro

### Instruções
Antes de começar, vamos organizar nosso setup.

    1. Fork esse repositório
    2. Clone o fork na sua máquina (Para isso basta abrir o seu terminal e digitar `git clone url-do-seu-repositorio-forkado`)
    3. Entre na pasta do seu repositório (Para isso basta abrir o seu terminal e digitar `cd nome-do-seu-repositorio-forkado`)

<br>

## Sumário

- [Introdução](#introdução)
- [Objetivos da Aula](#objetivos-da-aula)
- [Instalação e Configuração](#instalação-e-configuração)
- [Conceitos Básicos de Banco de Dados](#conceitos-básicos-de-banco-de-dados)
- [Introdução ao SQLite](#introdução-ao-sqlite)
- [Tipo de dados](#tipo-de-dados)
- [Comandos SQL por Categoria](#comandos-sql-por-categoria)
- [Links](#links)


## Introdução

Nesta aula, vamos explorar os fundamentos dos bancos de dados relacionais e aprender a usar o SQLite para criar, manipular e consultar bancos de dados. Esta é a primeira de duas aulas, e ao final desta série, você estará apta a trabalhar com bancos de dados básicos de forma eficaz.

## Objetivos da Aula

- Entender o que são bancos de dados e sua importância na análise de dados.
- Aprender os conceitos básicos de bancos de dados relacionais.
- Utilizar o SQLite e a ferramenta online SQLiteOnline.
- Executar comandos SQL básicos para criar, inserir, atualizar e consultar dados.
- Compreender relacionamentos entre tabelas e executar joins.

## Instalação e Configuração

### Ferramentas Necessárias

- [SQLiteOnline](https://sqliteonline.com/): Ferramenta online para praticar SQL.

### Como Acessar o SQLiteOnline

1. Acesse [SQLiteOnline](https://sqliteonline.com/).
2. Clique em "Start" para iniciar a ferramenta.
3. Você verá uma interface com um editor SQL à esquerda e os resultados das consultas à direita.

## Conceitos Básicos de Banco de Dados

### O que é um Banco de Dados?

Um banco de dados é um conjunto de informações que são organizadas em uma estrutura específica para permitir seu armazenamento e recuperação de maneira eficiente. Ele pode ser utilizado em diversos tipos de sistemas, desde aplicações simples até sistemas complexos de grande porte. 

Os primeiros fundamentos de banco de dados relacionais surgiram entre as décadas de 1960 a 1970 pela IBM. Na década de 80, a Oracle, com a permissão da IBM, foi a primeira empresa a desenvolver o banco utilizando o padrão SQL para consulta/escrita como é conhecido hoje. Após a explosão da web, também conhecida como web 2.0, foi necessário uma alternativa ao SQL (relacional), assim, a partir de 1998, foi criado o conceito de banco NoSQL (não relacional).

### Terminologia Básica

- **Tabela**: Estrutura que organiza os dados em linhas e colunas.
- **Linha (Registro)**: Um único conjunto de dados em uma tabela.
- **Coluna (Campo)**: Um único tipo de dado armazenado em uma tabela.
- **Chave Primária**: Identificador único para cada registro em uma tabela.
- **Chave Estrangeira**: Coluna que cria um vínculo entre duas tabelas.

## Introdução ao SQLite

### O que é o SQLite?

SQLite é um sistema de gerenciamento de banco de dados relacional, leve e incorporável. Ele é amplamente utilizado em aplicações web, dispositivos móveis e projetos de pequena escala.

### Vantagens do SQLite

- Simplicidade e facilidade de uso.
- Não requer um servidor separado para operar.
- Portabilidade e desempenho.

## Tipo de dados

No SQLite, assim como em muitos outros sistemas de gerenciamento de banco de dados (SGBDs), os tipos de dados disponíveis são essenciais para definir a estrutura das tabelas e como os dados são armazenados, porque determinam o formato e as características de cada informação que será armazenada.

Aqui estão os tipos de dados mais comuns disponíveis no SQLite Online:


1. **TEXT:** Armazena strings de texto, como nomes, endereços, descrições e textos longos.

2. **INTEGER:** Armazena números inteiros, positivos e negativos.

3. **REAL:** Armazena números de ponto flutuante, como números decimais, valores monetários e medidas.

4. **BLOB:** Armazena dados binários, como imagens, arquivos de áudio e vídeo.

5. **NUMERIC:** Armazena números decimais com alta precisão.

6. **BOOLEAN:** Armazena valores lógicos, como "verdadeiro" (TRUE) ou "falso" (FALSE).

**Por que os Tipos de Dados são Importantes?**

* **Eficiência:** O SQLite usa os tipos de dados para otimizar o armazenamento e o processamento das informações.
* **Consistência:** Garante que os dados sejam armazenados de forma consistente e que os valores sejam válidos para cada coluna.
* **Validação:** Permite validar os dados durante a inserção, evitando erros e inconsistências.
* **Operações:** O tipo de dados determina quais operações podem ser realizadas com cada coluna, como ordenação, comparação e cálculo.

**Dicas para Escolher os Tipos de Dados:**

* **Escolha o tipo de dados que melhor se adapta ao tipo de informação que você quer armazenar.**
* **Evite usar TEXT para armazenar números, pois isso pode levar a problemas de desempenho.**
* **Use BOOLEAN para armazenar valores lógicos, como TRUE ou FALSE.**

## Comandos SQL por Categoria

  ![Untitled](assets/tipos_ling.png)

  A imagem representa uma estrutura hierárquica dos comandos SQL, que são as instruções usadas para interagir com bancos de dados relacionais. 

  SQL Statements é a categoria principal que engloba todos os comandos SQL, que podem ser divididos em cinco categorias principais.

  **1. DDL (Data Definition Language):**
 * **Função:** Define a estrutura do banco de dados, criando, alterando e excluindo objetos como tabelas, colunas, índices e outros elementos que compõem a base do seu sistema de armazenamento de dados.
 * **Comandos:**
     * **CREATE:**  Cria novos objetos (tabelas, índices, etc.).
        * **CREATE TABLE:** Criar uma nova tabela chamada "Livros":
    ```sql
    CREATE TABLE Livros (
     Título TEXT,
     Autor TEXT,
     Ano INTEGER,
     Gênero TEXT
    );
    ```
     * **DROP:**  Exclui objetos existentes.
        * **DROP TABLE:** Excluir a tabela "Livros":
    ```sql
    DROP TABLE Livros;
    ```
     * **ALTER:** Altera a estrutura de objetos existentes.
        * **ALTER TABLE:** Adicionar uma nova coluna chamada "Editora" à tabela "Livros":
    ```sql
    ALTER TABLE Livros
    ADD COLUMN Editora TEXT;
    ```
     * **TRUNCATE:**  Exclui todos os dados de uma tabela, mas mantém a estrutura.
        * **TRUNCATE TABLE:**  Excluir todos os dados da tabela "Livros", mas manter a estrutura da tabela:
    ```sql
    TRUNCATE TABLE Livros;
    ```
     * **RENAME:** Renomeia objetos (tabelas, colunas, etc.).
        * **RENAME TABLE:** Renomear a tabela "Livros" para "Obras":
    ```sql
    RENAME TABLE Livros TO Obras;
    ```

**2. DQL (Data Query Language):**
 * **Função:**  Permite consultar e recuperar dados do banco de dados.
 * **Comandos:**
     * **SELECT:** Seleciona dados de uma ou mais tabelas, com opções de filtragem e ordenação.
        * **SELECT:** Selecionar todos os livros da tabela "Livros":
    ```sql
    SELECT * FROM Livros;
    ```

    Selecionar os títulos e autores dos livros publicados após 2000:
    ```sql
    SELECT Título, Autor FROM Livros WHERE Ano > 2000;
    ```

**3. DML (Data Manipulation Language):**
 * **Função:** Manipula os dados dentro das tabelas, inserindo, atualizando e excluindo registros. 
 * **Comandos:**
     * **INSERT:** Insere novas linhas em uma tabela.
        * **INSERT INTO:** Inserir um novo livro na tabela "Livros":
    ```sql
    INSERT INTO Livros (Título, Autor, Ano, Gênero) 
    VALUES ('O Senhor dos Anéis', 'J. R. R. Tolkien', 1954, 'Fantasia');
    ```
     * **UPDATE:**  Altera dados em linhas existentes.
        * Atualizar o gênero do livro "O Senhor dos Anéis" para "Fantasia épica":
    ```sql
    UPDATE Livros 
    SET Gênero = 'Fantasia épica' 
    WHERE Título = 'O Senhor dos Anéis';
    ```
     * **DELETE:**  Exclui linhas de uma tabela.
        * Excluir o livro "O Senhor dos Anéis" da tabela "Livros":
    ```sql
    DELETE FROM Livros WHERE Título = 'O Senhor dos Anéis';
    ```
     * **LOCK:**  Bloqueia linhas para evitar alterações simultâneas.
        * Bloqueia a linha com o título "O Senhor dos Anéis" para edição exclusiva
    ```sql
    
    BEGIN TRANSACTION;
    SELECT * FROM Livros WHERE Título = 'O Senhor dos Anéis' FOR UPDATE;
    -- Faça a atualização da linha
    UPDATE Livros SET Gênero = 'Fantasia épica' WHERE Título = 'O Senhor dos Anéis';
    COMMIT;
    ```
     * **CALL:** Chama uma função ou procedimento armazenado.
        * Supondo que exista um procedimento armazenado chamado **"get_livros_por_genero"**
    ```sql
    CALL get_livros_por_genero('Fantasia');
    ```
     * **EXPLAIN PLAN:** Mostra o plano de execução de uma consulta, ajudando a otimizar a performance.

     ```sql
    EXPLAIN QUERY PLAN SELECT * FROM Livros WHERE Ano > 2000;
    ```

**4. DCL (Data Control Language):**
 * **Função:** Controla o acesso aos dados do banco de dados, definindo permissões e privilégios para usuários e grupos.
 * **Comandos:**
     * **GRANT:** Concede permissões a usuários.
        * Conceder permissão de leitura e escrita na tabela "Livros" ao usuário "Alice":
    ```sql
    GRANT SELECT, INSERT, UPDATE, DELETE ON Livros TO Alice;
    ```
     * **REVOKE:**  Revoca permissões de usuários.
     * Retirar a permissão de escrita na tabela "Livros" do usuário "Alice":
    ```sql
    REVOKE INSERT, UPDATE, DELETE ON Livros FROM Alice;
    ```

**5. TCL (Transaction Control Language):**
 * **Função:** Controla as transações no banco de dados, garantindo que todas as operações de uma transação sejam concluídas com sucesso ou que nenhuma seja aplicada caso ocorra um erro.
 * **Comandos:**
     * **COMMIT:** Confirma as alterações de uma transação.
    ```sql
    COMMIT;
    ```
     * **ROLLBACK:**  Reverte as alterações de uma transação.
    ```sql
    ROLLBACK;
    ```
     * **SAVEPOINT:**  Cria um ponto de salvamento dentro de uma transação, permitindo reverter as alterações até esse ponto.
      ```sql
    SAVEPOINT my_savepoint;
    ```
<br>

## Links

- [Documentação do SQLite](https://www.sqlite.org/docs.html)
- [Tutorial de SQL W3Schools](https://www.w3schools.com/sql/)
- [SQLite Tutorial](https://www.sqlitetutorial.net/)
- [Game SQL](https://sql-island.informatik.uni-kl.de/)
- [SQL Murder Mystery](https://mystery.knightlab.com/)
- [SQLZoo](https://sqlzoo.net/wiki/SQL_Tutorial)

<br>

---



<p align="center">
Desenvolvido com :purple_heart:  
</p>

