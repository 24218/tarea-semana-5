-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tarea_semana_5_
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tarea_semana_5_
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tarea_semana_5_` DEFAULT CHARACTER SET utf8 ;
USE `tarea_semana_5_` ;

-- -----------------------------------------------------
-- Table `tarea_semana_5_`.`libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea_semana_5_`.`libros` (
  `id_libro` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(200) NOT NULL,
  `fecha_publicacion` DATE NOT NULL,
  `isbn` VARCHAR(200) NOT NULL,
  `id_editorial` INT NOT NULL,
  PRIMARY KEY (`id_libro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarea_semana_5_`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea_semana_5_`.`autores` (
  `id_autor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `biografia` TEXT(200) NOT NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarea_semana_5_`.`libros_autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea_semana_5_`.`libros_autores` (
  `id_libro` INT NOT NULL,
  `id_autor` INT NOT NULL,
  INDEX `id_libro_idx` (`id_libro` ASC) VISIBLE,
  INDEX `id_autor_idx` (`id_autor` ASC) VISIBLE,
  CONSTRAINT `fk_id_libro`
    FOREIGN KEY (`id_libro`)
    REFERENCES `tarea_semana_5_`.`libros` (`id_libro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkid_autor`
    FOREIGN KEY (`id_autor`)
    REFERENCES `tarea_semana_5_`.`autores` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarea_semana_5_`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea_semana_5_`.`usuarios` (
  `id_usuario` INT NOT NULL,
  `nombre` VARCHAR(200) NOT NULL,
  `correo` VARCHAR(200) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarea_semana_5_`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea_semana_5_`.`prestamos` (
  `id_prestamo` INT NOT NULL,
  `ids_usuario` INT NOT NULL,
  `ids_libro` INT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_limite` DATE NOT NULL,
  `fecha_entrega` DATE NOT NULL,
  `estado` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  INDEX `id_usuario_idx` (`ids_usuario` ASC) VISIBLE,
  INDEX `id_libro_idx` (`ids_libro` ASC) VISIBLE,
  CONSTRAINT `fkid_usuario`
    FOREIGN KEY (`ids_usuario`)
    REFERENCES `tarea_semana_5_`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkid_libro`
    FOREIGN KEY (`ids_libro`)
    REFERENCES `tarea_semana_5_`.`libros` (`id_libro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarea_semana_5_`.`inventarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea_semana_5_`.`inventarios` (
  `id_inventario` INT NOT NULL,
  `idu_libro` INT NULL,
  `idu_prestamo` INT NULL,
  PRIMARY KEY (`id_inventario`),
  INDEX `id_libro_idx` (`idu_libro` ASC) VISIBLE,
  INDEX `id_prestamo_idx` (`idu_prestamo` ASC) VISIBLE,
  CONSTRAINT `xd_id_libro`
    FOREIGN KEY (`idu_libro`)
    REFERENCES `tarea_semana_5_`.`libros` (`id_libro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_prestamo`
    FOREIGN KEY (`idu_prestamo`)
    REFERENCES `tarea_semana_5_`.`prestamos` (`id_prestamo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tarea_semana_5_`.`control_prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarea_semana_5_`.`control_prestamos` (
  `id_controlprestamo` INT NOT NULL,
  `idk_prestamo` INT NOT NULL,
  `idk_usuario` INT NOT NULL,
  `idk_libro` INT NULL,
  PRIMARY KEY (`id_controlprestamo`),
  INDEX `id_prestamo_idx` (`idk_prestamo` ASC) VISIBLE,
  INDEX `id_usuario_idx` (`idk_usuario` ASC) VISIBLE,
  INDEX `id_libro_idx` (`idk_libro` ASC) VISIBLE,
  CONSTRAINT `idf_prestamo`
    FOREIGN KEY (`idk_prestamo`)
    REFERENCES `tarea_semana_5_`.`prestamos` (`id_prestamo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idf_usuario`
    FOREIGN KEY (`idk_usuario`)
    REFERENCES `tarea_semana_5_`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idf_libro`
    FOREIGN KEY (`idk_libro`)
    REFERENCES `tarea_semana_5_`.`libros` (`id_libro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `tarea_semana_5_`.`libros`
-- -----------------------------------------------------
START TRANSACTION;
USE `tarea_semana_5_`;
INSERT INTO `tarea_semana_5_`.`libros` (`id_libro`, `titulo`, `fecha_publicacion`, `isbn`, `id_editorial`) VALUES (51325, 'El Quijote', '1605-01-01', '1244334', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tarea_semana_5_`.`autores`
-- -----------------------------------------------------
START TRANSACTION;
USE `tarea_semana_5_`;
INSERT INTO `tarea_semana_5_`.`autores` (`id_autor`, `nombre`, `fecha_nacimiento`, `biografia`) VALUES (12324, 'autor1', '1980-05-15', 'autor de libros');

COMMIT;


-- -----------------------------------------------------
-- Data for table `tarea_semana_5_`.`libros_autores`
-- -----------------------------------------------------
START TRANSACTION;
USE `tarea_semana_5_`;
INSERT INTO `tarea_semana_5_`.`libros_autores` (`id_libro`, `id_autor`) VALUES (, );

COMMIT;


-- -----------------------------------------------------
-- Data for table `tarea_semana_5_`.`usuarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `tarea_semana_5_`;
INSERT INTO `tarea_semana_5_`.`usuarios` (`id_usuario`, `nombre`, `correo`, `telefono`) VALUES (12788, 'Maiyovi', 'tarea@gmail.com', '87788899');

COMMIT;


-- -----------------------------------------------------
-- Data for table `tarea_semana_5_`.`prestamos`
-- -----------------------------------------------------
START TRANSACTION;
USE `tarea_semana_5_`;
INSERT INTO `tarea_semana_5_`.`prestamos` (`id_prestamo`, `ids_usuario`, `ids_libro`, `fecha_inicio`, `fecha_limite`, `fecha_entrega`, `estado`) VALUES (12873681, 129381290, 218370912, '2025-02-2', '2025-03-01', '2025-03-1', 'entregado');

COMMIT;


-- -----------------------------------------------------
-- Data for table `tarea_semana_5_`.`inventarios`
-- -----------------------------------------------------
START TRANSACTION;
USE `tarea_semana_5_`;
INSERT INTO `tarea_semana_5_`.`inventarios` (`id_inventario`, `idu_libro`, `idu_prestamo`) VALUES (, , NULL);

COMMIT;

