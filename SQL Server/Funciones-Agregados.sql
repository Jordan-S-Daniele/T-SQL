-- FUNCIONES AGREGADO/* Una funci�n de agregado realiza un c�lculo sobre un  conjunto de valores y devuelve un solo valor.Las funciones de agregado ignoran los valores NULL.Las funciones de agregado se suelen usar con la  cl�usula GROUP BY de la instrucci�n SELECT.*/

--Funci�n COUNTSELECT COUNT(*) AS CantidadFROM HumanResources.EmployeeDepartmentHistory;

--Funci�n MAXSELECT MAX(ListPrice) AS MaximoFROM Production.Product;

--Funci�n MINSELECT MIN(ListPrice) AS MinimoFROM Production.Product;

-- Funci�n SUMSELECT SUM(ListPrice) AS TotalFROM Production.Product;

-- Funci�n AVGSELECT AVG(ListPrice) AS PromedioFROM Production.Product;

-- Suma de dos columnas

SELECT SafetyStockLevel, ReorderPoint,(SafetyStockLevel + ReorderPoint) AS TOTALFROM[Production].[Product]


