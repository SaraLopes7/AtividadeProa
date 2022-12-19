
USE hawkings;

ALTER TABLE moradores ADD Id_endereco TINYINT NOT NULL;

ALTER TABLE moradores ADD CONSTRAINT fk_Id_endereco FOREIGN KEY (Id_endereco) REFERENCES lugares (Id_endereco);


-- Segunda tabela 

CREATE TABLE IF NOT EXISTS lugares (
	CEP VARCHAR (9) NOT NULL,
    UF CHAR (2) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    bairro VARCHAR (45) NOT NULL,
    logradouro VARCHAR(60) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR (45),
	Id_endereco TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

DESCRIBE lugares;