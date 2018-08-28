--BASE DE DATOS QUE SE VA A UTILIZAR
USE chickenTest
GO

--TEST FUNCIONAMIENTO TRIGGER INSERT DE GRANJA
INSERT INTO farms VALUES ('GranjaNueva', 'Falsa Nueva', 1198765478)
GO

SELECT * FROM farms
SELECT * FROM farmsRegister
GO

--TEST FUNCIONAMIENTO TRIGGER UPDATE DE GRANJA
UPDATE farms SET telefono = 1524500716 WHERE idFarm=104
GO

SELECT * FROM farms
SELECT * FROM farmsRegister
GO

--TEST FUNCIONAMIENTO DE DELETE DE GRANJA
DELETE FROM farms WHERE idFarm = 102
GO

SELECT * FROM farms
SELECT * FROM chickens
SELECT * FROM farmsRegister
GO

--TEST FUNCIONAMIENTO DELETE DE CHICKEN
DELETE FROM chickens WHERE idChicken = 2
GO

SELECT * FROM chickens
SELECT * FROM eggs
SELECT * FROM chickenRegister
GO