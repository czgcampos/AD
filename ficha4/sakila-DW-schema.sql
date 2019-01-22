-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sakila_data_warehouse
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sakila_data_warehouse
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sakila_data_warehouse` DEFAULT CHARACTER SET utf8 ;
USE `sakila_data_warehouse` ;

-- -----------------------------------------------------
-- Table `sakila_data_warehouse`.`DIM_loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_data_warehouse`.`DIM_loja` (
  `id_loja` INT NOT NULL,
  `designacao` VARCHAR(45) NULL,
  `gestorNome` VARCHAR(45) NULL,
  `rua` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `país` VARCHAR(45) NULL,
  PRIMARY KEY (`id_loja`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila_data_warehouse`.`DIM_gestor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_data_warehouse`.`DIM_gestor` (
  `id_gestor` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `loja` VARCHAR(45) NULL,
  PRIMARY KEY (`id_gestor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila_data_warehouse`.`DIM_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_data_warehouse`.`DIM_data` (
  `id_calendario` INT NOT NULL,
  `data` VARCHAR(45) NULL,
  `dia` VARCHAR(45) NULL,
  `mes` VARCHAR(45) NULL,
  `ano` VARCHAR(45) NULL,
  `diaSemana` VARCHAR(45) NULL,
  `semanaAno` VARCHAR(45) NULL,
  `util` VARCHAR(45) NULL,
  `feriado` VARCHAR(45) NULL,
  PRIMARY KEY (`id_calendario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila_data_warehouse`.`DIM_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_data_warehouse`.`DIM_funcionario` (
  `id_funcionario` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `rua` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `foto` BLOB NULL,
  `email` VARCHAR(45) NULL,
  `loja` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  PRIMARY KEY (`id_funcionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila_data_warehouse`.`DIM_filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_data_warehouse`.`DIM_filme` (
  `id_filme` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  `anoLancamento` VARCHAR(45) NULL,
  `linguagem` VARCHAR(45) NULL,
  `linguagemOriginal` VARCHAR(45) NULL,
  `classificacao` VARCHAR(45) NULL,
  `duracao` VARCHAR(45) NULL,
  `categorias` TEXT NULL,
  PRIMARY KEY (`id_filme`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila_data_warehouse`.`DIM_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_data_warehouse`.`DIM_cliente` (
  `id_cliente` INT NOT NULL,
  `primNome` VARCHAR(45) NULL,
  `ultNome` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `rua` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sakila_data_warehouse`.`TF_Alugueres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_data_warehouse`.`TF_Alugueres` (
  `idTF_Aluguer` INT NOT NULL,
  `periodoDD` VARCHAR(45) NULL,
  `quantidade` VARCHAR(45) NULL,
  `nrDiasAluguer` VARCHAR(45) NULL,
  `diasDeAluguer` INT NULL,
  `id_loja` INT NOT NULL,
  `id_gestor` INT NOT NULL,
  `id_dataAluguer` INT NOT NULL,
  `id_funcionario` INT NOT NULL,
  `id_filme` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_dataEntrega` INT NOT NULL,
  PRIMARY KEY (`idTF_Aluguer`),
  INDEX `fk_TF_Aluguer_DIM_loja_idx` (`id_loja` ASC) VISIBLE,
  INDEX `fk_TF_Aluguer_DIM_gestor1_idx` (`id_gestor` ASC) VISIBLE,
  INDEX `fk_TF_Aluguer_DIM_calendario1_idx` (`id_dataAluguer` ASC) VISIBLE,
  INDEX `fk_TF_Aluguer_DIM_funcionario1_idx` (`id_funcionario` ASC) VISIBLE,
  INDEX `fk_TF_Aluguer_DIM_filme1_idx` (`id_filme` ASC) VISIBLE,
  INDEX `fk_TF_Aluguer_DIM_cliente1_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_TF_Alugueres_DIM_calendario1_idx` (`id_dataEntrega` ASC) VISIBLE,
  CONSTRAINT `fk_TF_Aluguer_DIM_loja`
    FOREIGN KEY (`id_loja`)
    REFERENCES `sakila_data_warehouse`.`DIM_loja` (`id_loja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TF_Aluguer_DIM_gestor1`
    FOREIGN KEY (`id_gestor`)
    REFERENCES `sakila_data_warehouse`.`DIM_gestor` (`id_gestor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TF_Aluguer_DIM_calendario1`
    FOREIGN KEY (`id_dataAluguer`)
    REFERENCES `sakila_data_warehouse`.`DIM_data` (`id_calendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TF_Aluguer_DIM_funcionario1`
    FOREIGN KEY (`id_funcionario`)
    REFERENCES `sakila_data_warehouse`.`DIM_funcionario` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TF_Aluguer_DIM_filme1`
    FOREIGN KEY (`id_filme`)
    REFERENCES `sakila_data_warehouse`.`DIM_filme` (`id_filme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TF_Aluguer_DIM_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `sakila_data_warehouse`.`DIM_cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TF_Alugueres_DIM_calendario1`
    FOREIGN KEY (`id_dataEntrega`)
    REFERENCES `sakila_data_warehouse`.`DIM_data` (`id_calendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = tis620;


-- -----------------------------------------------------
-- Table `sakila_data_warehouse`.`TF_Pagamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sakila_data_warehouse`.`TF_Pagamentos` (
  `id_pagamentos` VARCHAR(45) NOT NULL,
  `valorMonetario` VARCHAR(45) NULL,
  `diasDePagamento` INT NULL,
  `id_dataPagamento` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_funcionario` INT NOT NULL,
  `id_loja` INT NOT NULL,
  `id_dataEntrega` INT NOT NULL,
  `id_dataAluguer` INT NOT NULL,
  INDEX `fk_TF_Pagamentos_DIM_calendario1_idx` (`id_dataPagamento` ASC) VISIBLE,
  INDEX `fk_TF_Pagamentos_DIM_cliente1_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_TF_Pagamentos_DIM_funcionario1_idx` (`id_funcionario` ASC) VISIBLE,
  PRIMARY KEY (`id_pagamentos`),
  INDEX `fk_TF_Pagamentos_DIM_loja1_idx` (`id_loja` ASC) VISIBLE,
  INDEX `fk_TF_Pagamentos_DIM_calendario2_idx` (`id_dataEntrega` ASC) VISIBLE,
  INDEX `fk_TF_Pagamentos_DIM_data1_idx` (`id_dataAluguer` ASC) VISIBLE,
  CONSTRAINT `fk_TF_Pagamentos_DIM_calendario1`
    FOREIGN KEY (`id_dataPagamento`)
    REFERENCES `sakila_data_warehouse`.`DIM_data` (`id_calendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TF_Pagamentos_DIM_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `sakila_data_warehouse`.`DIM_cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TF_Pagamentos_DIM_funcionario1`
    FOREIGN KEY (`id_funcionario`)
    REFERENCES `sakila_data_warehouse`.`DIM_funcionario` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TF_Pagamentos_DIM_loja1`
    FOREIGN KEY (`id_loja`)
    REFERENCES `sakila_data_warehouse`.`DIM_loja` (`id_loja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TF_Pagamentos_DIM_calendario2`
    FOREIGN KEY (`id_dataEntrega`)
    REFERENCES `sakila_data_warehouse`.`DIM_data` (`id_calendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TF_Pagamentos_DIM_data1`
    FOREIGN KEY (`id_dataAluguer`)
    REFERENCES `sakila_data_warehouse`.`DIM_data` (`id_calendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;