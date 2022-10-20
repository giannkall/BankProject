-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bank
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bank
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bank` DEFAULT CHARACTER SET utf8 ;
USE `bank` ;

-- -----------------------------------------------------
-- Table `bank`.`Bank_Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`Bank_Account` (
  `idClient` VARCHAR(20) NOT NULL,
  `pin` INT(4) NOT NULL,
  `Balance` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE INDEX `idClient_UNIQUE` (`idClient` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`CreditCard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`CreditCard` (
  `idCreditCard` VARCHAR(20) NOT NULL,
  `pin` INT(4) NOT NULL,
  `Valid_From` DATE NOT NULL,
  `Expriration_date` DATE NOT NULL,
  `Debt` DECIMAL(6,2) NOT NULL,
  `Credit_limit` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`idCreditCard`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`Users` (
  `Username` VARCHAR(20) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `First_Name` VARCHAR(30) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  `Date_of_Birth` DATE NOT NULL,
  `Telephone1` VARCHAR(20) BINARY NOT NULL,
  `Telephone2` VARCHAR(20) NULL,
  `Email` VARCHAR(50) NULL,
  `Fathers_Name` VARCHAR(30) NOT NULL,
  `Mothers_Name` VARCHAR(30) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `id_No` VARCHAR(10) NOT NULL,
  `Bank_Account_idClient` VARCHAR(20) NOT NULL,
  `CreditCard_idCreditCard` VARCHAR(20) NOT NULL,
  `attempts` INT(1) NULL,
  PRIMARY KEY (`Username`, `Bank_Account_idClient`, `CreditCard_idCreditCard`),
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC),
  INDEX `fk_Users_Bank_Account1_idx` (`Bank_Account_idClient` ASC),
  INDEX `fk_Users_CreditCard1_idx` (`CreditCard_idCreditCard` ASC),
  CONSTRAINT `fk_Users_Bank_Account1`
    FOREIGN KEY (`Bank_Account_idClient`)
    REFERENCES `bank`.`Bank_Account` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users_CreditCard1`
    FOREIGN KEY (`CreditCard_idCreditCard`)
    REFERENCES `bank`.`CreditCard` (`idCreditCard`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`Joint_Holder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`Joint_Holder` (
  `Users_Username` VARCHAR(20) NOT NULL,
  `Bank_Account_idClient` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Users_Username`, `Bank_Account_idClient`),
  INDEX `fk_Sundikaiouxoi_Users1_idx` (`Users_Username` ASC),
  INDEX `fk_Joint_Holder_Bank_Account1_idx` (`Bank_Account_idClient` ASC),
  CONSTRAINT `fk_Sundikaiouxoi_Users1`
    FOREIGN KEY (`Users_Username`)
    REFERENCES `bank`.`Users` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Joint_Holder_Bank_Account1`
    FOREIGN KEY (`Bank_Account_idClient`)
    REFERENCES `bank`.`Bank_Account` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`Payment_CreditCard_BankAcount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`Payment_CreditCard_BankAcount` (
  `CreditCard_idCreditCard` VARCHAR(20) NOT NULL,
  `Bank_Account_idClient` VARCHAR(20) NOT NULL,
  `pay` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`CreditCard_idCreditCard`, `Bank_Account_idClient`),
  INDEX `fk_Payment_CreditCard_BankAcount_Bank_Account1_idx` (`Bank_Account_idClient` ASC),
  CONSTRAINT `fk_Payment_CreditCard_BankAcount_CreditCard1`
    FOREIGN KEY (`CreditCard_idCreditCard`)
    REFERENCES `bank`.`CreditCard` (`idCreditCard`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_CreditCard_BankAcount_Bank_Account1`
    FOREIGN KEY (`Bank_Account_idClient`)
    REFERENCES `bank`.`Bank_Account` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`Payment_CreditCard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`Payment_CreditCard` (
  `CreditCard_idCreditCard` VARCHAR(20) NOT NULL,
  `No_Account` VARCHAR(20) NOT NULL,
  `Pay` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`CreditCard_idCreditCard`, `No_Account`),
  CONSTRAINT `fk_Payment_CreditCard_CreditCard1`
    FOREIGN KEY (`CreditCard_idCreditCard`)
    REFERENCES `bank`.`CreditCard` (`idCreditCard`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank`.`Payment_BankAccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank`.`Payment_BankAccount` (
  `Bank_Account_idClient` VARCHAR(20) NOT NULL,
  `No_Account` VARCHAR(20) NOT NULL,
  `Pay` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`Bank_Account_idClient`, `No_Account`),
  CONSTRAINT `fk_Payment_BankAccount_Bank_Account1`
    FOREIGN KEY (`Bank_Account_idClient`)
    REFERENCES `bank`.`Bank_Account` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `bank`.`Bank_Account`
-- -----------------------------------------------------
START TRANSACTION;
USE `bank`;
INSERT INTO `bank`.`Bank_Account` (`idClient`, `pin`, `Balance`) VALUES ('6538756', 1234, 100000);
INSERT INTO `bank`.`Bank_Account` (`idClient`, `pin`, `Balance`) VALUES ('1425364', 7564, 500000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bank`.`CreditCard`
-- -----------------------------------------------------
START TRANSACTION;
USE `bank`;
INSERT INTO `bank`.`CreditCard` (`idCreditCard`, `pin`, `Valid_From`, `Expriration_date`, `Debt`, `Credit_limit`) VALUES ('32547563', 1234, '2013/12/12', '2019/12/12', 2000, 100000);
INSERT INTO `bank`.`CreditCard` (`idCreditCard`, `pin`, `Valid_From`, `Expriration_date`, `Debt`, `Credit_limit`) VALUES ('74859673', 8568, '2012/04/05', '2018/04/05', 100, 50000);
INSERT INTO `bank`.`CreditCard` (`idCreditCard`, `pin`, `Valid_From`, `Expriration_date`, `Debt`, `Credit_limit`) VALUES ('15263748', 4637, '2015/01/02', '2021/01/02', 1500, 250000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bank`.`Users`
-- -----------------------------------------------------
START TRANSACTION;
USE `bank`;
INSERT INTO `bank`.`Users` (`Username`, `Password`, `First_Name`, `Last_Name`, `Date_of_Birth`, `Telephone1`, `Telephone2`, `Email`, `Fathers_Name`, `Mothers_Name`, `Address`, `id_No`, `Bank_Account_idClient`, `CreditCard_idCreditCard`, `attempts`) VALUES ('popig', '1234', 'Kalliopi', 'Giannoukou', '1995/10/22', '2101234567', NULL, NULL, 'Giorgos', 'Anna', 'Axaion 25 ', 'AI123453', '6538756', '32547563', 0);
INSERT INTO `bank`.`Users` (`Username`, `Password`, `First_Name`, `Last_Name`, `Date_of_Birth`, `Telephone1`, `Telephone2`, `Email`, `Fathers_Name`, `Mothers_Name`, `Address`, `id_No`, `Bank_Account_idClient`, `CreditCard_idCreditCard`, `attempts`) VALUES ('annav', 'c123', 'Anna', 'Vegkou', '1980/07/20', '2109475867', '6978736475', 'annav@gmail.gr', 'Areistidis', 'Eirini', 'Xiou 87', 'NH63742', '1425364', '74859673', 0);
INSERT INTO `bank`.`Users` (`Username`, `Password`, `First_Name`, `Last_Name`, `Date_of_Birth`, `Telephone1`, `Telephone2`, `Email`, `Fathers_Name`, `Mothers_Name`, `Address`, `id_No`, `Bank_Account_idClient`, `CreditCard_idCreditCard`, `attempts`) VALUES ('alexisg', 'alex1805', 'Alexandros', 'Giannopoulos', '1994/07/20', '21084957365', NULL, 'alexisg@hotmail.com', 'Konstantinos', 'Vassiliki', 'Taxiarxwn 20', 'PY27452', '6538756', '15263748', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bank`.`Joint_Holder`
-- -----------------------------------------------------
START TRANSACTION;
USE `bank`;
INSERT INTO `bank`.`Joint_Holder` (`Users_Username`, `Bank_Account_idClient`) VALUES ('popig', '6538756');
INSERT INTO `bank`.`Joint_Holder` (`Users_Username`, `Bank_Account_idClient`) VALUES ('alexisg', '6538756');
INSERT INTO `bank`.`Joint_Holder` (`Users_Username`, `Bank_Account_idClient`) VALUES ('annav', '1425364');

COMMIT;


-- -----------------------------------------------------
-- Data for table `bank`.`Payment_CreditCard_BankAcount`
-- -----------------------------------------------------
START TRANSACTION;
USE `bank`;
INSERT INTO `bank`.`Payment_CreditCard_BankAcount` (`CreditCard_idCreditCard`, `Bank_Account_idClient`, `pay`) VALUES ('32547563', '6538756', 0);
INSERT INTO `bank`.`Payment_CreditCard_BankAcount` (`CreditCard_idCreditCard`, `Bank_Account_idClient`, `pay`) VALUES ('15263748', '6538756', 0);
INSERT INTO `bank`.`Payment_CreditCard_BankAcount` (`CreditCard_idCreditCard`, `Bank_Account_idClient`, `pay`) VALUES ('74859673', '1425364', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bank`.`Payment_CreditCard`
-- -----------------------------------------------------
START TRANSACTION;
USE `bank`;
INSERT INTO `bank`.`Payment_CreditCard` (`CreditCard_idCreditCard`, `No_Account`, `Pay`) VALUES ('32547563', '102928', 0);
INSERT INTO `bank`.`Payment_CreditCard` (`CreditCard_idCreditCard`, `No_Account`, `Pay`) VALUES ('74859673', '3423431', 0);
INSERT INTO `bank`.`Payment_CreditCard` (`CreditCard_idCreditCard`, `No_Account`, `Pay`) VALUES ('15263748', '31232112', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bank`.`Payment_BankAccount`
-- -----------------------------------------------------
START TRANSACTION;
USE `bank`;
INSERT INTO `bank`.`Payment_BankAccount` (`Bank_Account_idClient`, `No_Account`, `Pay`) VALUES ('6538756', '102928', 0);
INSERT INTO `bank`.`Payment_BankAccount` (`Bank_Account_idClient`, `No_Account`, `Pay`) VALUES ('1425364', '3423431', 0);
INSERT INTO `bank`.`Payment_BankAccount` (`Bank_Account_idClient`, `No_Account`, `Pay`) VALUES ('6538756', '31232112', 0);

COMMIT;

