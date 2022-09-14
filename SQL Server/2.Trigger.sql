------------------------------------------------------
--	TRIGGER
-- ---------------------------------------------------

--1)Clonar estructura (ProductID, ListPrice) y datos de la tabla Production.Product en una tabla llamada Productos.
SELECT ProductID, ListPrice
INTO Productos
FROM Production.Product;
GO

--2)Crear un trigger sobre la tabla Productos llamado TR_ActualizaPrecios dónde actualice 
--la tabla  #HistoricoPrecios con  los cambios de precio.
Tablas: Productos 
Campos: ProductID, ListPrice


CREATE TRIGGER Production.TR_ActualizaPrecios ON Production.Product
AFTER UPDATE
AS
		UPDATE  P
		SET ListPrice=i.ListPrice
		FROM Productos P	
		INNER JOIN inserted i
		ON P.ProductID=i.ProductID
GO

UPDATE [Production].[Product]
SET ListPrice=20
WHERE ProductID=707
SELECT * FROM Productos
WHERE ProductID=707
GO

--3) Adaptar el trigger del punto anterior donde valide que el precio no pueda ser negativo.

ALTER TRIGGER Production.TR_ActualizaPrecios ON Production.Product
INSTEAD OF UPDATE
AS

		IF EXISTS (SELECT 1 FROM inserted WHERE ListPrice>0)
		BEGIN
			UPDATE  P
			SET ListPrice=i.ListPrice
			FROM Productos P	
			INNER JOIN inserted i
			ON P.ProductID=i.ProductID
		END
GO

UPDATE Production.Product
SET ListPrice=-1
WHERE ProductID=707

SELECT ListPrice
FROM Production.Product
WHERE ProductID=707
