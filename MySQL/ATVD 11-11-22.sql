/* Analise a seguinte descrição e extraia dela os requisitos para o banco de dados:

O hospital necessita de um sistema para sua área clínica que ajude a controlar consultas realizadas. 
Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em planilhas digitais. 
Cada médico pode ter uma ou mais especialidades, que podem ser pediatria, clínica geral, gastroenterologia e dermatologia. 
Alguns registros antigos ainda estão em formulário de papel, mas será necessário incluir esses dados no novo sistema.
Os pacientes também precisam de cadastro, contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e convênio. 
Para cada convênio, são registrados nome, CNPJ e tempo de carência.
As consultas também têm sido registradas em planilhas, com data e hora de realização, médico responsável, paciente, valor da consulta ou nome do convênio, com o número da carteira. 
n Também é necessário indicar na consulta qual a especialidade buscada pelo paciente.

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
    especialidade1 VARCHAR (30) NOT NULL,
    especialidade2 VARCHAR (30) DEFAULT ' '
);

CREATE TABLE IF NOT EXISTS paciente (
	id_paciente TINYINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR (60) NOT NULL,
	nome_social VARCHAR (60),
    data_nasc DATE NOT NULL, 
    telefone VARCHAR (15),
    email VARCHAR (45) UNIQUE NOT NULL, 
    CPF CHAR (14) UNIQUE NOT NULL,
    RG CHAR(13) UNIQUE NOT NULL,
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
	CNPJ CHAR (19) NOT NULL,
	tempo_carencia VARCHAR (10) NOT NULL
);

CREATE TABLE IF NOT EXISTS consulta (
	id_consulta TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	data_realização DATETIME NOT NULL,
	valor_consulta DECIMAL (6,2) NOT NULL,
    receituario VARCHAR (60),
	FK_id_convenio TINYINT,
	FK_id_medico TINYINT,
	FK_id_paciente TINYINT
);
-- Eu não enetndi o que seria o "numero da carteira"

ALTER TABLE consulta ADD CONSTRAINT FK_id_convenio FOREIGN KEY(FK_id_convenio) REFERENCES convenio(id_convenio);
ALTER TABLE consulta ADD CONSTRAINT FK_id_medico FOREIGN KEY(FK_id_medico) REFERENCES medico(id_medico);
ALTER TABLE consulta ADD CONSTRAINT FK_id_paciente FOREIGN KEY(FK_id_paciente) REFERENCES paciente(id_paciente);

CREATE TABLE IF NOT EXISTS pessoas (
	id_pessoas TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FK_id_medico TINYINT,
    FK_id_paciente TINYINT
);

ALTER TABLE pessoas ADD CONSTRAINT FK_id_medico FOREIGN KEY(FK_id_medico) REFERENCES medico(id_medico);
ALTER TABLE pessoas ADD CONSTRAINT FK_id_paciente FOREIGN KEY(FK_id_paciente) REFERENCES paciente(id_paciente);

CREATE TABLE IF NOT EXISTS tipo_quarto (
	id_tipo_quarto TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR (45),
    valor_diaria DECIMAL (6,2)
);

CREATE TABLE IF NOT EXISTS quarto (
	id_quarto TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero INT UNIQUE NOT NULL,
    FK_id_tipo_quarto TINYINT
);

ALTER TABLE quarto ADD CONSTRAINT FK_id_tipo_quarto FOREIGN KEY (FK_id_tipo_quarto) REFERENCES tipo_quarto (id_tipo_quarto);

CREATE TABLE IF NOT EXISTS internacao (
	id_internacao TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_entrada DATE NOT NULL,
    data_prev_alta DATE NOT NULL,
    data_alta DATE,
    procedimento VARCHAR (45) NOT NULL,
    FK_id_quarto TINYINT,
    FK_id_enfermeiro1 TINYINT,
    FK_id_enfermeiro2 TINYINT,
    FK_id_paciente TINYINT,
    FK_id_medico TINYINT
);

ALTER TABLE internacao ADD CONSTRAINT FK_id_quarto FOREIGN KEY(FK_id_quarto) REFERENCES quarto (id_quarto);
ALTER TABLE internacao ADD CONSTRAINT FK_id_enfermeiro1 FOREIGN KEY(FK_id_enfermeiro1) REFERENCES enfermeiro (id_enfermeiro);
ALTER TABLE internacao ADD CONSTRAINT FK_id_enfermeiro2 FOREIGN KEY(FK_id_enfermeiro2) REFERENCES enfermeiro (id_enfermeiro);
ALTER TABLE internacao ADD CONSTRAINT FK_id_paciente FOREIGN KEY(FK_id_paciente) REFERENCES paciente (id_paciente);
ALTER TABLE internacao ADD CONSTRAINT FK_id_medico FOREIGN KEY(FK_id_medico) REFERENCES medico (id_medico);   


CREATE TABLE IF NOT EXISTS enfermeiro (
	id_enfermeiro TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (60) NOT NULL,
    CPF VARCHAR (14) UNIQUE NOT NULL,
    CRE VARCHAR (13) NOT NULL
);

CREATE VIEW consulta_paciente AS 
SELECT c.id_consulta, c.data_realização, c.valor_consulta, p.nome 'Paciente', cv.nome 'Convenio', m.nome 'Medico'
	FROM consulta AS c
		JOIN convenio AS cv ON id_consulta = id_convenio
		JOIN paciente AS p ON id_convenio = id_paciente
		JOIN pessoas AS pe ON id_paciente = id_pessoas
        JOIN medico AS m ON id_pessoas = id_medico
            ORDER BY cv.nome; 
            
DESCRIBE medico;
DESCRIBE paciente;
DESCRIBE endereco;
DESCRIBE convenio;
DESCRIBE consulta;
DESCRIBE pessoas;
DESCRIBE consulta_paciente;

/*
PRECISA DE:
* 10 MÉDICOS 
* 15 PACIENTES 
* 20 CONSULTAS (ocorridas entre 01/01/2015 e 01/01/2022) E (Ao menos dez consultas devem ter receituário com dois ou mais medicamentos)
* Inclua ao menos 4 convênios médicos, associe ao menos 5 pacientes e 5 consultas.
* 7 INTERNAÇÕES (Pelo menos dois pacientes devem ter se internado mais de uma vez. Ao menos três quartos devem ser
cadastrados. As internações devem ter ocorrido entre 01/01/2015 e 01/01/2022.)
* Considerando que “a princípio o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes.
10 ENFERMEIROS ( Associe cada internação a ao menos dois enfermeiros.)

Os dados de tipo de quarto, convênio e especialidade são essenciais
para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado.
*/


