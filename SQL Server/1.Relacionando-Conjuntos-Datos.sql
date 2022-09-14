---------------------------------------------------------------------------------------------------------

-- JOINS

---------------------------------------------------------------------------------------------------------



--1)Mostrar  los empleados que también son vendedores 

--tablas: HumanResources.Employee, Sales.SalesPerson

--campos: BusinessEntityID

SELECT		e.BusinessEntityID

FROM		HumanResources.Employee AS e

INNER JOIN	Sales.SalesPerson AS s

ON			e.BusinessEntityID = s.BusinessEntityID;



--2)Mostrar  los empleados ordenados alfabéticamente por apellido y por nombre 

--tablas: HumanResources.Employee, Person.Person

--campos: BusinessEntityID, LastName, FirstName

SELECT		p.LastName,p.FirstName

FROM		HumanResources.Employee AS e

INNER JOIN	Person.Person AS p

ON			e.BusinessEntityID = p.BusinessEntityID

ORDER BY	p.LastName,p.FirstName;

--3)Mostrar el código de logueo, número de territorio y sueldo básico de los vendedores 

--tablas: HumanResources.Employee, Sales.SalesPerson

--campos: e.LoginID, TerritoryID, Bonus, BusinessEntityID

SELECT		e.LoginID,

			TerritoryID,

			Bonus

FROM		HumanResources.Employee AS e

INNER JOIN	Sales.SalesPerson AS s

ON			e.BusinessEntityID = s.BusinessEntityID;



--4)Mostrar los productos que sean ruedas 

--tablas: Production.Product, Production.ProductSubcategory

--campos: Name, ProductSubcategoryID

SELECT	s.Name

FROM	Production.Product p

INNER JOIN Production.ProductSubcategory s 

ON p.ProductSubcategoryID = s.ProductSubcategoryID

WHERE	s.Name = 'Wheels';



--5)Mostrar los nombres de los productos que no son bicicletas 

--tablas:Production.Product, Production.ProductSubcategory

--campos: Name, ProductSubcategoryID

SELECT	p.Name 

FROM	Production.Product p

INNER JOIN Production.ProductSubcategory s ON s.ProductSubcategoryID = p.ProductSubcategoryID

WHERE	  s.Name NOT LIKE '%Bikes';

--6)Mostrar los precios de venta de aquellos productos donde el precio de venta sea inferior 

--  al precio de lista recomendado para ese producto ordenados por nombre de producto

--tablas: Sales.SalesOrderDetail, Production.Product

--campos: ProductID, Name, ListPrice, UnitPrice

SELECT		DISTINCT p.ProductID, 

			p.Name producto, 

			p.ListPrice [precio de lista], 

			sd.UnitPrice AS 'Precio de Venta recomendado'

FROM		Sales.SalesOrderDetail AS sd

INNER JOIN	Production.Product AS p 

ON			sd.ProductID = p.ProductID AND sd.UnitPrice < p.ListPrice;



--7)Mostrar todos los productos que tengan igual precio. 

-- Se deben mostrar de a pares, código y nombre de cada uno de los dos productos y el precio de ambos.

-- ordenar por precio en forma descendente 

--tablas:Production.Product

--campos: ProductID, ListPrice, Name

SELECT	p1.ProductiD, p1.Name, p1.ListPrice

		,p2.ProductiD, p2.Name, p2.ListPrice 

FROM		Production.Product p1

INNER JOIN	Production.Product p2

ON			p1.ListPrice = p2.ListPrice

WHERE		p1.ProductID > p2.ProductID

ORDER BY	p1.ListPrice DESC;

--8)Mostrar el nombre de los productos y de los proveedores cuya subcategoría es 13 ordenados por nombre de proveedor 

--tablas: Production.Product, Purchasing.ProductVendor, Purchasing.Vendor

--campos: Name ,ProductID,  BusinessEntityID, ProductSubcategoryID

SELECT  pp.Name as Producto

		, pe.Name  Proveedor

FROM	

		Production.Product pp

		INNER JOIN Purchasing.ProductVendor pv 

		ON pp.ProductID = pv.ProductID



		INNER JOIN Purchasing.Vendor pe

		ON pv.BusinessEntityID=pe.BusinessEntityID

WHERE pp.ProductSubcategoryID=13;





--9)Mostrar todas las personas (nombre y apellido) y en el caso que sean empleados mostrar también el login id, sino mostrar null 

--tablas: Person.Person, HumanResources.Employee 

--campos: FirstName, LastName, LoginID, BusinessEntityID

SELECT	pe.firstname, pe.lastname,	he.LoginID

FROM	Person.Person pe   

		LEFT JOIN HumanResources.Employee he

		ON pe.BusinessEntityID = he.BusinessEntityID

