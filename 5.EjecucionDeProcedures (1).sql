--BASE DE DATOS QUE SE VA A UTILIZAR
USE chickenTest
GO

--SE EJECUTAN LOS PROCEDURES DECLARADOS ANTERIORMENTE

EXEC mostrarGallinas
GO

EXEC insertarGallinas 'gallinita', 101
GO
SELECT * FROM chickens

EXEC mostrarGranja 'Astrogranja'
GO

DECLARE @stockGranja INT	--DECLARACION DE UNA VARIABLE
EXEC verificarStock 101, @stockGranja OUTPUT
SELECT @stockGranja

EXEC verificarPedido 2, 102
GO