-- INSERINDO DADOS 

INSERT INTO medico (id_medico, nome, CPF, CRM, email, nome_social, cargo, especialidade1, especialidade2) VALUES 
(DEFAULT, 'Luan Martins', '308.364.180-00', 'CRM/PE 123456', 'nohoc64361@kixotic.com', 'luana Martins', 'Generalista', 'Pediatria', DEFAULT),
(DEFAULT, 'Miguel Goncalves', '678.967.650-39', 'CRM/ES 123123', 'kekih28372@jernang.com', DEFAULT, 'Especialista', 'Cirurgia Geral', 'Gastroenterologia'),
(DEFAULT, 'Vitoria Silva', '216.377.530-55', 'CRM/RO 456456', 'bofoxem803@klblogs.com', DEFAULT, 'Residente', 'Clínica Geral', DEFAULT),
(DEFAULT, 'Bruna Araujo', '552.131.210-20', 'CRM/AM 789456', 'kiwovi9991@klblogs.com', DEFAULT, 'Generalista', 'Dermatologia', DEFAULT),
(DEFAULT, 'Renan Alves', '723.336.180-00', 'CRM/RJ 325984', 'rifimi9567@invodua.com', DEFAULT, 'Residente', 'Dermatologia', DEFAULT),
(DEFAULT, 'Ágatha Pereira', '947.985.070-24', 'CRM/MA 024589', 'yelikor735@kixotic.com', DEFAULT, 'Generalista', 'Oftalmologia', DEFAULT),
(DEFAULT, 'Emily Souza', '813.864.920-86', 'CRM/MG 328756', 'cagowib347@klblogs.com', DEFAULT, 'Especialista', 'Cirurgia Geral', 'Neurocirurgia'),
(DEFAULT, 'Douglas Gomes', '080.782.930-70', 'CRM/SC 301576', 'fayawa9505@kixotic.com', DEFAULT, 'Generalista', 'Pneumologia', DEFAULT),
(DEFAULT, 'Anna Dias', '819.804.950-92', 'CRM/PE 975236', 'lalarob944@invodua.com', 'Felipe Dias', 'Especialista', 'Cirurgia Geral', 'Psiquiatria'),
(DEFAULT, 'Caio Barros', '860.022.590-66', 'CRM/SP 241589', 'mekef11324@kixotic.com', DEFAULT, 'Generalista', 'Cardiologia', DEFAULT);

