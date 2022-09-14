-------------------------------------------------------------------

-- LABORATORIO FUNCIONES DE AGREGADO

-------------------------------------------------------------------

--1)Mostrar la fecha más reciente de venta 

--Tablas: Sales.SalesOrderHeader

--Campos: OrderDate

SELECT MAX(OrderDate) AS FechaReciente

FROM Sales.SalesOrderHeader;





--2)Mostrar el precio más barato de todas las bicicletas 

--Tablas: Production.Product

--Campos: ListPrice, ProductNumber

SELECT MIN(ListPrice) AS Precio

FROM Production.Product

WHERE Name LIKE '%BIKE%';





--3)Mostrar la fecha de nacimiento del empleado más joven 

--Tablas: HumanResources.Employee

--Campos: BirthDate

SELECT MAX(BirthDate) AS FechaNacimiento

FROM HumanResources.Employee;

--4)Mostrar el promedio del listado de precios de productos

--Tablas: Production.Product

--Campos: BirthDate

SELECT AVG(ListPrice) AS Promedio

FROM Production.Product;





--5)Mostrar la cantidad y el total vendido por productos 

--Tablas: Sales.SalesOrderDetail

--Campos: BirthDate

SELECT	COUNT(1)		AS Cantidad

		,SUM(LineTotal) AS Total

FROM Sales.SalesOrderDetail;