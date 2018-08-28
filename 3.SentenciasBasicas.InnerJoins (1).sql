--BASE DE DATOS QUE SE VA A UTILIZAR
USE chickenTest
GO

--SENTENCIAS BASICAS
--ESTAS SENTENCIAS DEBEN EJECUTARSE UNA POR UNA

--MOSTRAR EL NOMBRE DE LA GRANJA DONDE LA ID SEA 102
SELECT nameFarm FROM farms WHERE idFarm = 102;

--MOSTRAR LA CANT DE HUEVOS QUE PERTENECEN A LA GRANJA 102
SELECT COUNT(idEgg) FROM eggs WHERE eggs.farmRef = 102;

--MOSTRAR TODOS LOS DATOS DONDE LA GALLINA SE LLAME RITA O ESTER
SELECT * FROM chickens WHERE nameChicken = 'Rita' OR nameChicken = 'Ester';

--INGRESAR DATOS EN UNA TABLA(dos maneras diferentes de hacer lo mismo)
INSERT INTO farms (nameFarm) VALUES ('granjaPrueba');
INSERT INTO farms (nameFarm) SELECT 'granjaPrueba2';

SELECT * FROM farms;
SELECT * FROM farmsRegister;

--ELIMINAR UNA TABLA, LA DEJAMOS COMENTADA PARA QUE NO HAYA ERRORES AL EJECUTAR LAS OTRAS QUERYS
--DROP TABLE Chickens;

--AGREGAR UN NUEVO CAMPO A UNA TABLA
ALTER TABLE chickens
ADD sobrenombre varchar(50);
SELECT * FROM chickens;

--MODIFICAR EL NOMBRE DE UNA GALLINA
UPDATE chickens SET nameChicken = 'Josefa' WHERE nameChicken='Ester';
SELECT * FROM chickens WHERE nameChicken = 'Josefa'

--ELIMINAR UNA GALLINA
DELETE FROM chickens WHERE idChicken = 6; 
SELECT * FROM chickens;
SELECT * FROM chickenRegister;

--INNER JOINS
SELECT * FROM chickens INNER JOIN farms ON chickens.farmRef = farms.idFarm;

--LEFT JOIN, MUESTRA TODOS LOS DATOS DE LA TABLA IZQUIERDA Y PONE NULL EN LA TABLA DERECHA QUE NO EXISTE EN LA RELACION
SELECT * FROM chickens LEFT JOIN eggs ON chickens.idChicken = eggs.chickenRef;

--MULTIPLE INNER JOIN
SELECT * FROM farms INNER JOIN chickens ON farms.idFarm = chickens.farmRef INNER JOIN eggs ON chickens.idChicken = eggs.chickenRef WHERE idFarm = 101;

--MULTIPLE INNER JOIN ENTRE ORDER Y EGGS USANDO TABLA INTERMEDIA
SELECT * FROM orders INNER JOIN eggsOrder ON orders.idOrder = eggsOrder.idOrder INNER JOIN eggs ON Eggs.idEgg = eggsOrder.idEgg;

--MULTIPLE INNER JOINS AGRUPANDO POR CUSTOMER Y FARMREF
SELECT orders.customer, eggs.farmRef FROM orders INNER JOIN eggsOrder ON orders.idOrder = eggsOrder.idOrder INNER JOIN eggs ON eggs.idEgg = eggsOrder.idEgg GROUP BY orders.customer, eggs.farmRef;