-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema soos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema soos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `soos` DEFAULT CHARACTER SET utf8 ;
USE `soos` ;

-- -----------------------------------------------------
-- Table `soos`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soos`.`Cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soos`.`Telefones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soos`.`Telefones` (
  `numero_1` INT NOT NULL,
  `numero_2` INT NULL,
  `numero_3` INT NULL,
  `cliente_id` INT NOT NULL,
  /*INDEX `fk_Telefones_Cliente1_idx` (`cliente_id` ASC) VISIBLE,*/
  CONSTRAINT `fk_Telefones_Cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `soos`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soos`.`Equipamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soos`.`Equipamento` (
  `id_equipamento` INT NOT NULL AUTO_INCREMENT,
  `numero_serie` VARCHAR(25) NULL,
  `descricao` VARCHAR(25) NULL,
  `marca` VARCHAR(15) NOT NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`id_equipamento`),
  /*INDEX `fk_Equipamento_Cliente1_idx` (`cliente_id` ASC) VISIBLE,*/
  CONSTRAINT `fk_Equipamento_Cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `soos`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soos`.`Os`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soos`.`Os` (
  `id_os` INT NOT NULL AUTO_INCREMENT,
  `data_abertura` DATE NOT NULL,
  `data_fechamento` DATE NOT NULL,
  `equipamento_id` INT NOT NULL,
  PRIMARY KEY (`id_os`),
  /*INDEX `fk_Os_Equipamento1_idx` (`equipamento_id` ASC) VISIBLE,*/
  CONSTRAINT `fk_Os_Equipamento1`
    FOREIGN KEY (`equipamento_id`)
    REFERENCES `soos`.`Equipamento` (`id_equipamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soos`.`Defeito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soos`.`Defeito` (
  `defeito` VARCHAR(200) NOT NULL,
  `os_id` INT NOT NULL,
 /* INDEX `fk_Defeito_Os1_idx` (`os_id` ASC) VISIBLE,*/
  CONSTRAINT `fk_Defeito_Os1`
    FOREIGN KEY (`os_id`)
    REFERENCES `soos`.`Os` (`id_os`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soos`.`Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soos`.`Status` (
  `id_status` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(25) NOT NULL,
  `os_id` INT NOT NULL,
  PRIMARY KEY (`id_status`),
 /* INDEX `fk_Status_Os1_idx` (`os_id` ASC) VISIBLE,*/
  CONSTRAINT `fk_Status_Os1`
    FOREIGN KEY (`os_id`)
    REFERENCES `soos`.`Os` (`id_os`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soos`.`Causa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soos`.`Causa` (
  `descricao` VARCHAR(200) NOT NULL,
  `os_id` INT NOT NULL,
 /* INDEX `fk_Causa_Os1_idx` (`os_id` ASC) VISIBLE,*/
  CONSTRAINT `fk_Causa_Os1`
    FOREIGN KEY (`os_id`)
    REFERENCES `soos`.`Os` (`id_os`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soos`.`Solucao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soos`.`Solucao` (
  `descricao` VARCHAR(200) NOT NULL,
  `os_id` INT NOT NULL,
/*  INDEX `fk_Solucao_Os1_idx` (`os_id` ASC) VISIBLE,*/
  CONSTRAINT `fk_Solucao_Os1`
    FOREIGN KEY (`os_id`)
    REFERENCES `soos`.`Os` (`id_os`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `soos`.`Orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soos`.`Orcamento` (
  `valor_unidade` FLOAT NULL,
  `quantidade` INT(5) NULL,
  `peca` VARCHAR(45) NULL,
  `os_id` INT NOT NULL,
 /* INDEX `fk_Orcamento_Os1_idx` (`os_id` ASC) VISIBLE,*/
  CONSTRAINT `fk_Orcamento_Os1`
    FOREIGN KEY (`os_id`)
    REFERENCES `soos`.`Os` (`id_os`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
