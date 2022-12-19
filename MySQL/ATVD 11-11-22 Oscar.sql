
/*
CREATE TABLE IF NOT EXISTS `oscar` ( 
`id` INT(11) AUTO_INCREMENT PRIMARY KEY,
`year_film` INT(4) NOT NULL,
`year_ceremony` INT(4) NOT NULL,
`ceremony` INT(4) NOT NULL,
`category` VARCHAR(255) NOT NULL,
`name` VARCHAR(255) NOT NULL,
`film` VARCHAR(255) NOT NULL,
`winner` VARCHAR(255) NOT NULL);
*/ 

-- 1 - Quantas vezes Natalie Portman foi indicada ao Oscar? -- 3 

SELECT COUNT(*) FROM oscar WHERE `name` = 'Natalie Portman'; 

-- 2 - Quantos Oscars Natalie Portman ganhou? -- 1

SELECT COUNT(*) FROM oscar WHERE `name` = 'Natalie Portman'  AND `winner` = 'True';

-- 3 - Amy Adams já ganhou algum Oscar?  -- NÃO 

SELECT COUNT(*) FROM oscar WHERE `name` = 'Amy Adams' AND `winner` = 'True';

-- 4 - Alguém já ganhou um Oscar e tem o seu primeiro nome?  -- NÃO 

-- SELECT `name`, `winner` FROM oscar WHERE `name` LIKE 'Amy %'; CONFERINDO MANUALMENTE 
SELECT `name`, `winner` FROM oscar WHERE `name` LIKE 'Amy %' AND `winner` = 'True'; 

-- 5 - Toy Story 3 ganhou um Oscar em quais anos? -- 2011

SELECT `film`, `year_ceremony` FROM oscar WHERE `film` = 'Toy Story 3' AND  `winner` = 'True';

-- 6 - Quem tem mais Oscars: a categoria "Melhor Ator" ou "Melhor Filme"? -- MELHOR FILME 

SELECT COUNT(`category`) FROM oscar WHERE `category` = 'ACTOR IN A LEADING ROLE' AND  `winner` = 'True'; -- 44
SELECT COUNT(`category`) FROM oscar WHERE `category` = 'BEST PICTURE' AND  `winner` = 'True'; -- 59

-- 7 - O primeiro Oscar para melhor Atriz foi para quem? Em que ano? -- EMIL JANNINGS 

SELECT `name`, `year_ceremony` FROM oscar WHERE `winner` = 'True' AND `category` = 'ACTOR' ORDER BY `year_ceremony`; 

-- 8 - Na categoria Winner, altere todos os valores com "True" para 1 e todos os valores "False" para 0.

UPDATE oscar SET `winner` = '1' WHERE `winner` = 'True';
UPDATE oscar SET `winner` = '0' WHERE `winner` = 'False';

-- 9 - Em qual edição do Oscar "Crash" ganhou o prêmio? -- 2006

SELECT `film`, `year_ceremony` FROM oscar WHERE `film` = 'Crash' AND  `winner` = '1';

-- 10 - Que filme merecia ganhar um Oscar e não ganhou? -- 1917

SELECT `film` FROM oscar WHERE `winner` = '0' order by `film`;

-- 11 - Bom... dê um Oscar para esse filme, então.

UPDATE oscar SET `winner` = '1' WHERE `film` = '1917';

-- 12 - O filme Central do Brasil aparece no Oscar? -- SIM, MAS N GANHOU

SELECT `film`,`category`, `winner` FROM oscar WHERE `film` = 'Central Station';

-- 13 - Inclua no banco 7 filmes que nunca nem foram nomeados ao Oscar, mas que na sua opinião, merecem.

