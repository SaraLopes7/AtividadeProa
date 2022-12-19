/* 
Vamos elaborar um diagrama para uma seguradora de automóveis, tartarugas e encanamento residencial:
Entidades: Cliente, Apólice, Carro e Acidentes.

Requisitos:
a) Um cliente pode ter várias apólices (no mínimo uma);
b) Cada apólice somente dá cobertura a um carro, uma tartaruga ou uma residência;
c) Um carro, uma tartaruga, ou uma residência pode ter zero ou "n" registros de incidentes a ele.

Alguns atributos para começar a pensar:
a) Cliente: Número, Nome e Endereço;
b) Apólice: Número e Valor;
c) Carro: Registro e Marca;
d) Tartaruga: Nome, espécie;
e) Residência: endereço, tipo (casa, apartamento, comercial);
f) Incidente: Data, Hora e Local.
*/

CREATE DATABASE seguradora;

USE seguradora;

CREATE TABLE IF NOT EXISTS cliente (
	id_cliente TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (60) NOT NULL,
    endereco VARCHAR (60) NOT NULL,
    telefone VARCHAR (15) NOT NULL,
    fk_apolice TINYINT NOT NULL,
	CONSTRAINT fk_apolice FOREIGN KEY (fk_apolice) REFERENCES apolice (id_apolice)
);

CREATE TABLE IF NOT EXISTS apolice (
	id_apolice TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR (30) NOT NULL,
    valor DECIMAL (5,2) NOT NULL,
    fk_carro VARCHAR (10) NOT NULL,
	CONSTRAINT fk_carro FOREIGN KEY (fk_carro) REFERENCES carro (placa),
    fk_residencia VARCHAR (15) NOT NULL,
	CONSTRAINT fk_residencia FOREIGN KEY (fk_residencia) REFERENCES residencia (cnpj),
    fk_tartaruga INT (7) NOT NULL,
	CONSTRAINT fk_tartaruga FOREIGN KEY (fk_tartaruga) REFERENCES tartaruga (numero_serie)
);

CREATE TABLE IF NOT EXISTS carro (
	placa VARCHAR (10) NOT NULL PRIMARY KEY,
    marca VARCHAR (30) NOT NULL,
    registro INT (7) NOT NULL,
    fk_acidente TINYINT NOT NULL,
	CONSTRAINT fk_acidente FOREIGN KEY (fk_acidente) REFERENCES acidente (id_acidente)
);

CREATE TABLE IF NOT EXISTS tartaruga (
	nome VARCHAR (60) NOT NULL,
    especie VARCHAR (45) NOT NULL,
    numero_serie INT (7) NOT NULL PRIMARY KEY,
    fk_acidente TINYINT NOT NULL,
	CONSTRAINT fk_acidente FOREIGN KEY (fk_acidente) REFERENCES acidente (id_acidente)
);

CREATE TABLE IF NOT EXISTS residencia (
	endereco VARCHAR (60) NOT NULL,
    tipo VARCHAR (15) NOT NULL,
    cnpj VARCHAR (15) NOT NULL PRIMARY KEY,
    fk_acidente TINYINT NOT NULL,
	CONSTRAINT fk_acidente FOREIGN KEY (fk_acidente) REFERENCES acidente (id_acidente)
);

CREATE TABLE IF NOT EXISTS acidente (
	id_acidente TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    local_acidente VARCHAR (60) NOT NULL,
    data_acidente DATE NOT NULL,
    hora VARCHAR (15) NOT NULL
);