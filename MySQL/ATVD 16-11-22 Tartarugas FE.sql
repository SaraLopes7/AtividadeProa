-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema seguradora
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema seguradora
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `seguradora` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `seguradora` ;

-- -----------------------------------------------------
-- Table `seguradora`.`acidente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguradora`.`acidente` (
  `id_acidente` TINYINT NOT NULL AUTO_INCREMENT,
  `local_acidente` VARCHAR(60) NOT NULL,
  `data_acidente` DATE NOT NULL,
  `hora` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_acidente`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `seguradora`.`tartaruga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguradora`.`tartaruga` (
  `nome` VARCHAR(60) NOT NULL,
  `especie` VARCHAR(45) NOT NULL,
  `numero_serie` INT NOT NULL,
  `fk_acidente` TINYINT NOT NULL,
  PRIMARY KEY (`numero_serie`, `fk_acidente`),
  INDEX `fk_tartaruga_acidente1_idx` (`fk_acidente` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `seguradora`.`residencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguradora`.`residencia` (
  `endereco` VARCHAR(60) NOT NULL,
  `tipo` VARCHAR(15) NOT NULL,
  `cnpj` VARCHAR(15) NOT NULL,
  `fk_acidente` TINYINT NOT NULL,
  PRIMARY KEY (`cnpj`, `fk_acidente`),
  INDEX `fk_residencia_acidente1_idx` (`fk_acidente` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `seguradora`.`carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguradora`.`carro` (
  `placa` VARCHAR(10) NOT NULL,
  `marca` VARCHAR(30) NOT NULL,
  `registro` INT NOT NULL,
  `fk_acidente` TINYINT NOT NULL,
  PRIMARY KEY (`placa`, `fk_acidente`),
  INDEX `fk_carro_acidente1_idx` (`fk_acidente` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `seguradora`.`apolice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguradora`.`apolice` (
  `id_apolice` TINYINT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(30) NOT NULL,
  `valor` DECIMAL(5,2) NOT NULL,
  `fk_tartaruga` INT NOT NULL,
  `fk_residencia` VARCHAR(15) NOT NULL,
  `fk_carro` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_apolice`, `fk_tartaruga`, `fk_residencia`, `fk_carro`),
  INDEX `fk_apolice_tartaruga1_idx` (`fk_tartaruga` ASC) VISIBLE,
  INDEX `fk_apolice_residencia1_idx` (`fk_residencia` ASC) VISIBLE,
  INDEX `fk_apolice_carro1_idx` (`fk_carro` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `seguradora`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seguradora`.`cliente` (
  `id_cliente` TINYINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `endereco` VARCHAR(60) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `fk_apolice` TINYINT NOT NULL,
  PRIMARY KEY (`id_cliente`, `fk_apolice`),
  INDEX `fk_cliente_apolice_idx` (`fk_apolice` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
