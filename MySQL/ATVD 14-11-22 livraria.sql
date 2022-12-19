/* 
Tomando como base a planilha que foi anexada, faça outras planilhas no MySQL Workbench de modo que possamos armazenar as informações mencionadas.

Crie as seguintes planilhas: autor, avaliação, compra, editora, gênero e por fim a planilha livros.

As planilhas listadas devem possuir os seguintes atributos

Autor: ID, Nome, Endereço, Data de Nascimento e País de Origem.
Avaliação: ID e Avaliação.
Compra: ID, Comprado, data e Valor.
Editora: ID, Nome, Telefone;
Gênero: ID, Nome.
Livros: ID, Nome, Gênero, Número de paginas, autor, editora, avaliação, data publicação.

A planilha Livros deve referenciar as informações das outras planilhas através do valor do ID de tais informações.
Sendo assim, deve ser estabelecida a restrição de chave estrangeira para esses casos.


Ao finalizar insira os cinco livros mais vendidos do Paulo Coelho na sua coleção.
*/

CREATE DATABASE livraria;

USE livraria;

CREATE TABLE IF NOT EXISTS autor (
	id_autor TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR (60) NOT NULL,
    endereco VARCHAR (60) NOT NULL,
    data_nascimento DATE NOT NULL,
    pais_origem VARCHAR (20)
);

CREATE TABLE IF NOT EXISTS avaliacao (
	id_avaliacao TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	avaliacao VARCHAR (30) NOT NULL
);

CREATE TABLE IF NOT EXISTS compra (
	id_compra TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comprado VARCHAR (30) NOT NULL,
    data_compra DATE,
    valor DECIMAL (5,2),
    FK_livro TINYINT NOT NULL,
    FOREIGN KEY (FK_livro) REFERENCES livros (id_livro)
);

CREATE TABLE IF NOT EXISTS editora (
	id_editora TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (60) NOT NULL,
    telefone VARCHAR (15)
);

CREATE TABLE IF NOT EXISTS genero (
	id_genero TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    genero VARCHAR (30)
);
-- Livros: ID, Nome, Gênero, Número de paginas, autor, editora, data publicação.
CREATE TABLE IF NOT EXISTS livros (
	id_livro TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR (60) NOT NULL,
    FK_genero TINYINT NOT NULL,
    numero_paginas INT NOT NULL,
    FK_autor TINYINT NOT NULL,
    FK_editora TINYINT NOT NULL,
    FK_avaliacao TINYINT NOT NULL,
    data_publicacao DATE,
    FOREIGN KEY (FK_genero) REFERENCES genero (id_genero),
	FOREIGN KEY (FK_autor) REFERENCES autor (id_autor),
    FOREIGN KEY (FK_editora) REFERENCES editora (id_editora),
    FOREIGN KEY (FK_avaliacao) REFERENCES avaliacao (id_avaliacao)
);
INSERT INTO autor (nome, endereco, data_nascimento, pais_origem) VALUES 
('J. K. Rowling', '3227 Fairmont Avenue', '1971-08-16', 'Inglaterra'),
('Maurice Leblanc', '2496 Rose Avenue', '2006-06-28', 'França'),
('Arthur Conan Doyle', '221 Baker Street', '2010-09-23', 'Inglaterra'),
('Gilian Flynn', '2103 Randall Drive', '2000-07-17', 'Estados Unidos');

SELECT * FROM autor;

INSERT INTO avaliacao (avaliacao) VALUES 
('Perfeito'),
('Maravilhoso'),
('Muito bom'),
('Gostei'),
('Fraco'),
('Não Gostei');

SELECT * FROM avaliacao;

INSERT INTO compra (comprado, valor, FK_livro, data_compra) VALUES 
('Não', 50.36, 1, DEFAULT),
('Tenho Interesse', 24.90, 2, DEFAULT),
('Sim', 18.79, 3, '2005-02-04'),
('Sim', 26.90, 4, '2021-10-13'),
('Não', 13.90, 5, DEFAULT),
('Não', 60.23, 6, DEFAULT),
('Sim', 18.90, 7, ' 2005-02-03');

SELECT * FROM compra;

INSERT INTO editora (nome, telefone) VALUES 
('Rocco', '202-555-0171'),
('Zahar', '242-555-0171'),
('Intriseca', '202-555-0154');

SELECT * FROM editora;

INSERT INTO genero (genero) VALUES 
('Fantasia'),
('Mistério'),
('Aventura'),
('Suspense');

SELECT * FROM genero;

INSERT INTO livros (titulo, FK_genero, numero_paginas, FK_autor, FK_editora, FK_avaliacao, data_publicacao) VALUES 
('Harry Potter e a Ordem da Fênix', 1, 798, 1, 1, 2, '2005-08-20'),
('Arsene Lupin Contra Sherlock Holmes', 2, 188, 2, 2, 4, '2021-08-10'),
('Harry Potter e o Prisioneiro de Azkaban', 1, 598, 1, 1, 4, '1999-07-08'),
('Sherlock Holmes e o Signo dos Quatro', 3, 412, 3, 3, 1, '2002-03-02'),
('Harry Potter e as Relíquias da Morte ', 1, 368, 1, 1, 3, '2007-02-03'),
('Garota Exemplar', 4, 128, 4, 3, 5, '2009-02-12'),
('Harry Potter e o Cálice de Fogo', 1, 368, 1, 1, 3, '2005-10-11');

SELECT * FROM livros;