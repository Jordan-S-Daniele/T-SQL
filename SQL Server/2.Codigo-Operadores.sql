--1) Mostrar los empleados que tienen más de 90 horas de vacaciones. 
--tablas: HumanResources.Employee
--campos: VacationHours
SELECT BusinessEntityID
	   ,VacationHours
FROM HumanResources.Employee
WHERE VacationHours>90;

--2) Mostrar el nombre, precio y precio con iva de los productos con precio distinto de cero.
--tablas:Production.Product
--campos: Name, ListPrice
SELECT	Name producto, ListPrice [precio de lista], ListPrice * 1.21 [precio con IVA]
FROM	Production.Product
WHERE 	ListPrice<>0;

--3) Mostrar precio y nombre de los productos 776, 777, 778.
--tablas:Production.Product
--campos: ProductID, Name, ListPrice
SELECT  Name, ListPrice
FROM Production.Product
WHERE (ProductID=776 OR ProductID=777 OR ProductID=778);

--4) Mostrar el nombre concatenado con el apellido de las personas cuyo apellido sea johnson.
--tablas:Person.Person
--campos: FirstName, LastName
SELECT FirstName+' '+LastName 'Persona'
FROM Person.Person
WHERE LastName = 'Johnson';

--5) Mostrar todos los productos cuyo precio sea inferior a 150$ de color rojo o cuyo precio sea mayor a 500$ de color negro.
--tablas:Production.Product
--campos: ListPrice, Color
SELECT ListPrice, Color
FROM Production.Product
WHERE (ListPrice <= 150 AND Color='red') OR (ListPrice >= 500 AND Color='black');

--6) Mostrar el código, fecha de ingreso y horas de vacaciones de los empleados ingresaron a partir del año 2000. 
--tablas: HumanResources.Employee
--campos: BusinessEntityID, HireDate, VacationHours
SELECT	BusinessEntityID AS 'codigo de Empleado', 
		HireDate as 'fecha de ingreso', 
		VacationHours as 'horas de vacaciones'
FROM HumanResources.Employee
WHERE HireDate > '2000/01/01'; 

--7) Mostrar el nombre, número de producto, precio de lista y el precio de lista incrementado en un 10%  
--   de los productos cuya fecha de fin de venta sea anterior al día de hoy.
--tablas:Production.Product
--campos: Name, ProductNumber, ListPrice, SellEndDate
SELECT Name, ProductNumber, ListPrice AS OldPrice, ListPrice * 1.1 AS NewPrice
FROM Production.Product
WHERE SellEndDate < GETDATE();


---------------------------------------------------------------
-- LABORATROIO NULL
---------------------------------------------------------------

--1) Mostrar los representantes de ventas (vendedores) que no tienen definido el número de territorio.
--tablas: Sales.SalesPerson
--campos: BusinessEntityID, TerritoryID
SELECT BusinessEntityID
FROM Sales.SalesPerson
WHERE TerritoryID  IS NULL;

--2) Mostrar el peso de todos los artículos. si el peso no estuviese definido, reemplazar por cero.
--tablas: Production.Product
--campos: Weight
SELECT ISNULL(Weight,0) Weight
FROM Production.Product;