SELECT * FROM medico;

INSERT INTO paciente (id_paciente, nome, nome_social, data_nasc, telefone, email, CPF, RG, FK_id_endereco, FK_id_convenio) VALUES 
(DEFAULT, 'Júlia Ferreira Melo', DEFAULT, '1978-12-02', '(49) 2381-3480', 'tanefo1486@lidely.com', '660.235.480-91', '49.844.669-4', 1, 1),
(DEFAULT, 'Douglas Costa Barros', DEFAULT, '1980-11-11', '(94) 2816-3228', 'mogaj23299@pamaweb.com', '686.698.190-58', '37.740.162-6', 2, 2),
(DEFAULT, 'James D. Britt', 'Dalila Brit', '1979-10-25', '(86) 2735-7268', 'yinefa5231@lance7.com', '534.595.090-31', '13.148.780-2', 3, 3),
(DEFAULT, 'Nicolette Lamare', DEFAULT, '1985-09-19', '(69) 2013-5455', 'bafir47456@lidely.com', '028.470.110-64', '46.801.248-5', 4, 4),
(DEFAULT, 'Edmee Langelier', DEFAULT, '2000-08-04', '(13) 3165-4254', 'yinedoj815@pamaweb.com', '846.481.710-04', '46.144.237-1', 5, 5),
(DEFAULT, 'Marsilius Batard', DEFAULT, '2007-07-13', '(88) 3127-3661', 'xebes80663@lidely.com', '658.949.970-54', '18.471.510-6', 6, 1),
(DEFAULT, 'Dai Yang', DEFAULT, '2002-06-20', '(84) 2441-2173', 'cabevex939@lance7.com', '678.949.970-54', '12.002.002-6', 7, 2),
(DEFAULT, 'Ute Dietrich', DEFAULT, '2003-05-15', '(87) 3854-1152', 'ximod28402@pamaweb.com', '424.600.190-25', '11.673.790-6', 8, 3),
(DEFAULT, 'Uwe Baier', DEFAULT, '1992-04-07', '(54) 2411-5823', 'nofon23053@pamaweb.com', '296.028.920-05', '46.558.216-3', 9, 4),
(DEFAULT, 'Lee Tsao', 'Liana Tsao', '1997-03-01', '(18) 2733-0648', 'jivac49151@lidely.com', '778.289.660-67', '38.205.257-2', 10, 5),
(DEFAULT, 'Etienne Rossen', DEFAULT, '1974-02-28', '(19) 3222-9681', 'datopeb809@lance7.com', '207.880.770-23', '23.076.483-6', 11, 1),
(DEFAULT, 'Qiong Yang', DEFAULT, '1959-01-30', '(99) 3072-0282', 'hecawid247@pamaweb.com', '754.674.530-68', '25.530.396-8', 12, 2),
(DEFAULT, 'Rommy van Vianen', 'Rowana Vianen', '2001-11-16', '(67) 2735-9138', 'dicis21807@lidely.com', '909.225.880-66', '', 13, 3),
(DEFAULT, 'Mansour Hoang', DEFAULT, '1981-07-20', '(63) 2408-3391', 'fexob66533@pamaweb.com', '182.058.620-01', '38.491.720-3', 14, 4),
(DEFAULT, 'Sying Ma', DEFAULT, '1999-03-23', '(74) 2122-8146', 'rivif79189@lance7.com', '570.280.290-00', '24.791.025-9', 15, 5);

SELECT * FROM paciente;

