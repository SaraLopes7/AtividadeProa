CREATE DATABASE hawkings;

USE hawkings;

DROP DATABASE hawkings;

CREATE TABLE IF NOT EXISTS moradores (
	nome VARCHAR(60) UNIQUE NOT NULL,
    id_morador TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    CPF INT(14),
    telefone VARCHAR(15),
    idade TINYINT,
    profissao VARCHAR(50) NOT NULL
);

DESCRIBE moradores;

INSERT INTO moradores 
VALUES 	('Eleven', DEFAULT, '941.756.350-50', '(95) 98321-7661','14','Amiga e doida'),
		('Dustin Henderson', DEFAULT, '359.867.760-03','(82) 98146-5376','14','Ser o melhor em tudo'),
		('Eddie Munson', DEFAULT, '119.030.490-24','(54) 99976-6247','19','Protagonista da temporada'),
		('Steve Harrington', DEFAULT, '891.634.950-82','(68) 97663-1766','18','Babá'),
		('Will Byers', DEFAULT, '316.622.050-07','(97) 97244-6854','14','Sofrer'),
		('Mike', DEFAULT, '199.965.860-49','(93) 97932-6443','14','Incomodar'),
		('Robin Buckley', DEFAULT, '571.884.550-66','(93) 99814-2469','18','A maravilhosa'),
		('Erica Sinclar', DEFAULT, '720.491.110-53','(87) 98341-5013','10','A mais inteligente'),
		('Nancy Wheeler', DEFAULT, '224.033.370-72','(63) 98912-2681','17','Pistoleira'),
		('Jim Hopper', DEFAULT, '723.053.180-22','(44) 97568-2189','41','Xerife'),
        ('Lucas Sinclair', DEFAULT, '699.238.440-64', '(79) 98717-2256', '14', 'Reclamar');


SELECT * FROM moradores;

UPDATE moradores SET nome = 'Mike Wheeler' WHERE nome = 'Mike';
UPDATE moradores SET profissao = 'Reclamar' WHERE profissao = 'Reclamar muito';

DELETE FROM moradores WHERE id_morador = '11';
DELETE FROM moradores WHERE idade = '14';