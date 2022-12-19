/* Analise a seguinte descrição e extraia dela os requisitos para o banco de dados:

O hospital necessita de um sistema para sua área clínica que ajude a controlar consultas realizadas. 
Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em planilhas digitais. 
Cada médico pode ter uma ou mais especialidades, que podem ser pediatria, clínica geral, gastroenterologia e dermatologia. 
Alguns registros antigos ainda estão em formulário de papel, mas será necessário incluir esses dados no novo sistema.
Os pacientes também precisam de cadastro, contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e convênio. 
Para cada convênio, são registrados nome, CNPJ e tempo de carência.
As consultas também têm sido registradas em planilhas, com data e hora de realização, médico responsável, paciente, valor da consulta ou nome do convênio, com o número da carteira. 
Também é necessário indicar na consulta qual a especialidade buscada pelo paciente.

Com isso, crie tabelas que atendam a todos os requisitos destacados acima (sem registros de dados ainda). */

CREATE DATABASE clinica;

USE clinica;

CREATE TABLE IF NOT EXISTS medico (
	id_medico TINYINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (60) NOT NULL,
    CPF CHAR (14) UNIQUE NOT NULL,
    CRM VARCHAR (13) UNIQUE NOT NULL,
    email VARCHAR (45) UNIQUE NOT NULL,
    nome_social VARCHAR (60),
	cargo VARCHAR (13) NOT NULL,
    FK_id_especialidade TINYINT
);

ALTER TABLE medico ADD CONSTRAINT FK_id_especialidade FOREIGN KEY(FK_id_especialidade) REFERENCES especialidade(id_especialidade);