INSERT INTO endereco (CEP, UF, cidade, bairro, logradouro, numero, complemento, id_endereco, FK_id_paciente) VALUES
("54771680","PE", "Camaragibe", "Alberto Maia", "Av. Doutor Luiz Ignacio De Andrade Lima Neto", 397, DEFAULT, DEFAULT, 1),
("50660010","PE", "Recife", "Torrões", "Rua Arnica", 97, "Bloco 16, apartamento 201", DEFAULT, 2),     
("56761650","PE", "Olinda", "Alto Da Sé", "Rua cinco de maio", 457, DEFAULT, DEFAULT, 3),
("59543782","PE", "Jaboatão dos Guararapes", "Cavaleiro", "Rua do marujo", 876, DEFAULT, DEFAULT, 4),
("76895046","PE", "Jaboatão dos Guararapes ", "Piedade", "Av. Guilherme macedo", 4321, "Bloco A5, apartamento 203", DEFAULT, 5),
("89657659","PE", "Olinda ", "Bairro Novo", "Rua São januario", 120, DEFAULT, DEFAULT, 6),
("87643763","PE", "Recife ", "Ipsep", "Rua marquês", 785, DEFAULT, DEFAULT, 7),
("43536478","PE", "Olinda ", "Carmo", "Av. Brasil", 122, DEFAULT, DEFAULT, 8),
("76476483","PE", "Olinda ", "Peixinhos", "Av. real", 372, DEFAULT, DEFAULT, 9),
("21049348","PE", "Recife ", "Boa Viagem", "Av. Boa viagem", 647, DEFAULT, DEFAULT, 10),
("10293284","PE", "Recife ", "Pina", "Av. santo abel", 789, DEFAULT, DEFAULT, 11),
("97087856","PE", "Jaboatão dos Guararapes", "Candeias", "Rua ilheus", 4893, DEFAULT, DEFAULT, 12),
("78163764","PE", "Olinda ", "Rio Doce", "Rua leonino", 4373, DEFAULT, DEFAULT, 13),
("10210283","PE", "Jaboatão dos Guararapes ", "Prazeres", "Rua Peixinhos", 4565, DEFAULT, DEFAULT, 14),
("05403584","PE", "Olinda ", "Sítio Novo", "Rua Libra", 1327, DEFAULT, DEFAULT, 15);

SELECT * FROM endereco;

INSERT INTO consulta (id_consulta, data_realização, valor_consulta, receituario, FK_id_convenio, FK_id_medico, FK_id_paciente) VALUES 
(DEFAULT, '2015-01-01 01:20:11', 7561.10, 'Aciclovir, Albuterol, Primidona', 1, 1, 1),
(DEFAULT, '2016-02-02 02:19:12', 298.57, 'Aspirina, Galantamina', 2, 2, 2),
(DEFAULT, '2017-03-03 03:18:13', 5249.71, DEFAULT, 3, 3, 3),
(DEFAULT, '2018-04-04 04:17:14', 8246.91, 'Disopiramida, Fentanila, Primidona', 4, 4, 4),
(DEFAULT, '2019-05-05 05:16:15', 386.15, DEFAULT, 5, 5, 5),
(DEFAULT, '2020-06-06 06:15:16', 418.69, 'Sulfato ferroso', 1, 6, 6),
(DEFAULT, '2021-07-07 07:14:17', 326.44, 'Bleomicina, Bisoprolol, Nistatina', 2, 7, 7),
(DEFAULT, '2015-08-08 08:13:18', 79.42, DEFAULT, 3, 8, 8),
(DEFAULT, '2016-09-09 09:12:19', 3115.59, DEFAULT, 4, 9, 9),
(DEFAULT, '2017-10-10 10:11:20', 4678.46, 'Aspirina, Bleomicina, Cefprozil', 5, 10, 10),
(DEFAULT, '2018-11-11 11:10:21', 2759.57, DEFAULT, 1, 1, 11),
(DEFAULT, '2019-12-12 12:09:22', 1475.49, 'Epinefrina, Doxiciclina, Midodrina', 2, 2, 12),
(DEFAULT, '2020-01-13 13:08:23', 1678.18, DEFAULT, 3, 3, 13),
(DEFAULT, '2021-02-14 14:07:24', 7517.51, DEFAULT, 4, 4, 14),
(DEFAULT, '2015-03-15 15:06:25', 9866.53, 'Aspirina, Entecavir', 5, 5, 15),
(DEFAULT, '2016-04-16 16:05:26', 74.54, DEFAULT, 1, 6, 3),
(DEFAULT, '2017-05-17 17:04:27', 2868.45, 'Bisoprolol, Cetoprofeno, Lidocaína', 2, 7, 7),
(DEFAULT, '2018-06-18 18:03:28', 5531.43, 'Bleomicina, Indapamida', 3, 8, 13),
(DEFAULT, '2019-07-19 19:02:29', 7779.42, 'Aspirina, Cefprozil', 4, 9, 5),
(DEFAULT, '2020-08-20 20:01:30', 3337.93, 'Nistatina', 5, 10, 11);

