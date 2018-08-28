/*  CTRL + A para seleccionar todo, F5 para ejecutarlo
los comandos GO sirven para delimitar conjuntos de sentencias, 
y en este caso para que no halla errores al ejecutar todo al mismo tiempo*/

--CREA LA BASE DE DATOS
CREATE DATABASE chickenTest
GO

--NOS CONECTAMOS A LA BASE DE DATOS QUE VAMOS A USAR
USE chickenTest  
GO  

--CREA LAS TABLAS 

--PRIMARY KEY INDICA QUE ES CLAVE PRIMARIA Y NOT NULL QUE NO PUEDEN TENER VALORES NULOS
--IDENTITY ES PARA DEFINIR QUE ES AUTOINCREMENTAL
CREATE TABLE farms (
	idFarm INT PRIMARY KEY NOT NULL IDENTITY(101,1),
	nameFarm VARCHAR (50),
	direccion VARCHAR (50),
	telefono VARCHAR (50))
GO

CREATE TABLE chickens (
	idChicken INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	nameChicken VARCHAR (50),
	farmRef INT FOREIGN KEY REFERENCES farms(idFarm) on delete cascade)
GO

--LA COLUMNA SOLD ES TIPO BIT(O NO VENDIDO 1 VENDIDO)
CREATE TABLE eggs (
	idEgg INT PRIMARY KEY NOT NULL IDENTITY(1001,1),
	chickenRef INT ,
	farmRef INT FOREIGN KEY REFERENCES farms(idFarm) ON DELETE CASCADE,
	sold BIT)
GO

CREATE TABLE orders (
	idOrder INT PRIMARY KEY NOT NULL IDENTITY(11,1),
	fecha DATETIME,
	customer INT,
	farmRef INT CONSTRAINT farmFK FOREIGN KEY(farmRef)
	REFERENCES farms(idFarm) on delete cascade)
GO

CREATE TABLE eggsOrder (
	idEgg INT FOREIGN KEY REFERENCES eggs(idEgg) on delete cascade,
	idOrder INT FOREIGN KEY REFERENCES orders(idOrder))
GO

--MUESTRA LAs TABLAS, QUE TODAVIA NO TIENEN NINGUN DATO
SELECT * FROM farms
SELECT * FROM chickens
SELECT * FROM eggs
SELECT * FROM orders
SELECT * FROM eggsOrder
GO

/*ELIMINAR LA BASE DE DATOS
(ESTA COMENTADO PARA QUE NO SE EJECUTE, DE LO CONTRARIO SE BORRARIA TODO LO ANTERIOR)
ANTES DE EJECUTARLAS CHEQUEAR QUE NO TENMOS OTRAS QUERYS ABIERTAS EJECUTANDO LA BASE DE DATOS

USE master   
GO  
DROP DATABASE chickenTest
GO
*/