CREATE SCHEMA `alke-walle

CREATE TABLE `sys`.`usuarios` (
  `idusuarios` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `balance` INT NULL,
  PRIMARY KEY (`idusuarios`));

CREATE TABLE `alke-wallet`.`monedas` (
  `idmonedas` INT NOT NULL,
  `currency_name` VARCHAR(45) NOT NULL,
  `currency_symbol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmonedas`));

CREATE TABLE `alke-wallet`.`transaccion` (
  `idtransaccion` INT NOT NULL,
  `sender_user_id` INT NULL,
  `receiver_user_id` INT NULL,
  `amount` INT NULL,
  `transaccion_date` DATETIME NOT NULL,
  `currency_id` VARCHAR(45) NULL,
  PRIMARY KEY (`idtransaccion`));
  
  ALTER TABLE `alke-wallet`.`transaccion` 
ADD INDEX `transaccion_1_idx` (`sender_user_id` ASC) VISIBLE,
ADD INDEX `transaccion_2_idx` (`receiver_user_id` ASC) VISIBLE,
ADD INDEX `transaccion_3_idx` (`currency_id` ASC) VISIBLE;
;
ALTER TABLE `alke-wallet`.`transaccion` 
ADD CONSTRAINT `transaccion_1`
  FOREIGN KEY (`sender_user_id`)
  REFERENCES `alke-wallet`.`usuarios` (`idusuarios`)
  ON DELETE SET NULL
  ON UPDATE NO ACTION,
ADD CONSTRAINT `transaccion_2`
  FOREIGN KEY (`receiver_user_id`)
  REFERENCES `alke-wallet`.`usuarios` (`idusuarios`)
  ON DELETE SET NULL
  ON UPDATE NO ACTION,
ADD CONSTRAINT `transaccion_3`
  FOREIGN KEY (`currency_id`)
  REFERENCES `alke-wallet`.`monedas` (`currency_name`)
  ON DELETE SET NULL
  ON UPDATE NO ACTION;
  
  
ALTER TABLE `alke-wallet`.`transaccion` 
ADD CONSTRAINT `transaccion1`
  FOREIGN KEY (`sender_user_id`)
  REFERENCES `alke-wallet`.`usuarios` (`idusuarios`)
  ON DELETE SET NULL
  ON UPDATE NO ACTION,
ADD CONSTRAINT `transaccion2`
  FOREIGN KEY (`receiver_user_id`)
  REFERENCES `alke-wallet`.`usuarios` (`idusuarios`)
  ON DELETE SET NULL
  ON UPDATE NO ACTION,
ADD CONSTRAINT `transaccion3`
  FOREIGN KEY (`currency_id`)
  REFERENCES `alke-wallet`.`monedas` (`idmonedas`)
  ON DELETE SET NULL
  ON UPDATE NO ACTION;

INSERT INTO `alke-wallet`.`usuarios` (`idusuarios`, `name`, `email`, `password`, `balance`) VALUES ('2', 'franco', 'franco@gmail.com', '41234', '4123412');
INSERT INTO `alke-wallet`.`usuarios` (`idusuarios`, `name`, `email`, `password`, `balance`) VALUES ('3', 'rafaela', 'rafaela@gmail.com', '7654', '5987654');
INSERT INTO `alke-wallet`.`usuarios` (`idusuarios`, `name`, `email`, `password`, `balance`) VALUES ('4', 'catalina', 'catalina@gmail.com', '7382', '3812973');

INSERT INTO `alke-wallet`.`monedas` (`idmonedas`, `currency_name`, `currency_symbol`) VALUES ('1', 'Chilean Peso', '$');
INSERT INTO `alke-wallet`.`monedas` (`idmonedas`, `currency_name`, `currency_symbol`) VALUES ('2', 'American Dolar', '$');

SELECT * FROM `alke-wallet`.transacciones;

SELECT m.currency_name, u.name from usuarios as u
INNER JOIN transacciones as t
on t.sender_user_id = u.idusuarios
INNER JOIN monedas as m
ON t.currency_id = m.idmonedas
WHERE u.idusuarios =3;
<--NO ME FUNCIONO ESTE CODIGO, DEJO EL DEL PROFESOR QUE DEVE SER MAS EXACTP-->

Executing:
ALTER TABLE `alke-wallet`.`transaccion` 
RENAME TO  `alke-wallet`.`transacciones` ;


