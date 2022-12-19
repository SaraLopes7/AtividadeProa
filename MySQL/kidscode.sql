CREATE DATABASE kidscode;

drop database kidscode;

USE kidscode;

CREATE TABLE IF NOT EXISTS usuarios (
	Id TINYINT AUTO_INCREMENT PRIMARY KEY,
	Nome VARCHAR (80) NOT NULL,
    Email VARCHAR(60) NOT NULL UNIQUE,
	Senha VARCHAR(30) NOT NULL,
    Idade TINYINT NOT NULL
);

INSERT INTO usuario (email, senha)
VALUE ('sariinha.lopes2003@gmail.com', 'batatinhafrita123');

SELECT * FROM usuarios;
