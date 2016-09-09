/*Pregunta 2*/

CREATE DATABASE `evidencia_1` /*!40100 DEFAULT CHARACTER SET utf8 */;

CREATE TABLE `Cliente` (
  `IdCleinte` varchar(45) NOT NULL,
  `Nombres` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Edad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdCleinte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `Detalle` (
  `IdFacturaDetalle` int(11) NOT NULL,
  `IdFacturaCabecera` varchar(45) DEFAULT NULL,
  `IdProducto` varchar(45) DEFAULT NULL,
  `Cantidad` varchar(45) DEFAULT NULL,
  `PrecioUnitario` varchar(45) DEFAULT NULL,
  `Total` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdFacturaDetalle`),
  KEY `fk_Detalle_1_idx` (`IdFacturaCabecera`),
  KEY `fk_Detalle_2_idx` (`IdProducto`),
  CONSTRAINT `fk_Detalle_1` FOREIGN KEY (`IdFacturaCabecera`) REFERENCES `Factura` (`idFacturaCabecera`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Detalle_2` FOREIGN KEY (`IdProducto`) REFERENCES `Mercaderia` (`IdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `Factura` (
  `idFacturaCabecera` varchar(45) NOT NULL,
  `IdCliente` varchar(45) DEFAULT NULL,
  `Numero` varchar(45) DEFAULT NULL,
  `Serie` varchar(45) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `SubTotal` decimal(5,2) DEFAULT NULL,
  `Impuestos` int(11) DEFAULT NULL,
  `Total` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`idFacturaCabecera`),
  KEY `fk_Factura_1_idx` (`IdCliente`),
  CONSTRAINT `fk_Factura_1` FOREIGN KEY (`IdCliente`) REFERENCES `Cliente` (`IdCleinte`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `Mercaderia` (
  `IdProducto` varchar(45) NOT NULL,
  `Codigo` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `PrecioUnitario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*pregunta 3
Se seleciona la opcion de table data import wizard
y se busca la ruta del archivo .csv  
*/



/*pregunta 4*/

SELECT c.Name, ci.Name , l.Language
FROM Country c
JOIN City ci ON ci.ID = c.Capital
JOIN  CountryLanguage l ON l.CountryCode = c.Code
WHERE l.Language = 'Spanish' OR l.Language = 'English' 
AND c.Population > 1000000;

/*pregunta 6*/

DELIMITER $$
CREATE FUNCTION casa (base int,ht int,hc int )
RETURNS DOUBLE
DETERMINISTIC
BEGIN
	DECLARE areatri INT;
    DECLARE areacu INT;
    DECLARE area INT;
    SET areatri = (base*ht)/2;
    SET areacu = base *hc;
    SET area = areatri + areacu;
    RETURN area;
END $$
DELIMITER ;

SELECT casa(4,2,1);

/*pregunta 7*/

DELIMITER $$
CREATE PROCEDURE evi(cat VARCHAR(25),out num INT)
BEGIN
	SELECT COUNT(*) INTO num FROM film f 
    JOIN film_category fc ON fc.film_id = f.film_id
    JOIN category c ON c.category_id = fc.category_id
    WHERE c.name = cat;
END$$
DELIMITER ;

CALL evi('Comedy',@num);
SELECT  @num;


