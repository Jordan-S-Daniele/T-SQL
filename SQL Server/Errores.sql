--1)Incrementar el precio a 200 para todos los productos cuyo precio sea igual a cero 
--y confirmar la transacción.

--Tablas: Production.Product
--Campos: ListPrice

BEGIN TRAN

	UPDATE Production.Product 

	SET ListPrice=0

	WHERE ListPrice=200
COMMIT

/* 2) Obtener el promedio del listado de precios y guardarlo en una variable llamada 
@Promedio. Incrementar 

--todos los productos un 15% pero si el precio mínimo no supera el promedio,
revertir toda la operacion
--Tablas: Production.Product
--Campos: ListPrice
*/

BEGIN TRAN

DECLARE @prom MONEY;

SELECT @prom = AVG([ListPrice]) FROM [Production].[Product]

UPDATE [Production].[Product] 

	SET [ListPrice] = [ListPrice] * 1.15 

IF @prom < ( SELECT MIN([ListPrice]) from [Production].[Product]) 

	ROLLBACK TRAN

ELSE

COMMIT

----------------------------------------------------------------------

-- Captura de Errores

SELECT * FROM sys.messages

-- 1)  REALIZAR UNA DIVISIÓN POR CERO Y ATRAPAR EL ERROR UTILIZANDO VARIABLES DE SISTEMA (REVERTIR LA TRANSACCIÓN). 

BEGIN TRANSACTION

SELECT 1/0;	
IF @@ERROR<>0
	BEGIN 
		ROLLBACK TRANSACTION;	
		RETURN; 
END
COMMIT TRANSACTION
GO

-- 2) REALIZAR UNA DIVISIÓN POR CERO Y ATRAPAR EL ERROR SIN UTILIZAR VARIABLES DE SISTEMA 
--    (REVERTIR LA TRANSACCIÓN).

BEGIN TRY
	BEGIN TRANSACTION
			
	SELECT 1/0;	
		
	COMMIT TRANSACTION

END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;

	THROW; 
END CATCH

-- 3BEGIN TRY	BEGIN TRANSACTION				SELECT 1/0;				COMMIT TRANSACTIONEND TRYBEGIN CATCH			ROLLBACK TRANSACTION;			RAISERROR (		      'Aqui el error personalizado ', -- Mensaje personalizado.  		         16, -- Severidad.  		         1 -- Estado.                     ); END CATCH
