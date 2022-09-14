/* EJERCICIOS NULL
--1) Mostrar los representantes de ventas (vendedores) que no tienen definido el número de territorio.--tablas: Sales.SalesPerson--campos: BusinessEntityID, TerritoryID*/SELECT BusinessEntityIDFROM Sales.SalesPersonWHERE TerritoryID  IS NULL;


/*--2) Mostrar el peso de todos los artículos. si el peso no estuviese definido, reemplazar por cero.--tablas: Production.Product--campos: Weight*/SELECT ISNULL(Weight,0) WeightFROM Production.Product;