INSERT INTO oscar (`year_film`, `year_ceremony`, `ceremony`, `category`, `name`, `film`, `winner`) VALUES
(2020, 2021, 93, 'Melhores efeitos visuais', 'Christopher Nolan', 'Tenet', '1'),
(2021, 2022, 94, 'Melhor filme', 'Reinaldo Marcus Green', 'King Richard: Criando Campeãs', '1'),
(2010, 2011, 83, 'Melhor filme', 'Chris Sanders, Dean DeBlois', 'Como Treinar o Seu Dragão', '1'),
(2022, 2023, 95, 'Melhor filme', 'Scott Derrickson', 'The Black phone', '1'),
(2022, 2023, 95, 'Melhor filme', 'Joseph Kosinski', 'Top Gun: Maverick', '1'),
(2010, 2011, 83, 'Melhores efeitos visuais', 'Christopher Nolan', 'A Origem', '1'),
(2009, 2010, 82, 'Melhor filme', 'Quentin Tarantino', 'Bastardos Inglórios', '1');

INSERT INTO oscar (`film`)VALUES
('Tenet'),
('King Richard: Criando Campeãs'),
('Como Treinar o Seu Dragão'),
('The Black phone'),
('Top Gun: Maverick'),
('A Origem'),
('Bastardos Inglórios');

-- 14 - Crie uma nova categoria de premiação. Qualquer prêmio que você queira dar. Agora vamos dar esses prêmios aos filmes que você cadastrou na questão acima.

ALTER TABLE oscar ADD `Campeões_do_coração` VARCHAR (30);
DESCRIBE oscar;

UPDATE oscar SET `Campeões_do_coração` = 'CHAMPIONS' WHERE `film` = 'Tenet';
UPDATE oscar SET `Campeões_do_coração` = 'CHAMPIONS' WHERE `film` = 'King Richard: Criando Campeãs';
UPDATE oscar SET `Campeões_do_coração` = 'CHAMPIONS' WHERE `film` = 'Como Treinar o Seu Dragão';
UPDATE oscar SET `Campeões_do_coração` = 'CHAMPIONS' WHERE `film` = 'he Black phone';
UPDATE oscar SET `Campeões_do_coração` = 'CHAMPIONS' WHERE `film` = 'Top Gun: Maverick';
UPDATE oscar SET `Campeões_do_coração` = 'CHAMPIONS' WHERE `film` = 'A Origem';
UPDATE oscar SET `Campeões_do_coração` = 'CHAMPIONS' WHERE `film` = 'Bastardos Inglórios';

SELECT `film`, `Campeões_do_coração` FROM oscar ORDER BY `Campeões_do_coração` DESC;

-- 15 - Qual foi o primeiro ano a ter um prêmio do Oscar? -- 1928

SELECT `category`, `year_ceremony` FROM oscar ORDER BY `year_ceremony`;

-- 16 - Pensando no ano em que você nasceu: Qual foi o Oscar de melhor filme, Melhor Atriz e Melhor Diretor?

SELECT `film`, `year_ceremony` FROM oscar WHERE `year_ceremony`= '2003' AND `category` = 'BEST PICTURE' AND  `winner` = '1'; -- CHICAGO
SELECT `name`, `year_ceremony` FROM oscar WHERE `year_ceremony`= '2003' AND `category` = 'ACTRESS IN A LEADING ROLE' AND  `winner` = '1'; -- Nicole Kidman 
SELECT `name`, `year_ceremony` FROM oscar WHERE `year_ceremony`= '2003' AND `category` = 'DIRECTING' AND  `winner` = '1'; -- Roman Polanski 

-- 17 - Agora procure 7 atrizes que não sejam americanas, europeias ou brasileiras. Vamos cadastrá-los no nosso banco, mas eles ainda não ganharam o Oscar. Só foram nomeados.

INSERT INTO oscar (`category`, `name`, `winner`)VALUES
('ACTRESS IN A LEADING ROLE', 'Son Ye-jin', '0'),
('ACTRESS IN A LEADING ROLE', 'Lily Banda', '0'),
('ACTRESS IN A LEADING ROLE', 'Zoë Bell', '0'),
('ACTRESS IN A LEADING ROLE', 'Reika Kirishima', '0'),
('ACTRESS IN A LEADING ROLE', 'Florence Kasumba', '0'),
('ACTRESS IN A LEADING ROLE', 'Lupita Nyongo', '0'),
('ACTRESS IN A LEADING ROLE', 'Shaunette Renée Wilson', '0');
