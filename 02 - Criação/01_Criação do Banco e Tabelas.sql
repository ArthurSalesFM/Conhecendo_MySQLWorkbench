-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema farmacia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Criando o banco de dados caso não exista no sistema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `farmacia` DEFAULT CHARACTER SET utf8 ;

-- selecionando o banco criado para a criação das tabelas
USE `farmacia` ;

-- -----------------------------------------------------
-- caso já exista uma tabela tipos_produtos, ela será delettada
-- -----------------------------------------------------
DROP TABLE IF EXISTS `farmacia`.`tipos_produtos` ;

-- criando a tabela
CREATE TABLE IF NOT EXISTS `farmacia`.`tipos_produtos` (
  `id` INT NOT NULL AUTO_INCREMENT, -- tipo inteiro, não nulo e auto incrementável 
  `tipo` VARCHAR(45) NOT NULL, -- sequencia de caracteres de no máximo 45 e não nulo
  PRIMARY KEY (`id`)) -- definindo o id como chave primária
ENGINE = InnoDB;

-- ----------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS `farmacia`.`fabricantes` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`fabricantes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fabricante` VARCHAR(70) NOT NULL, 
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- ----------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS `farmacia`.`produtos` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `produto` VARCHAR(50) NOT NULL,
  `designacao` VARCHAR(200) NOT NULL,
  `composicao` VARCHAR(200) NOT NULL,
  `preco_venda` DECIMAL(10,2) NOT NULL, -- armazena valores não inteiros
  `id_fabricante` INT NOT NULL,
  `id_tipo` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produtos_2_idx` (`id_fabricante` ASC) ,
  INDEX `fk_produtos_3_idx` (`id_tipo` ASC) ,
  CONSTRAINT `fk_produtos_2`
    FOREIGN KEY (`id_fabricante`) -- chave estrangeira
    REFERENCES `farmacia`.`fabricantes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_3`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `farmacia`.`tipos_produtos` (`id`) -- referencia da tabela tipos_produtos
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- ----------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS `farmacia`.`clientes` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(200) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `cep` VARCHAR(15) NOT NULL,
  `localidade` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- ----------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS `farmacia`.`compras` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`compras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `data_compra` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_compras_1_idx` (`id_cliente` ASC) ,
  CONSTRAINT `fk_compras_1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `farmacia`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- ----------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS `farmacia`.`produtos_compra` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`produtos_compra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_compra` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_compras_1_idx` (`id_compra` ASC) ,
  INDEX `fk_produtos_1_idx` (`id_produto` ASC) ,
  CONSTRAINT `fk_compras_2`
    FOREIGN KEY (`id_compra`)
    REFERENCES `farmacia`.`compras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `farmacia`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- ----------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS `farmacia`.`medicos` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`medicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `crm` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- ----------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS `farmacia`.`receitas_medica` ;

CREATE TABLE IF NOT EXISTS `farmacia`.`receitas_medica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_produto_compra` INT NOT NULL,
  `id_medico` INT NOT NULL,
  `receita` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produtos_compra_1_idx` (`id_produto_compra` ASC) ,
  INDEX `fk_medicos_1_idx` (`id_medico` ASC) ,
  CONSTRAINT `fk_produtos_compra_1`
    FOREIGN KEY (`id_produto_compra`)
    REFERENCES `farmacia`.`produtos_compra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicos_1`
    FOREIGN KEY (`id_medico`)
    REFERENCES `farmacia`.`medicos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
