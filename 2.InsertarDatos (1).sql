--MUESTRA LA BASE DE DATOS QUE VA A UTILIZAR
USE chickenTest
GO

--INGRESAMOS LOS DATOS EN LAS TABLAS

--INGRESO DE GRANJAS
INSERT INTO farms values('GranjaSol', 'Calle Falsa 123', '1124566695');
INSERT INTO farms values('Astrogranja', 'Calle Falsa 345', '1100099988');
INSERT INTO farms values('Granjor', 'Calle Falsa 678', '1144433322');
GO

--INGRESO DE GALLINAS
INSERT INTO chickens values('Rita', 101);
INSERT INTO chickens values('Lili', 101);
INSERT INTO chickens values('Rosa', 102);
INSERT INTO chickens values('Mara', 102);
INSERT INTO chickens values('Leia', 102);
INSERT INTO chickens values('Ester', 103);
GO

--INGRESO DE HUEVOS
INSERT INTO eggs values(1, 101, 0);
INSERT INTO eggs values(1, 101, 0);
INSERT INTO eggs values(2, 101, 0);
INSERT INTO eggs values(2, 101, 0);
INSERT INTO eggs values(2, 101, 0);
INSERT INTO eggs values(2, 101, 0);
INSERT INTO eggs values(3, 102, 0);
INSERT INTO eggs values(3, 102, 0);
INSERT INTO eggs values(3, 102, 0);
INSERT INTO eggs values(4, 102, 0);
INSERT INTO eggs values(4, 102, 0);
INSERT INTO eggs values(6, 103, 0);
INSERT INTO eggs values(6, 103, 0);
INSERT INTO eggs values(6, 103, 0);
INSERT INTO eggs values(2, 101, 0);
INSERT INTO eggs values(2, 101, 0);
INSERT INTO eggs values(3, 102, 0);
INSERT INTO eggs values(3, 102, 0);
GO

--INGRESO DE UNA ORDEN
INSERT INTO orders SELECT GETDATE(), 10987, 101
GO
--INGRESO DE HUEVOS A LA ORDEN
INSERT INTO eggsOrder SELECT 1001,11 UPDATE eggs SET sold=1 WHERE idEgg=1001
INSERT INTO eggsOrder SELECT 1002,11 UPDATE eggs SET sold=1 WHERE idEgg=1002
INSERT INTO eggsOrder SELECT 1003,11 UPDATE eggs SET sold=1 WHERE idEgg=1003
INSERT INTO eggsOrder SELECT 1004,11 UPDATE eggs SET sold=1 WHERE idEgg=1004
INSERT INTO eggsOrder SELECT 1005,11 UPDATE eggs SET sold=1 WHERE idEgg=1005
GO

--MUESTRA LAS TABLAS
SELECT * FROM farms
SELECT * FROM chickens
SELECT * FROM eggs
SELECT * FROM orders
SELECT * FROM eggsOrder
GO