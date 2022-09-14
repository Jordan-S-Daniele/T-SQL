-- FUNCIONES AGREGADO/* Una función de agregado realiza un cálculo sobre un  conjunto de valores y devuelve un solo valor.Las funciones de agregado ignoran los valores NULL.Las funciones de agregado se suelen usar con la  cláusula GROUP BY de la instrucción SELECT.*/

--Función COUNTSELECT COUNT(*) AS CantidadFROM HumanResources.EmployeeDepartmentHistory;

--Función MAXSELECT MAX(ListPrice) AS MaximoFROM Production.Product;

--Función MINSELECT MIN(ListPrice) AS MinimoFROM Production.Product;

-- Función SUMSELECT SUM(ListPrice) AS TotalFROM Production.Product;

-- Función AVGSELECT AVG(ListPrice) AS PromedioFROM Production.Product;

-- Suma de dos columnas

SELECT SafetyStockLevel, ReorderPoint,(SafetyStockLevel + ReorderPoint) AS TOTALFROM[Production].[Product]


