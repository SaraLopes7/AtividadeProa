CREATE DATABASE crud_python;
drop database crud_python;

USE crud_python;

CREATE TABLE IF NOT EXISTS funcionarios (
	nome VARCHAR (80) NOT NULL,
    CPF VARCHAR (14) NOT NULL PRIMARY KEY,
    telefone VARCHAR (14) NOT NULL UNIQUE, -- Exemplo: (81) 995481296
    salario DECIMAL (7,2) NOT NULL,
    endereco VARCHAR (45) NOT NULL
);

CREATE TABLE IF NOT EXISTS tec_administrativo (
	id_tec_administrativo TINYINT AUTO_INCREMENT PRIMARY KEY,
    setor VARCHAR (30) NOT NULL,
    FK_funcionarios TINYINT NOT NULL -- mesmo tipo da pk de funcionarios 
);

ALTER TABLE tec_administrativo ADD FOREIGN KEY (FK_funcionarios) REFERENCES funcionarios (CPF);

CREATE TABLE IF NOT EXISTS professor (
	id_professor TINYINT AUTO_INCREMENT PRIMARY KEY,
    titulacao VARCHAR (60) NOT NULL,
    area_formacao VARCHAR (60) NOT NULL,
    FK_curso TINYINT NOT NULL, -- mesmo tipo da pk de curso 
    FK_disciplina TINYINT NOT NULL, -- mesmo tipo da pk de disciplina 
    FK_funcionarios TINYINT NOT NULL -- mesmo tipo da pk de funcionarios 
);

ALTER TABLE professor ADD FOREIGN KEY (FK_curso) REFERENCES curso (id_curso);
ALTER TABLE professor ADD FOREIGN KEY (FK_disciplina) REFERENCES disciplina (id_disciplina);
ALTER TABLE professor ADD FOREIGN KEY (FK_funcionarios) REFERENCES funcionarios (CPF);

CREATE TABLE IF NOT EXISTS aluno (
	nome VARCHAR (80) NOT NULL, 
    matricula TINYINT,
    CPF VARCHAR (14) NOT NULL PRIMARY KEY,
	FK_curso TINYINT NOT NULL, -- mesmo tipo da pk de curso 
    FK_disciplina TINYINT NOT NULL -- mesmo tipo da pk de disciplina 
);

ALTER TABLE aluno ADD FOREIGN KEY (FK_curso) REFERENCES curso (id_curso);
ALTER TABLE aluno ADD FOREIGN KEY (FK_disciplina) REFERENCES disciplina (id_disciplina);

CREATE TABLE IF NOT EXISTS curso (
	id_curso TINYINT AUTO_INCREMENT PRIMARY KEY,
    nomeCurso VARCHAR (60) NOT NULL, 
    duracao INT (04) NOT NULL,
    FK_professor TINYINT NOT NULL, -- mesmo tipo da pk de professor
    FK_disciplina TINYINT NOT NULL, -- mesmo tipo da pk de disciplina 
    FK_aluno VARCHAR (14) NOT NULL -- mesmo tipo da pk de aluno 
);

drop table curso;
select * from curso;
ALTER TABLE curso ADD FOREIGN KEY (FK_professor) REFERENCES professor (id_professor);
ALTER TABLE curso ADD FOREIGN KEY (FK_disciplina) REFERENCES disciplina (id_disciplina);
ALTER TABLE curso ADD FOREIGN KEY (FK_aluno) REFERENCES aluno (id_aluno);

CREATE TABLE IF NOT EXISTS disciplina (
	id_disciplina TINYINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (60) NOT NULL, 
    carga_horaria INT (04) NOT NULL,
    FK_professor TINYINT NOT NULL, -- mesmo tipo da pk de professor
    FK_curso TINYINT NOT NULL, -- mesmo tipo da pk de curso 
    FK_aluno VARCHAR (14) NOT NULL -- mesmo tipo da pk de aluno 
);

ALTER TABLE disciplina ADD FOREIGN KEY (FK_professor) REFERENCES professor (id_professor);
ALTER TABLE disciplina ADD FOREIGN KEY (FK_curso) REFERENCES curso (id_curso);
ALTER TABLE disciplina ADD FOREIGN KEY (FK_aluno) REFERENCES aluno (id_aluno);