CREATE TABLE IF NOT EXISTS especialidade (
	id_especialidade TINYINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (30) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS paciente (
	id_paciente TINYINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR (60) NOT NULL,
	nome_social VARCHAR (60),
    data_nasc DATE NOT NULL, 
    telefone VARCHAR (15),
    email VARCHAR (45) UNIQUE NOT NULL, 
    CPF CHAR (14) UNIQUE NOT NULL,
    RG CHAR(10) UNIQUE NOT NULL,
    FK_id_endereco TINYINT,
    FK_id_convenio TINYINT
);

ALTER TABLE paciente ADD CONSTRAINT FK_id_endereco FOREIGN KEY(FK_id_endereco) REFERENCES endereco(id_endereco);
ALTER TABLE paciente ADD CONSTRAINT FK_id_convenio FOREIGN KEY(FK_id_convenio) REFERENCES paciente(id_convenio);

CREATE TABLE IF NOT EXISTS endereco (
    id_endereco TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	CEP VARCHAR (9) NOT NULL,
    UF CHAR (2) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    bairro VARCHAR (45) NOT NULL,
    logradouro VARCHAR(60) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR (45),
    FK_id_paciente TINYINT
);

ALTER TABLE endereco ADD CONSTRAINT FK_id_paciente FOREIGN KEY(FK_id_paciente) REFERENCES paciente(id_paciente);

CREATE TABLE IF NOT EXISTS convenio (
	id_convenio TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR (60) NOT NULL,
	CNPJ CHAR (17) NOT NULL,
	tempo_carencia VARCHAR (10) NOT NULL,
	FK_id_paciente TINYINT
);

ALTER TABLE convenio ADD CONSTRAINT FK_id_paciente FOREIGN KEY(FK_id_paciente) REFERENCES paciente(id_paciente);

CREATE TABLE IF NOT EXISTS consulta (
	id_consulta TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	data_realização DATETIME NOT NULL,
	valor_consulta DECIMAL (6,2) NOT NULL,
	FK_id_convenio TINYINT,
	FK_id_medico TINYINT,
	FK_id_paciente TINYINT,
	FK_id_especialidade TINYINT
);
-- Eu não enetndi o que seria o "numero da carteira"

ALTER TABLE consulta ADD CONSTRAINT FK_id_convenio FOREIGN KEY(FK_id_convenio) REFERENCES convenio(id_convenio);
ALTER TABLE consulta ADD CONSTRAINT FK_id_medico FOREIGN KEY(FK_id_medico) REFERENCES medico(id_medico);
ALTER TABLE consulta ADD CONSTRAINT FK_id_paciente FOREIGN KEY(FK_id_paciente) REFERENCES paciente(id_paciente);
ALTER TABLE consulta ADD CONSTRAINT FK_id_especialidade FOREIGN KEY(FK_id_especialidade) REFERENCES especialidade(id_especialidade);

CREATE TABLE IF NOT EXISTS pessoas (
	id_pessoas TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FK_id_medico TINYINT,
    FK_id_paciente TINYINT
);

ALTER TABLE pessoas ADD CONSTRAINT FK_id_medico FOREIGN KEY(FK_id_medico) REFERENCES medico(id_medico);
ALTER TABLE pessoas ADD CONSTRAINT FK_id_paciente FOREIGN KEY(FK_id_paciente) REFERENCES paciente(id_paciente);

CREATE VIEW consulta_paciente AS 
SELECT c.id_consulta, c.data_realização, c.valor_consulta, p.nome 'Paciente', cv.nome 'Convenio', m.nome 'Medico', e.nome 'Especialidade'
	FROM consulta AS c
		JOIN convenio AS cv ON id_consulta = id_convenio
		JOIN paciente AS p ON id_convenio = id_paciente
		JOIN pessoas AS pe ON id_paciente = id_pessoas
        JOIN medico AS m ON id_pessoas = id_medico
        JOIN especialidade AS e ON id_medico = id_especialidade
            ORDER BY cv.nome; 
            
DESCRIBE medico;
DESCRIBE especialidade;
DESCRIBE paciente;
DESCRIBE endereco;
DESCRIBE convenio;
DESCRIBE consulta;
DESCRIBE pessoas;
DESCRIBE consulta_paciente;

/*
PRECISA DE:
10 MÉDICOS 
15 PACIENTES 
20 CONSULTAS (ocorridas entre 01/01/2015 e 01/01/2022) E (Ao menos dez consultas devem ter receituário com dois ou mais medicamentos)
Inclua ao menos 4 convênios médicos, associe ao menos 5 pacientes e 5 consultas.
7 INTERNAÇÕES (Pelo menos dois pacientes devem ter se internado mais de uma vez. Ao menos três quartos devem ser
cadastrados. As internações devem ter ocorrido entre 01/01/2015 e 01/01/2022.)
Considerando que “a princípio o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes.
10 ENFERMEIROS ( Associe cada internação a ao menos dois enfermeiros.)

Os dados de tipo de quarto, convênio e especialidade são essenciais
para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado.
*/


-- INSERINDO DADOS 

INSERT INTO especialidade (id_especialidade, nome)
VALUES (DEFAULT, 'Pediatria'),
(DEFAULT, 'Clínica Geral'),
(DEFAULT, 'Gastroenterologia'),
(DEFAULT, 'Dermatologia'),
(DEFAULT, 'Neurocirurgia'),
(DEFAULT, 'Dermatologia'),
(DEFAULT, 'Psiquiatria'),
(DEFAULT, 'Pneumologia'),
(DEFAULT, 'Oftalmologia'),
(DEFAULT, 'Cardiologia'),
(DEFAULT, 'Cirurgia Geral');

INSERT INTO medicos (id_medico, nome, CPF, CRM, email, nome_social, cargo, especialidade1, especialidade2)
VALUES (DEFAULT, 'Luan Martins', '308.364.180-00', 'CRM/PE 123456', 'nohoc64361@kixotic.com', 'luana Martins', 'Generalista', 'Pediatria', DEFAULT),
(DEFAULT, 'Miguel Goncalves', '678.967.650-39', 'CRM/ES 123123', 'kekih28372@jernang.com', DEFAULT, 'Especialista', 'Cirurgia Geral', 'Gastroenterologia'),
(DEFAULT, 'Vitoria Silva', '216.377.530-55', 'CRM/RO 456456', 'bofoxem803@klblogs.com', DEFAULT, 'Residente', 'Clínica Geral', DEFAULT),
(DEFAULT, 'Bruna Araujo', '552.131.210-20', 'CRM/AM 789456', 'kiwovi9991@klblogs.com', DEFAULT, 'Generalista', 'Dermatologia', DEFAULT),
(DEFAULT, 'Renan Alves', '723.336.180-00', 'CRM/RJ 325984', 'rifimi9567@invodua.com', DEFAULT, 'Residente', 'Dermatologia', DEFAULT),
(DEFAULT, 'Ágatha Pereira', '947.985.070-24', 'CRM/MA 024589', 'yelikor735@kixotic.com', DEFAULT, 'Generalista', 'Oftalmologia', DEFAULT),
(DEFAULT, 'Emily Souza', '813.864.920-86', 'CRM/MG 328756', 'cagowib347@klblogs.com', DEFAULT, 'Especialista', 'Cirurgia Geral', 'Neurocirurgia'),
(DEFAULT, 'Douglas Gomes', '080.782.930-70', 'CRM/SC 301576', 'fayawa9505@kixotic.com', DEFAULT, 'Generalista', 'Pneumologia', DEFAULT),
(DEFAULT, 'Anna Dias', '819.804.950-92', 'CRM/PE 975236', 'lalarob944@invodua.com', 'Felipe Dias', 'Especialista', 'Cirurgia Geral', 'Psiquiatria'),
(DEFAULT, 'Caio Barros', '860.022.590-66', 'CRM/SP 241589', 'mekef11324@kixotic.com', DEFAULT, 'Generalista', 'Cardiologia', DEFAULT);
