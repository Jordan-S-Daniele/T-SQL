---------------------------------------------------------------------------------------------------------

---- INSERT, UPDATE Y DELETE

---------------------------------------------------------------------------------------------------------



--1)Clonar estructura y datos de los campos id, nombre, color y precio de lista de la tabla production.product en una tabla llamada Productos 

--tablas: Production.Product

--campos: Name, Color, ListPrice

SELECT ProductID, Name, Color, ListPrice

INTO Productos

FROM Production.Product



--2)Aumentar un 20% el precio de lista de todos los productos  

--tablas: Produccion

--campos: ListPrice

UPDATE	Productos

SET		ListPrice = ListPrice * 1.2

				

--3)Aumentar un 20% el precio de lista de los productos del proveedor 1540 

--tablas:Produccion, Purchasing.ProductVendor

--campos: ProductID, ListPrice, BusinessEntityID

UPDATE	p 

SET		ListPrice = ListPrice * 1.2

FROM	Productos p

INNER JOIN Purchasing.ProductVendor v ON p.ProductID = v.ProductID 

WHERE	 v.BusinessEntityID = 1540

--4)Eliminar los productos cuyo precio es igual a cero

--tablas: Produccion

--campos: ListPrice

DELETE  

FROM Productos

WHERE ListPrice=0;



--5)Insertar un producto dentro de la tabla productos.tener en cuenta los siguientes datos. el color de producto debe ser rojo, el nombre debe ser "bicicleta mountain bike" y el precio de lista debe ser de 4000 pesos.

--tablas:productos

--campos: Color,Name, ListPrice

INSERT INTO	productos(Color, Name,ListPrice)

VALUES ('Rojo', 'Bicicleta Mountain Bike', 4000);



--6)Aumentar en un 15% el precio de los pedales de bicicleta

--tablas: productos

--campos: Name, ListPrice

UPDATE productos 

SET ListPrice=ListPrice*1.15

WHERE name like'%pedal%';



--7)Eliminar de las productos cuyo nombre empiece con la letra m

--tablas: productos

--campos: Name

DELETE FROM productos 

WHERE Name LIKE 'm%';


--8)Borrar todo el contenido de la tabla personas sin utilizar la instrucción delete.

--tablas: productos

TRUNCATE TABLE productos;



--9)Eliminar tabla productos

--tablas: productos

DROP TABLE productos;