SELECT * FROM consulta;

INSERT INTO convenio (id_convenio, nome, CNPJ, tempo_carencia) VALUES 
(DEFAULT, 'SulAmérica', '21.861.038/0001-29', '300 dias'),
(DEFAULT, 'NotreDame Intermédica', '44.884.378/0001-70', '180 dias'),
(DEFAULT, 'Prevent Senior', '40.287.069/0001-62', '30 dias'),
(DEFAULT, 'Hapvida Saúde', '86.987.064/0001-43', '180 dias'),
(DEFAULT, 'Central Nacional Unimed', '09.044.440/0001-15', '300 dias');

SELECT * FROM convenio;

INSERT INTO tipo_quarto(id_tipo_quarto, descricao, valor_diaria) VALUES 
(DEFAULT, 'Apartamento', 7634.14),
(DEFAULT, 'Quarto duplo', 2816.19),
(DEFAULT, 'Enfermaria', 726.85);

SELECT * FROM tipo_quarto;

INSERT INTO quarto(id_quarto, numero, FK_id_tipo_quarto) VALUES
(DEFAULT, 589, 1),
(DEFAULT, 462, 1),
(DEFAULT, 527, 2),
(DEFAULT, 296, 2),
(DEFAULT, 153, 2),
(DEFAULT, 324, 3),
(DEFAULT, 525, 3),
(DEFAULT, 684, 3),
(DEFAULT, 769, 3),
(DEFAULT, 571, 3);

SELECT * FROM quarto;

INSERT INTO internacao(id_internacao, data_entrada, data_prev_alta, data_alta, procedimento, FK_id_quarto, FK_id_enfermeiro1, FK_id_enfermeiro2, FK_id_paciente, FK_id_medico) VALUES
(DEFAULT, '2015-02-31', '2015-03-15', '2015-03-13', 'Colonoscopia', 1, 10, 3, 3, 6),
(DEFAULT, '2016-03-25', '2016-06-25', '2016-06-24', 'Drenagem Torácica', 2, 9, 2, 7, 1),
(DEFAULT, '2017-07-16', '2017-07-30', '2017-07-31', 'IOT', 3, 8, 1, 11, 3),
(DEFAULT, '2018-06-19', '2018-07-03', '2018-07-07', 'Cricostomia por Punção', 4, 7, DEFAULT, 13, 5),
(DEFAULT, '2019-08-28', '2019-09-29', '2019-09-20', 'Cateterismo Vesical', 5, 6, DEFAULT, 9, 7),
(DEFAULT, '2020-10-02', '2020-12-13', '2020-12-11', 'Acesso Venoso Central/Profundo', 6, 5, DEFAULT, 1, 9),
(DEFAULT, '2021-12-07', '2022-01-01', DEFAULT, 'Plasmaferese', 7, 4, DEFAULT, 15, 10);

SELECT * FROM internacao;

INSERT INTO enfermeiro (id_enfermeiro, nome, CPF, CRE) VALUES 
(DEFAULT, 'Theo Donaldson', '144.673.780-22', '3259.674.58'),
(DEFAULT, 'Khadija Johnston', '247.488.390-82', '5043.662.50'),
(DEFAULT, 'Anton Kely', '048.459.410-90', '9054.927.97'),
(DEFAULT, 'Radics Margo', '486.470.930-03', '0737.129.00'),
(DEFAULT, 'Fekete Gara', '548.814.910-40', '1421.271.05'),
(DEFAULT, 'Malou M. Poulsen', '828.017.300-50', '5487.744.84'),
(DEFAULT, 'Marie H. Krogh', '027.624.230-07', '8724.309.90'),
(DEFAULT, 'Aase Danielsen', '631.131.500-94', '3953.359.58'),
(DEFAULT, 'Kayley Kelly', '650.737.120-30', '8725.695.74'),
(DEFAULT, 'Marius T. Damgaard', '284.858.470-08', '9448.509.59');

SELECT * FROM enfermeiro;