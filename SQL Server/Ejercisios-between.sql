-- EJERCICIO BETWEEN

/*
1) Mostrar todos los productos cuyo precio de lista esté entre 200 y 300. --tablas:Production.Product	--campos: ListPrice*/SELECT ListPriceFROM Production.ProductWHERE ListPrice BETWEEN 200 AND 300;

/*
2) Mostrar todos los empleados que nacieron entre 1970 y 1985. --tablas: HumanResources.Employee--campos: BirthDate*/SELECT BirthDateFROM HumanResources.EmployeeWHERE YEAR(BirthDate) BETWEEN 1970 AND 1985;


/*
3) Mostrar el la fecha,numero de version y subtotal de las ventas efectuadas en los años 2005 y 2006. --tablas: Sales.SalesOrderHeader--campos: OrderDate, AccountNumber, SubTotal*/SELECT OrderDate, AccountNumber, SubTotalFROM Sales.SalesOrderHeaderWHERE YEAR(OrderDate) BETWEEN 2010 AND 2011;

/*
4) Mostrar todos los productos cuyo precio de lista  no esté entre 50 y 70.--tablas:Production.Product	--campos: ListPrice*/SELECT ListPriceFROM Production.ProductWHERE ListPrice NOT BETWEEN 50 AND 70;
