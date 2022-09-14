---------------------------------------------------------
-- LABORATORIO AGRUPAMIENTO
---------------------------------------------------------
--1)Mostrar el código de subcategoría y el precio del producto más barato de cada una de ellas 
--Tablas: Production.Product
--Campos: ProductSubcategoryID, ListPrice

SELECT ProductSubcategoryID, ListPrice, ProductID 
FROM Production.Product PP
WHERE ListPrice=(
					SELECT MIN(ListPrice) ListPrice
					FROM Production.Product PP1
					WHERE PP.ProductSubcategoryID=PP1.ProductSubcategoryID 
			    )
ORDER BY ProductSubcategoryID

--2)Mostrar los productos y la cantidad total vendida de cada uno de ellos
--Tablas: Sales.SalesOrderDetail
--Campos: ProductID, OrderQty
SELECT ProductID
	   ,SUM(OrderQty) AS Cantidad
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

--3)Mostrar los productos y el  total vendido de cada uno de ellos, ordenarlos por el total vendido
--Tablas: Sales.SalesOrderDetail
--Campos: ProductID, LineTotal
SELECT ProductID
	   ,SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(LineTotal);

--4)Mostrar el promedio vendido por factura. 
--Tablas: Sales.SalesOrderDetail
--Campos: SalesOrderID, LineTotal
SELECT SalesOrderID
	   ,AVG(LineTotal) AS Promedio
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID;


------------------------------------------------------------
-- LABORATORIO HAVING
------------------------------------------------------------
--1)Mostrar todas las facturas realizadas y el total facturado de cada una de ellas ordenado por número de factura  pero sólo de aquellas órdenes superen un total de $10.000 
--Tablas: Sales.SalesOrderDetail
--Campos: SalesOrderID, LineTotal
SELECT SalesOrderID
	   ,SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal)>10000;

--2)Mostrar la cantidad de facturas que vendieron más de 20 unidades 
--Tablas: Sales.SalesOrderDetail
--Campos: SalesOrderID, OrderQty
SELECT SalesOrderID
	   ,SUM(OrderQty) AS Total
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(OrderQty)>20;

--3)Mostrar las subcategorías de los productos que tienen dos o más productos que cuestan menos de $150 
--Tablas: Production.Product
--Campos: ProductSubcategoryID, ListPrice
SELECT  ProductSubcategoryID
		,COUNT(ProductSubcategoryID) AS Cantidad
 FROM Production.Product
 WHERE ListPrice>150
 GROUP BY ProductSubcategoryID
 HAVING COUNT(ProductSubcategoryID)>2

--4)Mostrar todos los códigos de categorías existentes junto con la cantidad de productos y el precio de lista promedio 
-- por cada uno de aquellos productos que cuestan más de $ 70 y el precio promedio es mayor a $ 300.
--Tablas: Production.Product
--Campos: ProductSubcategoryID, ListPrice
SELECT  ProductSubcategoryID
		,COUNT(ProductSubcategoryID)	AS Cantidad
		,AVG(ListPrice)					AS Promedio 
 FROM Production.Product
 WHERE ListPrice>70
 GROUP BY ProductSubcategoryID
 HAVING AVG(ListPrice)>300;

--------------------------------------------------------------
-- LABORATORIO ROLLUP
--------------------------------------------------------------
--1)Mostrar el número de factura, el monto vendido, y al final, totalizar la facturación.
--Tablas: Sales.SalesOrderDetail
--Campos: SalesOrderID, UnitPrice, OrderQty
SELECT SalesOrderID
	   ,SUM(UnitPrice*OrderQty) AS Total
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID WITH ROLLUP;