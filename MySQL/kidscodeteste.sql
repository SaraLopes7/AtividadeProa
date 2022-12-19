CREATE DATABASE kidscodeteste;

drop database kidscodeteste;

USE kidscodeteste;

CREATE TABLE IF NOT EXISTS usuario (
	id_usuario TINYINT AUTO_INCREMENT PRIMARY KEY,
	fk_id_cadastro TINYINT NOT NULL
);

ALTER TABLE usuario ADD FOREIGN KEY (fk_id_cadastro) REFERENCES cadastro (id_cadastro);

CREATE TABLE IF NOT EXISTS cadastro (
	id_cadastro TINYINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR (80) NOT NULL,
	idade TINYINT NOT NULL,
    email VARCHAR(60) NOT NULL UNIQUE,
	senha VARCHAR(30) NOT NULL
);

INSERT INTO cadastro (nome, idade, email, senha)
VALUE ('Sara Lopes', 19, 'sariinha.lopes2003@gmail.com', 'batatinhafrita123');

SELECT * FROM cadastro;
SELECT * FROM usuario;