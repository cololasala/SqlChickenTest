--BASE DE DATOS QUE SE VA A UTILIZAR
USE chickenTest
GO

--CREAMOS LAS TABLAS UTILIZADAS POR LOS TRIGGERS
CREATE TABLE farmsRegister (
	registerID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	idFarm INT,
	nameFarm VARCHAR (50),
	direccion VARCHAR(50),
	telefono VARCHAR (50),
	info VARCHAR (50),
	modifDate DATETIME)
GO

create table chickenRegister (
	registerID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	idChicken INT,
	nameChicken VARCHAR (50),
	farmRef int,
	info varchar(50),
	modifDate DATETIME)
GO

--SE CREAN LOS TRIGGERS

--TRIGGER ASOCIADO A INSERT DE GRANJAS
CREATE TRIGGER TRfarmInsert
ON farms FOR INSERT
AS
	BEGIN
		SET NOCOUNT ON
		INSERT INTO farmsRegister (idFarm, nameFarm, direccion, telefono, info, modifDate)
		SELECT idFarm, nameFarm, direccion, telefono, 'Granja agregada', GETDATE() FROM inserted
	END
GO

--TRIGGER PARA UPDATE DE GRANJAS
CREATE TRIGGER TRfarmUpdate
ON farms FOR UPDATE
AS
	BEGIN
		SET NOCOUNT ON
		INSERT INTO farmsRegister (idFarm, nameFarm, direccion, telefono, info, modifDate)
		SELECT idFarm, nameFarm, direccion, telefono, 'Granja Modificada', GETDATE() FROM deleted
	END
GO

--TRIGGER PARA DELETE DE GRANJAS
CREATE TRIGGER TRfarmsDelete
ON farms FOR DELETE
AS
	SET NOCOUNT ON
	BEGIN
		IF (SELECT idFarm FROM deleted) is not null
			INSERT INTO farmsRegister (idFarm, nameFarm, direccion, telefono, info, modifDate)
			SELECT idFarm, nameFarm, direccion, telefono, 'Granja Eliminada', GETDATE() FROM deleted
		ELSE PRINT('NO EXISTE LA GRANJA')
	END
GO

--TRIGGER PARA EL DELETE DE GALLINAS
--AL BORRAR UNA GALLINA SETEAMOS NULL A LA RELACION EN LA TABLA EGGS YA QUE EL EGG PERSISTE EN LA GRANJA
CREATE TRIGGER chickenDelete
ON chickens FOR DELETE
AS
	SET NOCOUNT ON
	BEGIN
		IF (SELECT TOP 1 idChicken FROM deleted) is not null
			BEGIN
				UPDATE eggs SET chickenRef= null WHERE chickenRef=(SELECT TOP 1 idChicken FROM deleted)
				INSERT INTO ChickenRegister (idChicken , nameChicken,farmRef,info ,modifDate)
				SELECT idChicken,nameChicken,farmRef,'Gallina eliminada', GETDATE() FROM deleted;
			END
		ELSE PRINT ('no existe esa gallina')
	END
GO