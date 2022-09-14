---------------------------------------------------------------------------------------------------------

---- TABLAS TEMPORALES - CTE

--------------------------------------------------------------------------------------------------------



--1)Clonar estructura y datos de los campos nombre, color y precio de lista de la tabla production.product en una tabla llamada #Productos 

--tablas:Production.Product

--campos: Name, ListPrice, Color

SELECT	Color, Name, ListPrice

INTO	#Productos

FROM	Production.Product;



--2)Clonar solo estructura de los campos identificador, nombre y apellido de la tabla person.person en una tabla llamada #Personas

--tablas: Person.Person

--campos: BusinessEntityID, FirstName, LastName

SELECT	BusinessEntityID, FirstName, LastName

INTO	#personas

FROM	Person.Person

WHERE 1=2;



--3)Eliminar si existe la tabla Productos

--tablas: Productos

IF OBJECT_ID (N'tempdb..#Productos', N'U') IS NOT NULL

		DROP TABLE #Productos;

GO

--4)Eliminar si existe la tabla Personas

--tablas: Personas

IF OBJECT_ID (N'tempdb..#Personas', N'U') IS NOT NULL

		DROP TABLE #Personas;

GO



--5)Crear una CTE con las órdenes de venta

--tablas: Sales.SalesOrderHeader

--campos: SalesPersonID, SalesOrderID, OrderDate 

WITH Sales_CTE (SalesPersonID, SalesOrderID, SalesYear)  

AS    

(  

    SELECT  SalesPersonID

			,SalesOrderID 

			,YEAR(OrderDate) AS Anio  

    FROM 

			Sales.SalesOrderHeader  

    WHERE 

			SalesPersonID IS NOT NULL  

)  

SELECT SalesPersonID, SalesOrderID, SalesYear

FROM [Sales_CTE] 