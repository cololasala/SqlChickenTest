--BASE DE DATOS QUE SE VA A UTILIZAR
USE chickenTest
GO

--SE CREAN LOS STORAGE PROCEDURES

--MUESTRA LAS GALLINAS QUE PERTENECEN A LA GRANJA CUYO ID ES 101
CREATE PROC mostrarGallinas
AS
	SELECT * FROM chickens WHERE farmRef = 101
GO

--INSERTA NUEVAS GALLINAS CON LOS PARAMETROS DE NOMBRE DE GALLINA E ID DE GRANJA
--MANEJO DE EXCEPCIONES, ERROR_NUMBER MUESTRA EL NUMERO DE ERROR
--ERROR_MESSAGE MUESTRA PORQUE SUCEDE EL ERROR
CREATE PROCEDURE insertarGallinas
	@nombreGallina varchar(50),
	@idGranja int
AS
	BEGIN TRY
		INSERT INTO chickens (nameChicken, farmRef) SELECT @nombreGallina, @idGranja;
	END TRY

	BEGIN CATCH
		SELECT ERROR_NUMBER(),ERROR_MESSAGE()
	END CATCH
GO

---ELIMINAR LOS PROCEDURES
IF OBJECT_ID('insertarGallinas') is not null
	DROP PROC insertarGallinas
ELSE
	PRINT 'El procedure no existe'
GO

--PROCEDIMIENTO CON PARAMETROS DE ENTRADA
CREATE PROC mostrarGranja
	@nombre varchar (50)
AS
	SELECT * FROM farms WHERE nameFarm = @nombre
GO

--PROCEDIMIENTO CON PARAMETROS DE SALIDA, VERIFICA LOS HUEVOS QUE SE PUEDEN VENDER
CREATE PROCEDURE verificarStock
	@idGranja INT,
	@stock INT OUTPUT
AS
	SET @stock = (SELECT COUNT(sold) FROM eggs WHERE farmRef=@idGranja and sold=0);
GO

--PROCEDIMIENTO QUE VERIFICA SI SE PUEDE REALIZAR LA ORDEN SEGUN LA CANTIDAD DE HUEVOS PEDIDOS
CREATE PROC verificarPedido
	@cantHuevos INT,
	@idGranja INT
AS
	BEGIN
		DECLARE @stockGranja INT
		EXEC verificarStock @idGranja, @stockGranja OUTPUT --ANIDACION DE PROCEDIMIENTOS
		IF (@stockGranja > @cantHuevos)
			PRINT 'se puede realizar la orden'
		ELSE
			PRINT 'no se puede realizar la orden'
	END
GO